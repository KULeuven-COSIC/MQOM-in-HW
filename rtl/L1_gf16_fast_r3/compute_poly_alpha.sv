// Arithmetic module to evaluate polynomials * store related values

`include "mqom2_main_header.vh"
`include "gf256_mul_func.svh"

`default_nettype none

module compute_poly_alpha (
    input wire                      rst,
    input wire                      clk,
        
    input wire [`WORD_BITS-1:0]     x_in, // Read from memory. Streamed 2 bytes per clock. -> Changed to full WORD_BITS to be used for y during verification
    input wire                      x_in_valid,
    input wire                      y_in_valid,
    
    input wire                      keygen,
    input wire                      sign,
    input wire                      verify,
    
    input wire                      alpha_1_in_valid,
    input wire [`WORD_BITS-1:0]     alpha_1_in,
    
    input wire [`NUM_PARALLEL_ENC*16-1:0] sample_in, // AES-128 throughput = 16 bytes per 11 cycles -> 2 bytes per cycle = adequate computation throughpout to avoid stalls
    input wire                            sample_in_valid,
    input wire                            sample_is_b_vec,
    input wire                            end_of_row,
    
    input wire [$clog2(`LAMBDA/`WORD_BITS)-1:0]   a_row_q_last_bits,
    
    input wire [`GF256_ELEM_PARAL_WIDTH-1:0]            x0_word, // exactly 2 GF256 elements = 16 bits
    input wire                                          x_0_word_valid,
    
    input wire [`MQOM2_PARAM_NB_EVALS_LOG2-1:0]         eval_point_r_hold,
    
    output reg [`WORD_BITS-1:0]                         y_word_out,
    output reg                                          y_word_valid,
//    output reg                                          y_done,
    
    output reg                                          poly_comp_ready,
    
    output reg                                          last_y_next,
    output reg                                          send_y_done,
    
    output reg                                          z0_z1_words_done,
    output reg                                          send_next_alpha_1,
    output reg                                          z_out_valid_next,
    output reg                                          z_coming,
    output reg [`WORD_BITS-1:0]                         z_word_out
);

reg keygen_pip, sign_pip, verify_pip;
always_ff @ (posedge clk) keygen_pip <= keygen;
always_ff @ (posedge clk) sign_pip <= sign;
always_ff @ (posedge clk) verify_pip <= rst ? 1'b0 : verify;

reg [`NUM_PARAL_EQ*`FIELD_EXT_LOG2_CARD-1:0] z0 [0:`TAU-1]; // Accumulates z0_i (or vz_i)
reg [`NUM_PARAL_EQ*`FIELD_EXT_LOG2_CARD-1:0] z1 [0:`TAU-1]; // Accumulates z1_i
reg [`NUM_PARALLEL_ENC*`FIELD_EXT_LOG2_CARD-1:0] y; // Accumulates y

typedef enum logic [2:0] {
    S_FILL_X,
    S_FILL_Y,
    S_FILL_X0,
    S_COMP_Y,
    S_COMP_Z0_Z1,
    S_IDLE
} state_comp_poly_alpha_t;

state_comp_poly_alpha_t state_poly, state_poly_next;
always_ff @ (posedge clk) state_poly <= rst ? S_FILL_X : state_poly_next; // Note: Gotta make something to leave the rst state for Verification

typedef enum logic [1:0] {
    ADDR_FREEZE,
    ADDR_INCR
} addr_opcode_t;

addr_opcode_t x_addr_opc;

//reg [`X_MEM_WIDTH-1:0]  x_in_pip;
//reg                     x_in_valid_pip;

reg [`NUM_PARALLEL_ENC*16-1:0]  sample_in_pip;
reg                             sample_in_valid_pip, sample_in_valid_pip_2, sample_is_b_vec_pip, sample_is_b_vec_pip2, end_of_row_pip, end_of_row_pip2, end_of_row_pip3;

reg  clean_regs, init_row_accum, init_row_accum_pip, init_row_accum_pip2, clean_regs_next, gate_y_mem;

wire [`X_MEM_WIDTH-1:0]         x_out;
//wire [`FIELD_EXT_LOG2_CARD*`X_ELEM_PARALLEL-1:0] x_out;
wire [`TOTAL_X0_WIDTH-1:0]      x0_out;

reg [$clog2((`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL))-1:0]  x_addr;

reg [`FIELD_BASE_LOG2_CARD-1:0] x_elem_hold;
//reg [`FIELD_EXT_LOG2_CARD-1:0] x_elem_hold;
reg [`TAU*8-1:0] x0_elem_hold;
reg [$clog2(`LAMBDA/`WORD_BITS)-1:0]   a_row_q_last_bits_pip, a_row_q_last_bits_pip2;

localparam Z_STORE_REGS_PAD_ELEMS = (`MQOM2_PARAM_M_HAT % (`CEIL_A_DIV_B(`WORD_BITS, `FIELD_EXT_LOG2_CARD))/`NUM_PARAL_EQ);
reg [$clog2(`WORD_BITS/(`FIELD_EXT_LOG2_CARD*`NUM_PARAL_EQ))-1:0] toggling_counter;//, y_done_next;
//reg [`CEIL_A_DIV_B(`MQOM2_PARAM_M_HAT,`NUM_PARALLEL_ENC):0] last_out_ctr;
reg [`CEIL_A_DIV_B(`MQOM2_PARAM_M_HAT,`NUM_PARAL_EQ) +Z_STORE_REGS_PAD_ELEMS -1:0] last_out_ctr;

reg [$clog2(`TAU)-1:0] e;
reg [`TAU-1:0] x0_mem_wren;

(* shreg_extract = "no" *) reg [`WORD_BITS*`TAU-1:0] z0_store_regs;
(* shreg_extract = "no" *) reg [`WORD_BITS*`TAU-1:0] z1_store_regs;

reg [`WORD_BITS-1:0] alpha_1_in_regs;

reg update_a_word, update_z_word_next, upd_mpc_round, z0_z1_words_done_next, z0_z1_words_done_in_2, shift_r_sq_regs;

reg [`TAU*8-1:0] r_regs; // Get square of this mpc round's eval_point_r get shift previous ones down
always_ff @ (posedge clk) if (upd_mpc_round) r_regs <= {eval_point_r_hold, r_regs[`TAU*8-1:8]};

reg [`TAU*8-1:0] r_shift_regs; // Get square of this mpc round's eval_point_r get shift previous ones down
always_ff @ (posedge clk) begin // Use shift register arrays
    if (upd_mpc_round)
        r_shift_regs <= {eval_point_r_hold, r_shift_regs[`TAU*8-1:8]};
    else if (shift_r_sq_regs)
        r_shift_regs <= {r_shift_regs[8 : 0], r_shift_regs[`TAU*8-1:8]};
end

reg sample_is_b_vec_pip2_AND_sign_pip;
reg sample_is_b_vec_pip_AND_sign_pip;
reg sample_is_b_vec_pip_AND_keygen_pip;

reg [$clog2(`MQOM2_PARAM_M_HAT)-1 : 0] y_mem_addr;
wire [`FIELD_EXT_LOG2_CARD-1 : 0] y_mem_out;

localparam Z0_ELEM_WIDTH_PER_ROUND = `GF256_ELEM_PARAL_WIDTH_SMALL_VEC*`NUM_PARAL_EQ;
reg [$clog2(2* (`WORD_BITS/`FIELD_EXT_LOG2_CARD) *`TAU+1)-1:0] z_delivery_ctr;
reg shift_z_regs, z_out_valid_in_2, z_out_valid_in_3, z_out_valid_in_4;

reg [$clog2(`WORD_BITS/`FIELD_EXT_LOG2_CARD)-1:0] z_valid_ctr;

always_ff @ (posedge clk) begin
    if (clean_regs) begin
        for (int i0=0; i0<`TAU; i0++) begin
            z0_store_regs[`WORD_BITS*i0 +: `WORD_BITS] <= {z0[i0], z0_store_regs[`WORD_BITS*i0 +Z0_ELEM_WIDTH_PER_ROUND +: `WORD_BITS-Z0_ELEM_WIDTH_PER_ROUND]};
            z1_store_regs[`WORD_BITS*i0 +: `WORD_BITS] <= {z1[i0], z1_store_regs[`WORD_BITS*i0 +Z0_ELEM_WIDTH_PER_ROUND +: `WORD_BITS-Z0_ELEM_WIDTH_PER_ROUND]};
        end 
    end else if (shift_z_regs) begin
        z0_store_regs <= {z1_store_regs, z0_store_regs} >> `FIELD_EXT_LOG2_CARD;
        z1_store_regs <= z1_store_regs >> `FIELD_EXT_LOG2_CARD;
    end
    
    if (shift_z_regs)
        z_word_out <= { (z0_store_regs[0 +: `FIELD_EXT_LOG2_CARD] ^ gf256_mul(gf256_square(r_shift_regs[7 : 0]), y_mem_out) ^ gf256_mul(r_shift_regs[7 : 0], alpha_1_in_regs[7 : 0])), z_word_out[`WORD_BITS-1 : `FIELD_EXT_LOG2_CARD] };
    
    shift_z_regs <= z_delivery_ctr != 'h0;
    
    if (rst)
        z_delivery_ctr <= 'h0;
    else if (clean_regs_next && toggling_counter == (`WORD_BITS/(`FIELD_EXT_LOG2_CARD*`NUM_PARAL_EQ)-1) && !keygen_pip) // gate shift regs if keygen
        z_delivery_ctr <= verify_pip ? ((`WORD_BITS/`FIELD_EXT_LOG2_CARD)*`TAU) : (2*(`WORD_BITS/`FIELD_EXT_LOG2_CARD)*`TAU);
    else if (z_delivery_ctr != 0)
        z_delivery_ctr <= z_delivery_ctr -1'b1;
    
    if (rst)
        z_valid_ctr <= 'h0;
    else if (shift_z_regs)
        z_valid_ctr <= z_valid_ctr + 'h1;
    
    z_coming <= shift_z_regs;
    
    send_next_alpha_1 <= z_valid_ctr == (`WORD_BITS/`FIELD_EXT_LOG2_CARD-6);
    z_out_valid_in_4 <= send_next_alpha_1;
    z_out_valid_in_3 <= z_out_valid_in_4;
    z_out_valid_in_2 <= z_out_valid_in_3;
    z_out_valid_next <= z_out_valid_in_2;
    
    if (alpha_1_in_valid)
        alpha_1_in_regs <= alpha_1_in;
    else if (shift_z_regs)
        alpha_1_in_regs <= (alpha_1_in_regs >> `FIELD_EXT_LOG2_CARD);
end

always_comb begin
    for (int i0=0; i0<`TAU; i0++) begin
        if (x_0_word_valid && e == i0)
            x0_mem_wren[i0] <= 1'b1;
        else
            x0_mem_wren[i0] <= 1'b0;
    end
end

always_ff @ (posedge clk) begin
    sample_is_b_vec_pip2_AND_sign_pip <= sample_is_b_vec_pip && sign;
    sample_is_b_vec_pip_AND_sign_pip <= sample_is_b_vec && sign;
    sample_is_b_vec_pip_AND_keygen_pip <= sample_is_b_vec && keygen_pip;
    
    last_y_next <= (y_mem_addr[$clog2(`WORD_BYTES)-1:0] == `WORD_BYTES-4);
    send_y_done <= (y_in_valid && y_mem_addr == `MQOM2_PARAM_M_HAT-3);
    
    if (rst)
        y_mem_addr <= 'h0;
    else if ((y_in_valid /*&& state_poly == S_FILL_Y*/) || ((z_delivery_ctr != 'h0) && !z_out_valid_in_2) || ((z_delivery_ctr == 'h1) && z_out_valid_in_2)) // if last in round, then increment instead of dicrementing
        y_mem_addr <= (state_poly != S_COMP_Z0_Z1 && y_mem_addr == `MQOM2_PARAM_M_HAT-1) ? 'h0 : (y_mem_addr + 'h1);
    else if (z_out_valid_in_2)
        y_mem_addr <= y_mem_addr - (`WORD_BITS/`FIELD_EXT_LOG2_CARD-1);
        
    sample_in_pip <= sample_in;
    sample_in_valid_pip <= sample_in_valid;
    sample_in_valid_pip_2 <= sample_in_valid_pip;
    sample_is_b_vec_pip <= rst ? 1'b0 : sample_is_b_vec;
    sample_is_b_vec_pip2 <= rst ? 1'b0 : sample_is_b_vec_pip;
    
    poly_comp_ready <= (state_poly == S_COMP_Z0_Z1);
    
    shift_r_sq_regs <= z_valid_ctr/*[$clog2(`WORD_BITS/`FIELD_EXT_LOG2_CARD)-1 : 0]*/ == `WORD_BITS/`FIELD_EXT_LOG2_CARD-2;
    
    if (rst)
        e <= 'h0;
    else if (upd_mpc_round)
        e <= `LAST_MPC_ROUND ? 'h0 : (e+1);
    
    if (rst)
        upd_mpc_round <= 1'b0;
    else
        upd_mpc_round <= (x_addr == (`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL-1) && state_poly == S_FILL_X0);
        

    last_out_ctr <= rst ? 'b1 : clean_regs_next ? (last_out_ctr << 1) : last_out_ctr;

    if (rst)
        gate_y_mem <= 1'b0;
    else if (y_mem_addr == `MQOM2_PARAM_M_HAT+3)
        gate_y_mem <= 1'b0;
    else if (y_mem_addr == `MQOM2_PARAM_M_HAT)
        gate_y_mem <= 1'b1;
    
    if (`TAU%2==1) // Note: does not cover every case adequately
        clean_regs_next <= rst ? 1'b0 : ((sample_is_b_vec_pip2 && !sample_is_b_vec_pip) || (clean_regs && (toggling_counter[0] && (last_out_ctr[`CEIL_A_DIV_B(`MQOM2_PARAM_M_HAT,`NUM_PARALLEL_ENC)] && state_poly == S_COMP_Y) || |last_out_ctr[`CEIL_A_DIV_B(`MQOM2_PARAM_M_HAT,`NUM_PARAL_EQ) +: Z_STORE_REGS_PAD_ELEMS])));
    else
        clean_regs_next <= rst ? 1'b0 : (sample_is_b_vec_pip2 && !sample_is_b_vec_pip);
    
    end_of_row_pip <= end_of_row;
    end_of_row_pip2 <= end_of_row_pip;
    end_of_row_pip3 <= end_of_row_pip2;
    
    a_row_q_last_bits_pip <= a_row_q_last_bits;
    a_row_q_last_bits_pip2 <= a_row_q_last_bits_pip;
    
    clean_regs <= rst || clean_regs_next;
    
    toggling_counter <= rst ? 1'b0 : clean_regs_next ? (toggling_counter + 1'b1) : toggling_counter;
    
    if (clean_regs)// || y_done_next)
        y_word_out <= {y, y_word_out[`WORD_BITS/2 +:`WORD_BITS/2]};
    
    y_word_valid <= clean_regs && !toggling_counter[0];
    
    if (end_of_row_pip) begin
        if (sample_is_b_vec_pip)
            x_elem_hold <= 8'b1;
        else
            x_elem_hold <= x_out[a_row_q_last_bits_pip2*`FIELD_BASE_LOG2_CARD +: `FIELD_BASE_LOG2_CARD];
   end
       
    if (sample_is_b_vec_pip_AND_keygen_pip)
        x0_elem_hold[0+:8] <= 8'h01;
    else if (keygen_pip)
        x0_elem_hold[0+:8] <= gf16_lift_to_gf256( x_out[a_row_q_last_bits_pip2*`FIELD_BASE_LOG2_CARD +: `FIELD_BASE_LOG2_CARD] );
    else if (sample_is_b_vec_pip)
        x0_elem_hold[0+:8] <= r_regs[0+:8];
    else
        x0_elem_hold[0+:8] <= x0_out[0 +a_row_q_last_bits_pip2*8 +: 8];
    
    for (int k0=1; k0<`TAU; k0++) begin // no more x0_hold under this optimization: 0, r_eval_point[e], or x0_elem_hold[e] depending on where we're at in the algorithm
        if (sample_is_b_vec_pip)
            x0_elem_hold[8*k0+:8] <= r_regs[8*k0+:8];
        else
            x0_elem_hold[8*k0+:8] <= x0_out[`GF256_ELEM_PARAL_WIDTH*k0 +a_row_q_last_bits_pip2*8 +: 8];
    end
//    end
    
    if (rst)
        init_row_accum <= 1'b1;
    else if (sample_in_valid)
        init_row_accum <= end_of_row; //end_of_row_pip;
        
    init_row_accum_pip <= init_row_accum;
    init_row_accum_pip2 <= init_row_accum_pip;
end

always_ff @ (posedge clk) begin
//    x_in_pip <= x_in;
        
//    if (rst)
//        x_in_valid_pip <= 1'b0;
//    else
//        x_in_valid_pip <= x_in_valid && (state_poly == S_FILL_X);
    
    if (rst)
        x_addr <= 'h0;
    else if (end_of_row)
        x_addr <= 'h0;
    else begin
        case (x_addr_opc)
            ADDR_INCR: // If depth-1 then zero, else ++1
                x_addr <= ( x_addr == (`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL-1) ) ? 'h0 : (x_addr+1'h1);
                
//            ADDR_INCR_BY_2: // If depth-1 or depth-2 then keep LSB only, else ++2
//                x_addr <= ( (x_addr>>1) == (`MQOM2_PARAM_MQ_N/(2*`X_ELEM_PARALLEL)-1) ) ? {'h0, x_addr[0]} : (x_addr+2'h2);
        endcase
    end
end

// FSM state update logic
always_comb begin
    state_poly_next = state_poly; // Default
    
    case (state_poly)
        S_FILL_X: begin// If last_input then go to next state
            if (verify_pip)
                state_poly_next = S_FILL_Y;
            else if (x_addr == (`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL-1)) begin
                if (sign)
                    state_poly_next = S_FILL_X0;
                else
                    state_poly_next = S_COMP_Y;
            end
        end
        
        S_FILL_Y: begin// If last_input then go to next state
            if (y_in_valid && (y_mem_addr == `MQOM2_PARAM_M_HAT-1))
                state_poly_next = S_FILL_X0;
        end
        
        S_FILL_X0: begin// If last_input then go to next state
            if (x_addr == (`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL-1)) begin
                state_poly_next = `LAST_MPC_ROUND ? S_COMP_Z0_Z1 : S_FILL_X0;
            end
        end
        
        S_COMP_Z0_Z1: begin
        end
    endcase        
end

// FSM state logic
always_comb begin
    x_addr_opc = ADDR_FREEZE;
    
    case (state_poly)
        S_FILL_X: begin
            if (x_in_valid)
                x_addr_opc = ADDR_INCR;
        end
        
        S_COMP_Y: begin
            if (sample_in_valid)
                x_addr_opc = ADDR_INCR;
        end
        
        S_FILL_X0: begin
            if (x_0_word_valid)
                x_addr_opc = ADDR_INCR;
        end
        
        S_COMP_Z0_Z1: begin
            if (sample_in_valid)
                x_addr_opc = ADDR_INCR;
        end
    endcase  
end

// ******************************
// *** On-the-fly Arithmetic ***
//
// During keygen: y_i = x^T * A_i * x + b_i^T * x                     (Modified Datapath 2)
//
// During sign:   z0_i = x0[e]^T * A_i * x0[e]                               (Datapath 1)
//             &  z1_i = x^T * A_i * x0[e] + b_i^T * x0[e] + x0[e]^T * A * x  (Datapath 2)
//
// During verify: v_{z,i} = v_x[e] * A_i * v_x[e] + r * b_i^T * v_x[e] - y_i * r^2         (Datapath 1)
//
// Unified Keygen / Sign / Verify update:
//                                        (1) x0_elem_hold now becomes eval_point_r when sample_is_b_vec_pip to simplify the following combinational datapath

wire [`GF256_ELEM_PARAL_WIDTH*`NUM_PARAL_EQ-1:0] Ai_times_x0 [0:`TAU-1];   // X_ELEM_PARALLEL (=2) GF256 for each parallel Enc * TAU in parallel
reg [`GF256_ELEM_PARAL_WIDTH*`NUM_PARAL_EQ-1:0] Ai_times_x0_reg [0:`TAU-1];
always_ff @ (posedge clk) begin
    for (int k=0; k<`TAU; k++) begin
        if (sample_in_valid_pip)
            Ai_times_x0_reg[k] <= (Ai_times_x0[k] ^ (init_row_accum_pip ? 'h0 : Ai_times_x0_reg[k]));
        end
end

wire [`GF256_ELEM_PARAL_WIDTH*`NUM_PARALLEL_ENC-1:0] Ai_times_x;
reg [`GF256_ELEM_PARAL_WIDTH*`NUM_PARALLEL_ENC-1:0] Ai_times_x_reg;
always_ff @ (posedge clk) begin
//    if (sample_is_b_vec_pip)
    if (sample_is_b_vec_pip_AND_sign_pip)
        Ai_times_x_reg <= 'h0;
    else if (sample_in_valid_pip)
        Ai_times_x_reg <= Ai_times_x ^ (init_row_accum_pip ? 'h0 : Ai_times_x_reg);
end // GF256 * GF2

wire [8*(`NUM_PARALLEL_ENC-`NUM_PARAL_EQ)-1:0] x_times_Ai_times_x_term_tail;

wire [8*`NUM_PARAL_EQ-1:0] x0_times_Ai_times_x_term [0:`TAU-1];
reg [8*`NUM_PARAL_EQ-1:0] x0_times_Ai_times_x_reg [0:`TAU-1];
always_ff @ (posedge clk) /*if (end_of_row_pip2)*/ begin
    for (int k=0; k<`TAU; k++) // Always update for now. Downstream path abosrbs selectively (end_of_row_pip gating)
        x0_times_Ai_times_x_reg[k] <= x0_times_Ai_times_x_term[k];
end

wire [8*`NUM_PARAL_EQ-1:0] x_times_Ai_times_x0_term [0:`TAU-1]; // also includes b_i term
reg  [8*`NUM_PARAL_EQ-1:0] x_times_Ai_times_x0_reg [0:`TAU-1];
always_ff @ (posedge clk) /*if (end_of_row_pip2)*/ begin
    for (int k=0; k<`TAU; k++) begin
        x_times_Ai_times_x0_reg[k] <= x_times_Ai_times_x0_term[k];
    end
end

wire [8*`NUM_PARAL_EQ-1:0] x0_times_Ai_times_x0_term [0:`TAU-1]; // also includes b_i term
reg  [8*`NUM_PARAL_EQ-1:0] x0_times_Ai_times_x0_reg [0:`TAU-1];
always_ff @ (posedge clk) /*if (end_of_row_pip2)*/ begin
    for (int k=0; k<`TAU; k++) begin
        x0_times_Ai_times_x0_reg[k] <= x0_times_Ai_times_x0_term[k];
    end
end

genvar i,j;
generate
    for (i=0; i<`NUM_PARALLEL_ENC; i++) begin: gen_paral_keygen_terms
        assign Ai_times_x[(2*i+0)*8 +: 8] = gf16_by_gf256_fused_lift_n_mul(x_out[0 +: 4], sample_in_pip[(2*i+0)*8 +: 8]);
        assign Ai_times_x[(2*i+1)*8 +: 8] = gf16_by_gf256_fused_lift_n_mul(x_out[4 +: 4], sample_in_pip[(2*i+1)*8 +: 8]);
        
        if (i>=`NUM_PARAL_EQ)
            assign x_times_Ai_times_x_term_tail[(i-`NUM_PARAL_EQ)*8 +: 8] = gf16_by_gf256_fused_lift_n_mul_alt(x_elem_hold, (Ai_times_x_reg[(2*i+0)*8 +: 8] ^ Ai_times_x_reg[(2*i+1)*8 +: 8]));
    end
    
    for (i=0; i<`NUM_PARAL_EQ; i++) begin: gen_paral_terms // terms that are indpendent of e are out of the j loop

        for (j=0; j<`TAU; j++) begin: gen_tau_times_paral_enc_terms // terms dependent on e and i
            assign Ai_times_x0[j][(2*i+0)*8 +: 8] = gf256_mul(sample_in_pip[(2*i+0)*8 +: 8], x0_out[(2*j+0)*8 +: 8]); // generate A*x0 products
            assign Ai_times_x0[j][(2*i+1)*8 +: 8] = gf256_mul(sample_in_pip[(2*i+1)*8 +: 8], x0_out[(2*j+1)*8 +: 8]);
            
            assign x0_times_Ai_times_x_term[j][(i+0)*8 +: 8] = gf256_mul( (Ai_times_x_reg[(2*i+0)*8 +: 8] ^ Ai_times_x_reg[(2*i+1)*8 +: 8]), x0_elem_hold[8*j +: 8]); 
            
            assign x_times_Ai_times_x0_term[j][(i)*8 +: 8] = gf16_by_gf256_fused_lift_n_mul_alt(x_elem_hold, (Ai_times_x0_reg[j][(2*i+0)*8 +: 8] ^ Ai_times_x0_reg[j][(2*i+1)*8 +: 8]));
 
            // Gate b term if signing (merge directly version)
            assign x0_times_Ai_times_x0_term[j][(i)*8 +: 8] = gf256_mul((Ai_times_x0_reg[j][(2*i+0)*8 +: 8] ^ Ai_times_x0_reg[j][(2*i+1)*8 +: 8]), x0_elem_hold[8*j +: 8]);
        end
    end
    
    for (j=0; j<`TAU; j++) begin: merge_z_terms
        always_ff @ (posedge clk) begin
            if (clean_regs) begin
                z0[j] <= 'h0;
            end else if (end_of_row_pip2) begin
                z0[j] <= z0[j]  ^ x0_times_Ai_times_x0_term[j];
            end
            
            if (clean_regs) begin
                z1[j] <= 'h0;
            end else if (end_of_row_pip2) begin
                z1[j] <= z1[j] ^ x_times_Ai_times_x0_term[j]  ^ x0_times_Ai_times_x_term[j];
            end
        end
    end
endgenerate

always_ff @ (posedge clk) begin
    if (clean_regs) begin
        y <= 'h0;
    end else if (end_of_row_pip2) begin
        y <= y ^ {x_times_Ai_times_x_term_tail, x0_times_Ai_times_x_term[0]};
    end
end

// Instatiate x_mem
simple_dual_port_mem_distr #(
//simple_dual_port_mem_distr_dout_lifted_gf16_to_gf256 #(
    .WIDTH(`X_MEM_WIDTH),
    .DEPTH((`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL)),
    .FILE("")
) x_mem (
    .clk   (clk),
    .wea   (x_in_valid && state_poly==S_FILL_X),
    .addra (x_addr),
    .addrb (x_addr),
    .dia   (x_in[`X_MEM_WIDTH-1:0]),
    .dob   (x_out)
);

// Instantiate x_0 mems
multi_simple_dual_port_mem_distr #(
    .NUM_PARAL_ELEM (`TAU),
    .WIDTH_PER_ELEM (`PER_ROUND_X0_WIDTH),
    .WIDTH          (`TOTAL_X0_WIDTH),
    .DEPTH          ((`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL)),
    .FILE("")
) x0_mem (
    .clk   (clk),
//    .wea   ({`TAU{x_0_word_valid}} & 'h1),
    .wea   (x0_mem_wren),
    .addra (x_addr),
    .addrb (x_addr),
    .dia   ({`TAU{x0_word}}),
    .dob   (x0_out)
);

// ************************************
// LUTRAM-based SDP mem with rst input
simple_dual_port_mem_distr_wRst #(
    .WIDTH    (`FIELD_EXT_LOG2_CARD),
    .DEPTH    (`MQOM2_PARAM_M_HAT)
) y_mem (
    .rst   (gate_y_mem || y_mem_addr==`MQOM2_PARAM_M_HAT),
    .clk   (clk),
    .wea   (y_in_valid),
    .addra (y_mem_addr),
    .addrb (y_mem_addr),
    .dia   (x_in), // Actually is y here
    .dob   (y_mem_out)
);

endmodule

`default_nettype wire