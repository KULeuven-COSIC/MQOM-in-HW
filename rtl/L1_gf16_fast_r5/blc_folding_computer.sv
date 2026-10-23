
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
    output reg                                          delta_x_word_valid, // Note: only used internally now
    
    output reg [`MQOM2_PARAM_NB_EVALS_LOG2-1:0]         eval_point_r_hold,
    
    output wire [`GF256_ELEM_PARAL_WIDTH-1:0]            x0_word, // exactly 2 GF256 elements = 16 bits
//    output reg [`GF256_ELEM_PARAL_WIDTH-1:0]            x0_word, // exactly 2 GF256 elements = 16 bits
    output reg [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0]  u0_u1_word, // exactly 1 GF256 element  =  8 bits
    output reg [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0]  u0_word, // exactly 1 GF256 element  =  8 bits
    output reg [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0]  u1_word, // exactly 2 GF256 elements = 16 bits
    output reg                                          x_0_word_valid,
//    output reg                                          u_0_word_valid,
//    output reg                                          u_1_word_valid,
    
    output reg                                          x_0_done,
    output reg                                          u_0_done,
    output reg                                          u_1_done,
    
    output wire [`WORD_BITS-1:0]                         u0_u1_word_full_width,
    output reg                                          u0_u1_word_full_valid,
    output reg                                          u0_u1_word_full_valid_next,
    output reg                                          u0_word_coming_out,
    output reg                                          u1_word_coming_out,
    
    output reg                                          send_x//,
//    output reg [$clog2(`TAU)-1:0]                       e
);

//wire debug_wire = ((raw_chunk=='h0) && raw_chunk_valid);

//reg [`MQOM2_PARAM_NB_EVALS_LOG2-1:0] eval_point_r_hold;
//wire [`RAW_CHUNK_BITS-1:0] acc_chunk_new = acc_chunk_old ^ raw_chunk_pip2;

localparam ACC_ITER = (`MQOM_NB_EVALS_DIV_NUM_PARALLEL_ENC/2); // always power of 2
localparam ACC_ITER_LOG2 = $clog2(ACC_ITER);

localparam X_REG_WIDTH = `DELTA_X_WORD_REG_W;

localparam BASE_FIELD_ELEM_WORDS_PER_CHUNK = `BASE_FIELD_ELEM_WORDS_PER_CHUNK;
localparam U_1_START_CHUNK = `U_1_START_CHUNK;
localparam SUB_CH_CTR_EXIT_VALUE = ((`MQOM2_PARAM_MQ_N % (`WORD_BITS/`FIELD_BASE_LOG2_CARD))/`X_ELEM_PARALLEL - 0);

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

wire [$clog2(`RAW_CHUNK_NUM)+$clog2(`MQOM2_PARAM_NB_EVALS_LOG2)-1:0]   fd_mem_addr_read = acc_mem_addr_read
                                                    + `X_MUL_RAW_CHUNK_NUM(p_i_pip); //((state_fold_comp == S_ACC_1) ? (p_i) : `RAW_CTR_2_P_I_CLEAN(raw_counter));

reg [$clog2(`RAW_CHUNK_NUM)+$clog2(`MQOM2_PARAM_NB_EVALS_LOG2)-1:0]    fd_mem_addr_write;

wire [`RAW_CHUNK_BITS-1:0] acc_chunk_old, fd_j_chunk_old;

//reg [`FIELD_EXT_LOG2_CARD*`RAW_CHUNK_BITS-1 : 0] fd_combine_regs;
reg [`FD_X_COMBINE_REG_BITS-1 : 0] fd_combine_regs_x;
reg [`RAW_CHUNK_BITS-1 : 0] fd_combine_regs_u;
reg [`RAW_CHUNK_BITS-(`MQOM2_PARAM_MQ_N*`FIELD_BASE_LOG2_CARD)%`RAW_CHUNK_BITS-1 : 0] u_regs_keep_remainder;
//reg [`RAW_CHUNK_BITS-(`MQOM2_PARAM_MQ_N*`FIELD_BASE_LOG2_CARD)%`RAW_CHUNK_BITS-1 : 0] u1_regs_keep_remainder;

assign x0_word = fd_combine_regs_x[$bits(x0_word)-1:0];
assign u0_u1_word_full_width = {fd_combine_regs_u, u_regs_keep_remainder};

reg [`RAW_CHUNK_BITS-1:0]   raw_chunk_pip, raw_chunk_pip2;

reg [`DELTA_X_WORD_REG_W-1:0] x_word_pip, x_word_pip2;
reg                           x_word_valid_pip, x_word_valid_pip2, delta_x_word_valid_pip, exit_state_comp_delta_x;

reg [$clog2(`BASE_FIELD_ELEM_WORDS_PER_CHUNK)-1 : 0] sub_chunk_counter;
//reg [$clog2(`GF256_ELEM_WORDS_PER_CHUNK)-1 : 0] u1_elem_counter;
reg [$clog2(`GF256_ELEMS_PER_CHUNK)-1 : 0] u1_elem_counter;

reg [1:0] load_combine_regs_train;

reg exit_s_init_mems;
reg state_is_send_x0_u0_pip;
reg state_is_send_u1_pip;
reg acc_u1_reached;
reg x_0_word_valid_internal;
reg u0_word_coming, u1_word_coming, update_u_regs_keep_remainder;//, sub_chunk_counter_target_val;

always_ff @ (posedge clk) begin
    if (state_fold_comp == S_ACC_0)
        eval_point_r_hold <= eval_point_r;
    
    // ****************************************************
    // Full u0_u1_word to control module -related stuff 
    if (((`MQOM2_PARAM_ETA*`FIELD_EXT_LOG2_CARD)%`WORD_BITS != 0) ? raw_counter == 'h0 : raw_counter == `RAW_CHUNK_NUM)
        acc_u1_reached <= 1'b0;
    else if (state_fold_comp == S_SEND_U1 && raw_counter[$clog2(`U_1_START_CHUNK+1)-1:0]==`U_1_START_CHUNK)
        acc_u1_reached <= 1'b1;
    
    u0_u1_word_full_valid_next <= (sub_chunk_counter == 1'b0 && x_0_done && state_fold_comp == S_SEND_X0_U0) /*|| (sub_chunk_counter == 'h1 && raw_counter == `RAW_CHUNK_NUM && (`WORD_BITS % (`MQOM2_PARAM_ETA*`FIELD_EXT_LOG2_CARD) != 0))*/ || (acc_u1_reached);
    u0_u1_word_full_valid <= u0_u1_word_full_valid_next;
    
    u0_word_coming <= (state_fold_comp == S_SEND_X0_U0 || state_fold_comp == S_COMBINE_FD);
    u1_word_coming <= (state_fold_comp == S_SEND_U1) || state_is_send_u1_pip;
    
    u0_word_coming_out <= u0_word_coming;
    u1_word_coming_out <= u1_word_coming;
    // *******************
    
    send_x <= acc_done;

//    if (((sub_chunk_counter-'h2) & 'h3)==0 && x_0_done) // Todo: parametrize
//        u0_u1_word <= 1;// TODO: replace
//    else
//        u0_u1_word <= acc_chunk_old[8*u1_elem_counter +: 8];
    
//    u1_word <= acc_chunk_old[8*u1_elem_counter +: 8];
    
//    if (((sub_chunk_counter-'h2) & 'h3)==0 && x_0_done)
//        u0_word <= 1;// TODO: replace
    
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
    
//    if (load_combine_regs_train[1]) begin
//        for (int i = 0; i < (`FIELD_EXT_LOG2_CARD*`RAW_CHUNK_BITS); i++) begin
//            if (p_i_pip2==(i % `FIELD_EXT_LOG2_CARD)) begin
//                fd_combine_regs[i] <= fd_j_chunk_old[i / `FIELD_EXT_LOG2_CARD];
//            end
//        end
//    end else begin
//        fd_combine_regs <= (fd_combine_regs >> (`GF256_ELEM_PARAL_WIDTH));
//    end
    
    if (load_combine_regs_train[1]) begin
        fd_combine_regs_x <= fd_combine_regs_x ^
                            {gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[60 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[56 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[52 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[48 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[44 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[40 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[36 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[32 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[28 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[24 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[20 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[16 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[12 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[08 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[04 +:4], p_i_pip2),
                             gf16_by_gf256_fused_lift_n_mul_by_basis_elem( fd_j_chunk_old[00 +:4], p_i_pip2)};
    end else begin
        fd_combine_regs_x <= (fd_combine_regs_x >> (`GF256_ELEM_PARAL_WIDTH));
    end
        
    if (state_is_send_u1_pip)
        fd_combine_regs_u <= acc_chunk_old;
    else if (load_combine_regs_train[1]) begin
        fd_combine_regs_u <= fd_combine_regs_u ^
                            {gf256_mul_by_xi_p( fd_j_chunk_old[56 +:8], p_i_pip2),
                             gf256_mul_by_xi_p( fd_j_chunk_old[48 +:8], p_i_pip2),
                             gf256_mul_by_xi_p( fd_j_chunk_old[40 +:8], p_i_pip2),
                             gf256_mul_by_xi_p( fd_j_chunk_old[32 +:8], p_i_pip2),
                             gf256_mul_by_xi_p( fd_j_chunk_old[24 +:8], p_i_pip2),
                             gf256_mul_by_xi_p( fd_j_chunk_old[16 +:8], p_i_pip2),
                             gf256_mul_by_xi_p( fd_j_chunk_old[08 +:8], p_i_pip2),
                             gf256_mul_by_xi_p( fd_j_chunk_old[00 +:8], p_i_pip2)};
    end else begin
        fd_combine_regs_u <= 'h0; // Reset directly for next round
    end

//sub_chunk_counter_target_val <= sub_chunk_counter == 'h1;
update_u_regs_keep_remainder <= sub_chunk_counter == 'h1 || state_is_send_u1_pip;

if (update_u_regs_keep_remainder)
    u_regs_keep_remainder <= fd_combine_regs_u[`RAW_CHUNK_BITS-1 : (`MQOM2_PARAM_MQ_N*`FIELD_BASE_LOG2_CARD)%`RAW_CHUNK_BITS];
//else if (state_fold_comp == S_SEND_U1)
//    u_regs_keep_remainder <= fd_combine_regs_u[`RAW_CHUNK_BITS-1 : (`MQOM2_PARAM_MQ_N*`FIELD_BASE_LOG2_CARD)%`RAW_CHUNK_BITS];

//    x0_word <= fd_combine_regs[`GF256_ELEM_PARAL_WIDTH-1 : 0];
    
    state_is_send_x0_u0_pip <= (state_fold_comp == S_SEND_X0_U0);
    x_0_word_valid_internal <= state_is_send_x0_u0_pip; 
//    x_0_word_valid <= x_0_word_valid_internal && ~x_0_done;
    x_0_word_valid <= state_is_send_x0_u0_pip && ~x_0_done;
    
//    if (state_fold_comp == S_INIT_MEMS)
    if (state_fold_comp == S_ACC_0)
        x_0_done <= 1'b0;
    else if (sub_chunk_counter == SUB_CH_CTR_EXIT_VALUE && raw_counter[$clog2(`X_WORDS+1):0]==`X_WORDS) // Note: parametrize
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
            || ((sub_chunk_counter==(`BASE_FIELD_ELEM_WORDS_PER_CHUNK-1) || (state_fold_comp==S_SEND_U1)) && raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==`RAW_CHUNK_NUM)
            || ((raw_counter[$clog2(`RAW_CHUNK_NUM)-1:0]==`RAW_CHUNK_NUM-1) && (state_fold_comp==S_APPLY_CORRECTION))
            || (raw_counter==(LEAF_BATCH_SIZE_0-1) && state_fold_comp == S_ACC_0)) begin
        raw_counter <= 'b0;
    end else begin
        if (raw_chunk_valid || ((state_fold_comp == S_INIT_MEMS || state_fold_comp == S_COMBINE_FD) && p_i_internal=='h7) || x_word_valid || (state_fold_comp==S_SEND_U1) || (state_fold_comp==S_APPLY_CORRECTION))
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
    else if (sub_chunk_counter==(`BASE_FIELD_ELEM_WORDS_PER_CHUNK-1) && raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==`RAW_CHUNK_NUM)
        u_0_done <= 1'b1;
    else
        u_0_done <= 1'b0;
        
    if (rst)
        u_1_done <= 1'b0;
    else if (state_fold_comp==S_SEND_U1 && raw_counter[$clog2(`RAW_CHUNK_NUM)-1:0]==(`RAW_CHUNK_NUM-1)/* && (u1_elem_counter==`GF256_ELEMS_PER_CHUNK-2)*/)
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

//        S_SEND_X0_U0:
//            if (sub_chunk_counter==`BASE_FIELD_ELEM_WORDS_PER_CHUNK-1) begin
//                if (verify) begin
//                    if (raw_counter[$clog2(`RAW_CHUNK_NUM)-1:0]==`RAW_CHUNK_NUM-1)
//                        state_fold_comp <= S_INIT_MEMS;
//                    else
//                        state_fold_comp <= S_COMBINE_FD;
                        
//                end else if (raw_counter[$clog2(`RAW_CHUNK_NUM+1)-1:0]==`RAW_CHUNK_NUM)
//                    state_fold_comp <= S_SEND_U1;
                    
//                else
//                    state_fold_comp <= S_COMBINE_FD;
//            end
            
        S_SEND_X0_U0:
            if (sub_chunk_counter==`BASE_FIELD_ELEM_WORDS_PER_CHUNK-1) begin
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