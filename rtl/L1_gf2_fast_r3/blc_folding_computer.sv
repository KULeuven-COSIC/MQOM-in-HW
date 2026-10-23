
`include "mqom2_main_header.vh"

`default_nettype none

module blc_folding_computer (
    input wire  rst,
    input wire  clk,
    
    input wire [`RAW_CHUNK_BITS-1:0]                    raw_chunk,
    input wire                                          raw_chunk_valid,
    input wire [$clog2(`MQOM2_PARAM_NB_EVALS_LOG2)-1:0] p_i,
    input wire [`MQOM2_PARAM_NB_EVALS_LOG2-1:0]         eval_point_r,
    
    input wire                                          verify,
    
    input wire [`DELTA_X_WORD_REG_W-1:0]                x_word, // max 64
    input wire                                          x_word_valid,
    
//    input wire                                          last_mpc_round,

//    input wire [`DELTA_X_WORD_REG_W-1:0]                delta_x_word_in, // max 64
    input wire                                          delta_x_word_in_valid,
    
    output reg [`DELTA_X_WORD_REG_W-1:0]                delta_x_word, // max 64
    output reg                                          delta_x_word_valid,
    
    output reg [`MQOM2_PARAM_NB_EVALS_LOG2-1:0]         eval_point_r_hold,
    
    output reg [`GF256_ELEM_PARAL_WIDTH-1:0]            x0_word, // exactly 2 GF256 elements = 16 bits
    output reg [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0]  u0_u1_word, // exactly 1 GF256 element  =  8 bits
    output reg [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0]  u0_word, // exactly 1 GF256 element  =  8 bits
    output reg [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0]  u1_word, // exactly 2 GF256 elements = 16 bits
    output reg                                          x_0_word_valid,
    output reg                                          u_0_word_valid,
    output reg                                          u_1_word_valid,
    
    output reg                                          x_0_done,
    output reg                                          u_0_done,
    output reg                                          u_1_done,
    
    output reg [`WORD_BITS-1:0]                         u0_u1_word_full_width,
    output reg                                          u0_u1_word_full_valid,
    output reg                                          u0_u1_word_full_valid_next,
    output reg                                          u0_word_coming_out,
    output reg                                          u1_word_coming_out,
    
    output reg                                          send_x,
    output reg [$clog2(`TAU)-1:0]                       e
);

//wire debug_wire = ((raw_chunk=='h0) && raw_chunk_valid);

//reg [`MQOM2_PARAM_NB_EVALS_LOG2-1:0] eval_point_r_hold;
wire [`RAW_CHUNK_BITS-1:0] acc_chunk_new = acc_chunk_old ^ raw_chunk_pip2;

localparam ACC_ITER = (`MQOM_NB_EVALS_DIV_NUM_PARALLEL_ENC/2); // always power of 2
localparam ACC_ITER_LOG2 = $clog2(ACC_ITER);

localparam X_REG_WIDTH = `DELTA_X_WORD_REG_W;

localparam U_1_START_CHUNK = `U_1_START_CHUNK;

typedef enum logic [3:0] {
    S_INIT_MEMS,
    S_ACC_0,
    S_ACC_1,
    S_COMP_DELTA_X,
    S_COMBINE_FD,
    S_SEND_X0_U0,
    S_SEND_U1,
    S_WAIT_DELTA_X,
    S_APPLY_CORRECTION
} state_fold_comp_t;

//(* fsm_encoding = "one_hot" *)
state_fold_comp_t state_fold_comp;

reg state_acc_0_pip;

//typedef enum logic [0:0] {
//    FREEZE_CTR,
//    INCR_CTR
//} state_fold_comp_t;

//counter_opcode_t counter_opc;

reg [ACC_ITER_LOG2-1:0] iter_counter;
reg                     iter_counter_MSB_pip;
reg                     iter_counter_plus1;
reg                     acc_done;

localparam LEAF_BATCH_SIZE_0 = 2*`NUM_PARALLEL_ENC*2;
localparam LEAF_BATCH_SIZE_1 = 2*`NUM_PARALLEL_ENC*(`RAW_CHUNK_NUM-2);

reg [$clog2(LEAF_BATCH_SIZE_1)-1:0]                        raw_counter;
//reg [$clog2(LEAF_BATCH_SIZE_1)-$clog2(`RAW_CHUNK_NUM)-1:0] raw_counter_MSB_pip;
reg [$clog2(`RAW_CHUNK_NUM)-1:0]                         acc_mem_addr_read, acc_mem_addr_write;

reg write_chunk_next_fd, write_chunk_next_acc, write_chunk_fd, write_chunk_acc;
reg init_acc_pip, init_acc_pip2;

reg [$clog2(`MQOM2_PARAM_NB_EVALS_LOG2)-1:0] p_i_pip, p_i_pip2, p_i_internal;

//wire [$clog2(`RAW_CHUNK_NUM)-1:0]   fd_mem_addr_read = (state_fold_comp == S_ACC_1) ? (acc_mem_addr_read + 5*p_i_pip);

wire [$clog2(`RAW_CHUNK_NUM)+$clog2(`MQOM2_PARAM_NB_EVALS_LOG2)-1:0]   fd_mem_addr_read = acc_mem_addr_read
                                                    + 5*p_i_pip; //((state_fold_comp == S_ACC_1) ? (p_i) : `RAW_CTR_2_P_I_CLEAN(raw_counter));

reg [$clog2(`RAW_CHUNK_NUM)+$clog2(`MQOM2_PARAM_NB_EVALS_LOG2)-1:0]    fd_mem_addr_write;

wire [`RAW_CHUNK_BITS-1:0] acc_chunk_old, fd_j_chunk_old;

reg [`FIELD_EXT_LOG2_CARD*`RAW_CHUNK_BITS-1 : 0] fd_combine_regs;

wire [8-1:0] gf256_fd_elem_combiner_u0_dout;
gf256_fd_combiner gf256_fd_combiner_inst (
    {fd_combine_regs[56], fd_combine_regs[48], fd_combine_regs[40], fd_combine_regs[32], fd_combine_regs[24], fd_combine_regs[16], fd_combine_regs[08], fd_combine_regs[00]},
    {fd_combine_regs[57], fd_combine_regs[49], fd_combine_regs[41], fd_combine_regs[33], fd_combine_regs[25], fd_combine_regs[17], fd_combine_regs[09], fd_combine_regs[01]},
    {fd_combine_regs[58], fd_combine_regs[50], fd_combine_regs[42], fd_combine_regs[34], fd_combine_regs[26], fd_combine_regs[18], fd_combine_regs[10], fd_combine_regs[02]},
    {fd_combine_regs[59], fd_combine_regs[51], fd_combine_regs[43], fd_combine_regs[35], fd_combine_regs[27], fd_combine_regs[19], fd_combine_regs[11], fd_combine_regs[03]},
    {fd_combine_regs[60], fd_combine_regs[52], fd_combine_regs[44], fd_combine_regs[36], fd_combine_regs[28], fd_combine_regs[20], fd_combine_regs[12], fd_combine_regs[04]},
    {fd_combine_regs[61], fd_combine_regs[53], fd_combine_regs[45], fd_combine_regs[37], fd_combine_regs[29], fd_combine_regs[21], fd_combine_regs[13], fd_combine_regs[05]},
    {fd_combine_regs[62], fd_combine_regs[54], fd_combine_regs[46], fd_combine_regs[38], fd_combine_regs[30], fd_combine_regs[22], fd_combine_regs[14], fd_combine_regs[06]},
    {fd_combine_regs[63], fd_combine_regs[55], fd_combine_regs[47], fd_combine_regs[39], fd_combine_regs[31], fd_combine_regs[23], fd_combine_regs[15], fd_combine_regs[07]},
    gf256_fd_elem_combiner_u0_dout
);

reg [`RAW_CHUNK_BITS-1:0]   raw_chunk_pip, raw_chunk_pip2;

reg [`DELTA_X_WORD_REG_W-1:0] x_word_pip, x_word_pip2;
reg                           x_word_valid_pip, x_word_valid_pip2, delta_x_word_valid_pip, exit_state_comp_delta_x;

reg [$clog2(`GF2_ELEM_WORDS_PER_CHUNK)-1 : 0] sub_chunk_counter;
//reg [$clog2(`GF256_ELEM_WORDS_PER_CHUNK)-1 : 0] u1_elem_counter;
reg [$clog2(`GF256_ELEMS_PER_CHUNK)-1 : 0] u1_elem_counter;

reg [1:0] load_combine_regs_train;

//reg [`GF256_ELEM_PARAL_WIDTH-1 : 0] u_1_elems; // `X_ELEM_PARALLEL (e.g. 2) of u_1

reg exit_s_init_mems;
reg state_is_send_x0_u0_pip;
reg state_is_send_u1_pip;
reg x_0_word_valid_internal;
reg u0_word_coming, u1_word_coming;
reg u0_word_valid_pip, u0_word_valid_pip_train_pip, u1_word_valid_pip;//, u1_word_valid_pip_train_pip;

localparam U0_U1_TRAIN_WIDTH = 4;
reg [U0_U1_TRAIN_WIDTH-1:0] u0_word_valid_pip_train;
reg [U0_U1_TRAIN_WIDTH-1:0] u1_word_valid_pip_train;

reg [`WORD_BITS-1:0] u0_store_regs;
reg [`WORD_BITS-1:0] u1_store_regs;
reg [$clog2(`WORD_BITS/$bits(u0_word))-1:0] u0_store_ctr;
reg [$clog2(`WORD_BITS/$bits(u1_word))-1:0] u1_store_ctr;

always_ff @ (posedge clk) begin
    if (state_fold_comp == S_ACC_0)
        eval_point_r_hold <= eval_point_r;
    
    // ****************************************************
    // Full u0_u1_word to control module -related stuff
    if (rst)
        u0_store_ctr <= 'h0;
    else if (u_0_word_valid || |u0_word_valid_pip_train)
        u0_store_ctr <= u0_store_ctr + 1'b1;

    if (rst)
        u1_store_ctr <= 'h0;
    else if (u_1_word_valid || |u1_word_valid_pip_train)
        u1_store_ctr <= u1_store_ctr + 1'b1;
    
    if  (u_0_word_valid)
        u0_store_regs <= {u0_word, u0_store_regs[`WORD_BITS-1:$bits(u0_word)]};
    else if (`TAU%2 == 1) begin // Note: NOT 100% accurate for all ETA and TAU pairs
        if (|u0_word_valid_pip_train)
            u0_store_regs <= {'h0, u0_store_regs[`WORD_BITS-1:$bits(u0_word)]};
    end
    
    if  (u_1_word_valid)
        u1_store_regs <= {u1_word, u1_store_regs[`WORD_BITS-1:$bits(u1_word)]};
    else if (`TAU%2 == 1) begin // Note: NOT 100% accurate for all ETA and TAU pairs
        if (|u1_word_valid_pip_train)
            u1_store_regs <= {'h0, u1_store_regs[`WORD_BITS-1:$bits(u0_word)]};
    end
    
    if (u0_word_valid_pip || u0_word_valid_pip_train_pip)
        u0_u1_word_full_width <= u0_store_regs;
    else
        u0_u1_word_full_width <= u1_store_regs;
    
    u0_u1_word_full_valid_next <= ((u0_store_ctr == (`WORD_BITS/$bits(u0_word)-1) && u_0_word_valid) || (u1_store_ctr == (`WORD_BITS/$bits(u1_word)-1) && u_1_word_valid) || u0_word_valid_pip_train[U0_U1_TRAIN_WIDTH-1] || u1_word_valid_pip_train[U0_U1_TRAIN_WIDTH-1]);
    u0_u1_word_full_valid <= u0_u1_word_full_valid_next;
    
    u0_word_valid_pip <= u_0_word_valid;
    u0_word_valid_pip_train_pip <= u0_word_valid_pip_train[U0_U1_TRAIN_WIDTH-1];
    u1_word_valid_pip <= u_1_word_valid;
//    u1_word_valid_pip_train_pip <= u1_word_valid_pip_train[U0_U1_TRAIN_WIDTH-1];
    
    u0_word_valid_pip_train <= {u0_word_valid_pip_train, (u0_word_valid_pip /*&& `LAST_MPC_ROUND*/ && (state_fold_comp == S_INIT_MEMS || state_fold_comp == S_SEND_U1))};
    u1_word_valid_pip_train <= {u1_word_valid_pip_train, (u1_word_valid_pip && !u_1_word_valid /*&& `LAST_MPC_ROUND*/ && state_fold_comp == S_INIT_MEMS)};
    
    u0_word_coming <= (state_fold_comp == S_SEND_X0_U0 || state_fold_comp == S_COMBINE_FD ||u0_word_valid_pip || u0_word_valid_pip_train);
    u1_word_coming <= (state_fold_comp == S_SEND_U1 || u1_word_valid_pip || u1_word_valid_pip_train);
    
    u0_word_coming_out <= u0_word_coming;
    u1_word_coming_out <= u1_word_coming;
    // *******************
    
    if (rst)
        e <= `TAU-1;
    else if (u_0_word_valid && state_fold_comp == S_SEND_X0_U0 && sub_chunk_counter==(`GF2_ELEM_WORDS_PER_CHUNK-1) && raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==`RAW_CHUNK_NUM)
        e <= `LAST_MPC_ROUND ? 'h0 : (e + 1'b1);
    
    send_x <= acc_done;

    if (((sub_chunk_counter-'h2) & 'h3)==0 && x_0_done) // Todo: parametrize
        u0_u1_word <= gf256_fd_elem_combiner_u0_dout;
    else
        u0_u1_word <= acc_chunk_old[8*u1_elem_counter +: 8];
    
    u1_word <= acc_chunk_old[8*u1_elem_counter +: 8];
    
    if (((sub_chunk_counter-'h2) & 'h3)==0 && x_0_done)
        u0_word <= gf256_fd_elem_combiner_u0_dout;
    
    if (rst)
        u_1_word_valid <= 1'b0;
    else if (state_is_send_u1_pip && raw_counter[$clog2(`U_1_START_CHUNK)-1:0]==(`U_1_START_CHUNK-1) && u1_elem_counter==((`MQOM2_PARAM_MQ_N%`RAW_CHUNK_BITS)/8))
        u_1_word_valid <= 1'b1;
    else if (state_fold_comp == S_INIT_MEMS)
        u_1_word_valid <= 1'b0;

    if (((sub_chunk_counter-'h2) & 'h3)==0 && x_0_done) // Todo: parametrize
        u_0_word_valid <= 1'b1;
    else
        u_0_word_valid <= 1'b0;
    
    state_is_send_u1_pip <= (state_fold_comp == S_SEND_U1);
    
    if (rst)
        exit_s_init_mems <= 1'b0;
    else if (p_i_internal=='h7 && state_fold_comp==S_INIT_MEMS && raw_counter[$clog2(`RAW_CHUNK_NUM)-1:0]==(`RAW_CHUNK_NUM-1))
        exit_s_init_mems <= 1'b1;
    else
        exit_s_init_mems <= 1'b0;
        
    if (rst)
        sub_chunk_counter <= 0;
    else if (state_fold_comp == S_SEND_X0_U0)
        sub_chunk_counter <= sub_chunk_counter + 1'b1;
        
    if (rst)
        u1_elem_counter <= 0;
    else if (state_fold_comp == S_SEND_U1)
        u1_elem_counter <= u1_elem_counter + 1'b1;
    
    if (rst)
        p_i_internal <= 'b0;
    else if (exit_s_init_mems)
        p_i_internal <= 'b0;
    else if (state_fold_comp == S_INIT_MEMS || state_fold_comp == S_COMBINE_FD || (state_fold_comp==S_APPLY_CORRECTION && ~delta_x_word_in_valid && raw_counter[$clog2(`RAW_CHUNK_NUM)-1:0]==(`RAW_CHUNK_NUM-1)))
        p_i_internal <= p_i_internal + 'b1;
        
    load_combine_regs_train <= {load_combine_regs_train[0], (state_fold_comp == S_COMBINE_FD)};
    
    if (load_combine_regs_train[1]) begin
        for (int i = 0; i < (`FIELD_EXT_LOG2_CARD*`RAW_CHUNK_BITS); i++) begin
            if (p_i_pip2==(i % `FIELD_EXT_LOG2_CARD)) begin
                fd_combine_regs[i] <= fd_j_chunk_old[i / `FIELD_EXT_LOG2_CARD];
            end
        end
    end else begin
        fd_combine_regs <= (fd_combine_regs >> (`GF256_ELEM_PARAL_WIDTH));
    end
    
    x0_word <= fd_combine_regs[`GF256_ELEM_PARAL_WIDTH-1 : 0];
    
    state_is_send_x0_u0_pip <= (state_fold_comp == S_SEND_X0_U0);
    x_0_word_valid_internal <= state_is_send_x0_u0_pip; 
    x_0_word_valid <= x_0_word_valid_internal && ~x_0_done;
    
//    if (state_fold_comp == S_INIT_MEMS)
    if (state_fold_comp == S_ACC_0)
        x_0_done <= 1'b0;
    else if (sub_chunk_counter == 'h11 && raw_counter[1:0]=='h3) // Note: parametrize
        x_0_done <= 1'b1;
        
//    u_1_elems <= acc_chunk_old[`GF256_ELEM_PARAL_WIDTH*sub_chunk_counter +: `GF256_ELEM_PARAL_WIDTH];

    state_acc_0_pip <= (state_fold_comp == S_ACC_0);

    write_chunk_acc <= write_chunk_next_acc;
    write_chunk_fd <= write_chunk_next_fd;
    
    write_chunk_next_acc  <= raw_chunk_valid || (state_fold_comp == S_INIT_MEMS) || delta_x_word_in_valid;
    write_chunk_next_fd  <= (raw_chunk_valid || (state_fold_comp == S_INIT_MEMS)) || (state_fold_comp == S_APPLY_CORRECTION && !delta_x_word_in_valid && eval_point_r_hold[p_i_internal]);
    
    init_acc_pip2 <= init_acc_pip;
    init_acc_pip  <= (state_fold_comp == S_INIT_MEMS);  
      
    
    p_i_pip  <= ((state_fold_comp==S_ACC_1 || state_fold_comp==S_ACC_0) ? (p_i) : p_i_internal);
    p_i_pip2 <= p_i_pip;
    
    raw_chunk_pip2 <= raw_chunk_pip;
    raw_chunk_pip  <= raw_chunk;
    
//    acc_mem_addr_read <= (state_fold_comp == S_INIT_MEMS || state_fold_comp == S_ACC_1) ? `RAW_CTR_2_ACC_MEM_ADDR(raw_counter) : raw_counter;
    acc_mem_addr_read <= (state_fold_comp == S_ACC_1) ? `RAW_CTR_2_ACC_MEM_ADDR(raw_counter) :
                         (state_fold_comp == S_ACC_0) ?  raw_counter[0]                      : raw_counter;
                         
    acc_mem_addr_write <= acc_mem_addr_read;
    
    fd_mem_addr_write <= fd_mem_addr_read;
    
    x_word_pip  <= x_word;
    x_word_pip2 <= x_word_pip;
    delta_x_word <= ~x_word_valid_pip ? 'h0 : (x_word_pip2 ^ acc_chunk_old);
    
    x_word_valid_pip  <= x_word_valid && (raw_counter >= (`LAMBDA/`WORD_BITS));
    x_word_valid_pip2 <= x_word_valid_pip;
    delta_x_word_valid <= x_word_valid_pip2;
    delta_x_word_valid_pip <= delta_x_word_valid;
    exit_state_comp_delta_x <= (delta_x_word_valid_pip && !delta_x_word_valid);
    
    if (rst) begin
        raw_counter <= 'b0;
    end else if (exit_state_comp_delta_x || exit_s_init_mems 
            || ((sub_chunk_counter==(`GF2_ELEM_WORDS_PER_CHUNK-1) || (state_fold_comp==S_SEND_U1)) && raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==`RAW_CHUNK_NUM)
            || ((raw_counter[$clog2(`RAW_CHUNK_NUM)-1:0]==`RAW_CHUNK_NUM-1) && (state_fold_comp==S_APPLY_CORRECTION))
            || (raw_counter==(LEAF_BATCH_SIZE_0-1) && state_fold_comp == S_ACC_0)) begin
        raw_counter <= 'b0;
    end else begin
        if (raw_chunk_valid || ((state_fold_comp == S_INIT_MEMS || state_fold_comp == S_COMBINE_FD) && p_i_internal=='h7) || x_word_valid || (u1_elem_counter==`GF256_ELEMS_PER_CHUNK-3) || (state_fold_comp==S_APPLY_CORRECTION))
            raw_counter <= (raw_counter == (LEAF_BATCH_SIZE_1-1)) ? 0 : (raw_counter + 1'b1);
    end
        
    iter_counter_plus1 <= (((raw_counter == (LEAF_BATCH_SIZE_0-1)) && (state_fold_comp == S_ACC_0)) || (raw_counter[0 +: $clog2(LEAF_BATCH_SIZE_1)] == (LEAF_BATCH_SIZE_1-1))) && raw_chunk_valid;
    
    if (rst) begin
        iter_counter_MSB_pip <= 1'b0;
        iter_counter <= 'b0;
    end else begin
        if (state_acc_0_pip)
            iter_counter_MSB_pip <= 1'b0;
        else
            iter_counter_MSB_pip <= iter_counter[ACC_ITER_LOG2-1];
        
        if (iter_counter_plus1)
            iter_counter <= iter_counter + 1'b1;
    end
    
    if (rst)
        acc_done <= 1'b0;
    else 
//        acc_done <= (iter_counter_MSB_pip && !iter_counter[ACC_ITER_LOG2-1]);
        acc_done <= (iter_counter_MSB_pip && !iter_counter[ACC_ITER_LOG2-1]) || (state_fold_comp==S_ACC_0 && iter_counter==ACC_ITER-1 && raw_counter[0 +: $clog2(LEAF_BATCH_SIZE_0)]==(LEAF_BATCH_SIZE_0-2));
    
    if (rst)
        u_0_done <= 1'b0;
    else if (sub_chunk_counter==(`GF2_ELEM_WORDS_PER_CHUNK-1) && raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==`RAW_CHUNK_NUM)
        u_0_done <= 1'b1;
    else
        u_0_done <= 1'b0;
        
    if (rst)
        u_1_done <= 1'b0;
    else if (state_fold_comp==S_SEND_U1 && raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==(`RAW_CHUNK_NUM) && (u1_elem_counter==`GF256_ELEMS_PER_CHUNK-2))
        u_1_done <= 1'b1;
    else
        u_1_done <= 1'b0;
end

// State update
always_ff @ (posedge clk) begin
    if (rst)
        state_fold_comp <= S_INIT_MEMS;
    else case (state_fold_comp)
        S_INIT_MEMS:
            if (exit_s_init_mems)  state_fold_comp <= S_ACC_0;
            
        S_ACC_0:
            if (acc_done)  state_fold_comp <= S_ACC_1;
        
        S_ACC_1:
            if (acc_done) begin
                if (verify)
                    state_fold_comp <= S_WAIT_DELTA_X;
                else
                    state_fold_comp <= S_COMP_DELTA_X;
            end
        
        S_WAIT_DELTA_X:
            if (delta_x_word_in_valid) state_fold_comp <= S_APPLY_CORRECTION;
        
        S_COMP_DELTA_X:
            if (exit_state_comp_delta_x) state_fold_comp <= S_COMBINE_FD;
        
        S_APPLY_CORRECTION:
            if (p_i_internal=='h7 && raw_counter[$clog2(`RAW_CHUNK_NUM)-1:0]==(`RAW_CHUNK_NUM-1))
                state_fold_comp <= S_COMBINE_FD;
                
        S_COMBINE_FD:
            if (p_i_internal=='h7) state_fold_comp <= S_SEND_X0_U0;

        S_SEND_X0_U0:
            if (sub_chunk_counter==`GF2_ELEM_WORDS_PER_CHUNK-1) begin
                if (raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==`RAW_CHUNK_NUM) begin
                    if (verify)
                        state_fold_comp <= S_INIT_MEMS;
                    else
                        state_fold_comp <= S_SEND_U1;
                end else
                    state_fold_comp <= S_COMBINE_FD;
            end
            
        S_SEND_U1:
            if (u_1_done)
                state_fold_comp <= S_INIT_MEMS;
    endcase
end
    
// Instatiate acc_mem
simple_dual_port_mem_distr #(
    .WIDTH(`RAW_CHUNK_BITS),
    .DEPTH(`RAW_CHUNK_NUM)
) acc_mem (
    .clk   (clk),
    .wea   (write_chunk_acc),
    .addra (acc_mem_addr_write),
    .addrb (acc_mem_addr_read),
    .dia   ((state_fold_comp==S_APPLY_CORRECTION ? {'h0, x_word} : raw_chunk_pip2) ^ (init_acc_pip2 ? 1'b0 : acc_chunk_old)),
    .dob   (acc_chunk_old)
);

// Instatiate fd_j_mem
simple_dual_port_mem_distr #(
    .WIDTH(`RAW_CHUNK_BITS),
    .DEPTH(`MQOM2_PARAM_NB_EVALS_LOG2*`RAW_CHUNK_NUM)
) fd_j_mem (
    .clk   (clk),
    .wea   (write_chunk_fd),
    .addra (fd_mem_addr_write),
    .addrb (fd_mem_addr_read),
    .dia   ((state_fold_comp==S_APPLY_CORRECTION ? 'h0 : raw_chunk_pip2) ^ (init_acc_pip2 ? 'b0 : (acc_chunk_old ^ fd_j_chunk_old))),
    .dob   (fd_j_chunk_old)
);

endmodule

`default_nettype wire