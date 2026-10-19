`default_nettype none

`include "keccak_interc_defs.vh" // Also calls mqom header(s)

module mqom_main_fsm (
    input wire                  rst,
    input wire                  clk,
    
    input wire [1:0]            start_comm,
    
    input wire [`WORD_BITS-1:0] main_mem_dout_0,
    input wire [`WORD_BITS-1:0] keccak_dout,
    
    input wire                  commit_filled, // Signal from the Enc FSM that a commit batch can be fed to the SHAKE fifo
//    input wire                  blc_send_x, // Signal from BLC Folding Comp to start sending last bits of x
    
    input wire                  keccak_dout_valid,
//    input wire                  keccak_done,
    input wire                  keccak_input_data_done,
    
//    input wire                  delta_x_word_valid,
    input wire [`DELTA_X_WORD_REG_W-1:0] delta_x_word,
    
//    input wire                  y_done_keygen,
    input wire                  y_word_keygen_valid,
    input wire [`WORD_BITS-1:0] y_word_keygen,
    
    input wire [`WORD_BITS-1:0] u0_u1_word_full_width,
    input wire                  u0_u1_word_full_valid,
    input wire                  u0_u1_word_full_valid_next,
    input wire                  u0_word_coming,
    input wire                  u1_word_coming,
    
    input wire                  last_y_next,
    input wire                  send_y_done,
    input wire                  send_next_alpha_1,
    input wire                  z_word_valid_next,
    input wire                  z_coming,
    input wire [`WORD_BITS-1:0] z_word,
    
    input wire [`GRIND_NONCE_BITS-1:0] grind_nonce_k2c,
    
    input wire [`FIELD_EXT_LOG2_CARD-1:0] i_star_e,
    
    input wire                  enc_fsm_done,
    
    input wire                  keccak_reject_nonce,
    
    output reg                  keygen_out,
    output reg                  sign_out,
    output reg                  verify_out,
    
    output reg                  keccak_din_valid,
    
    output reg [`GRIND_NONCE_BITS-1:0] grind_nonce_c2k,
    
    output reg [`WORD_BYTES_LOG2:0] keccak_bytelen_din,
    output reg                     keccak_dout_shift_part, // 1'b0: output full words,    1'b1: output byte-by-byte
    
    output reg [`WORD_BITS-1:0] main_mem_din_0,
    output reg [`WORD_BITS-1:0] keccak_din,
    output reg [`WORD_BITS-1:0] keccak_command,
    
    output reg [`WORD_BITS-1:0] alpha_1_out,
    output reg                  alpha_1_out_valid,
    
    output reg [`WORD_BITS-1:0] x_word, // was DELTA_X_WORD_REG_W
    output reg                  x_word_valid,
    output reg                  y_word_valid,
    output reg                  delta_x_word_C2F_valid,
    
    output reg                  main_mem_wren_0_out,
    
    output reg                  poly_comp_ready_fsm,
    
    output reg                  keccak_grind,
        
    output reg [$clog2(`MAIN_MEM_DEPTH)-1:0] main_mem_addr_0,
    
//    output reg                        last_mpc_round_out,
    
    output reg                        done_out,
    output reg                        bad_sig
);

reg [$clog2(`MAIN_MEM_DEPTH)-1:0] main_mem_addr_0_write, main_mem_addr_0_read, main_mem_addr_0_read_alt;
reg keygen, keygen_out_next, sign, verify, comm_received, main_mem_wren_0, choose_wr_addr, main_mem_wren_0_next;
reg [21:0] new_state_train;
reg [25:0] keccak_dout_valid_train;
reg u0_u1_word_full_valid_pip, u0_u1_word_full_valid_pip2, exit_state_store_last_u;
reg [`GRIND_NONCE_BITS-1:0] grind_nonce_c2k_next;

reg [`WORD_BITS-1:0]  main_mem_din_0_next, keccak_dout_pip;
reg [`WORD_BITS-1:0]  keccak_din_next, keccak_command_next;
reg [`WORD_BYTES_LOG2:0] keccak_bytelen_din_next;
reg keccak_dout_shift_part_next, keccak_din_valid_next, keccak_grind_next;

localparam CMT_TR_LEN = 4;
reg [CMT_TR_LEN-1:0] commit_filled_train;
reg [$clog2(`CMT_FIFO_DEPTH)-1:0] commit_ctr;

//reg [64-(`X_BITS%64)-1:0] hold_keccak_res_regs;

reg done_next, x_word_valid_next, delta_x_word_C2F_valid_next, shift_x_word, shift_x_word_next, update_state, update_state_next, x_word_load, x_word_load_next, x_word_rst, x_word_rst_next, y_word_valid_next;

reg [$clog2(`MQOM2_PARAM_M_HAT)-1:0] m_hat_counter;
reg [$clog2(`DELTA_X_TAIL_WORDS)-1:0] com_1_delta_tail_ctr;

reg [$clog2(`X_DELIVERY_CYCLES)-1:0] x_delivery_counter;
reg incr_x_del_ctr, incr_x_del_ctr_next, done, bad_sig_next;

reg [$clog2(`TAU)-1:0] e;
reg incr_e, incr_e_next;
reg com_1_delta_tail_reached;
reg poly_comp_ready_fsm_next;
reg hash_stop_valid_input, hash_stop_valid_input_next;

reg [$clog2(`N/`NUM_PARALLEL_ENC)-1:0] party_idx_i_sub_paral_enc_ctr; // counts commit batches
reg [$clog2(`NUM_PARALLEL_ENC)-1:0] paral_enc_ctr; // counts individual commits in a batch to be able to pick out the i* case

localparam SIBL_PATH_ADDR = `SIBL_PATH_ADDR;
localparam COMMITS_I_STAR_ADDR = `COMMITS_I_STAR_ADDR;
localparam A0_WORDS = `A0_WORDS;
localparam A0_ADDR = `A0_ADDR;
localparam A1_ADDR = `A1_ADDR;
localparam X_BITS = `X_BITS;
localparam K_PART_SH_LEN = `K_PART_SH_LEN;

reg use_alt_read_addr, use_alt_read_addr_next, use_alt_read_addr_pip, use_alt_read_addr_pip2;

reg [$clog2(`WORD_BITS/`FIELD_EXT_LOG2_CARD)-1 : 0] send_y_ctr;
reg last_y_next_pip;

reg [$clog2(`A0_WORDS)-1:0] valid_u0_word_ctr;
reg [$clog2(`A0_WORDS)-1:0] valid_u1_word_ctr;

reg [$clog2(`EXPAND_EQ_VALID_OUT_ROUNDS)-1:0] expand_eq_round_ctr;
reg z_coming_pip, last_a_word_flag, reject_com_2_prime;
reg incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND, incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND_next;
reg valid_u1_word_ctr_goto_prev_round, valid_u1_word_ctr_goto_prev_round_next;

reg [`HASH_WORDS+3 : 0] keccak_input_data_done_train;
reg [`WORD_BITS-1:0] verifier_hash_compare_regs [0 : `HASH_WORDS-1];

typedef enum logic [3:0] {
    S_IDLE,                 // IDLE: waiting or done
    S_EXPAND_SEED_KEY,
    S_SEND_X,
    S_SEND_Y,
    S_EXPAND_EQUATIONS,
    S_STORE_Y,
    S_HASH_MSG,
    S_BLC_COMMIT,   // Also BLC.Eval for verification
    S_STORE_LAST_U, // Store last u_0 / u_1 pair (sign) or v_u (verifier)
    S_SEND_X_DX_2_BLC_COMP, // Obtain delta_x_tail during signing
    S_SEND_DX_TAIL_2_BLC_COMP, // Add (acc + delta_x_tail_padded) * eval_point_r to 
    S_COMP_COM_1,
    S_STORE_ALPHAS,
    S_HASH_ALPHAS,
    S_HASH_LAST,
    S_SAMPLE_CHALLENGE
} state_main_fsm_t;

state_main_fsm_t state_main_fsm, state_main_fsm_next;

typedef enum logic [3:0] {
    FREEZE_ADDR_R,
    INCR_ADDR_R,
    GOTO_MSEED_EQ_ADDR,
    GOTO_SECRET_X_ADDR,
    GOTO_VECTOR_Y_ADDR,
    GOTO_MSG_ADDR,
    GOTO_COM_BUFF_ADDR,
    GOTO_HASH_COM_0_ADDR,
    GOTO_COM_2_ADDR_R,
    GOTO_DX_TAIL_E_ADDR,
    GOTO_A0_ADDR_R,
    GOTO_LAST_HASH_ADDR_R,
    GOTO_GRINDING_NONCE_ADDR
} main_addr_read_opc_t;

main_addr_read_opc_t main_addr_read_opc, main_addr_read_opc_next;

typedef enum logic [3:0] {
    FREEZE_ADDR_WR,
    INCR_ADDR_WR,
    GOTO_SEED_EQ_0_ADDR,
    GOTO_Y_ADDR,
    GOTO_MSG_HASH_ADDR,
    GOTO_COM_1_ADDR,
    GOTO_HASH_COM_ADDR,
    GOTO_DX_TAIL_ADDR,
    GOTO_A0_ADDR,
    GOTO_COM_2_ADDR,
    GOTO_LAST_HASH_ADDR,
    INCR_ADDR_WR_BY_A0_WORDS
} main_addr_write_opc_t;

main_addr_write_opc_t main_addr_write_opc, main_addr_write_opc_next;

typedef enum logic [1:0] {
    FREEZE_M_HAT_CTR,
    INCR_M_HAT_CTR,
    INCR_M_HAT_CTR_4x
} m_hat_counter_opc_t;

m_hat_counter_opc_t m_hat_counter_opc, m_hat_counter_opc_next;

wire debug_wire = use_alt_read_addr && main_mem_wren_0;

// *****************
// FSM Decode Logic
always_comb begin
    main_addr_write_opc_next = FREEZE_ADDR_WR;
    main_addr_read_opc_next = FREEZE_ADDR_R;
    main_mem_wren_0_next    = 1'b0;
    keccak_dout_shift_part_next = 1'b0;
    keccak_din_valid_next   = 1'b0;
    x_word_valid_next   = x_word_valid;
    y_word_valid_next   = 1'b0;
    delta_x_word_C2F_valid_next   = delta_x_word_C2F_valid;
    shift_x_word_next   = 1'b0;
    incr_e_next = 1'b0;
    incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND_next = 1'b0;
    valid_u1_word_ctr_goto_prev_round_next = 1'b0;
    use_alt_read_addr_next = 1'b0;
    grind_nonce_c2k_next = grind_nonce_c2k;
    keccak_grind_next   = 1'b0;
    keccak_din_next     = main_mem_dout_0;
    main_mem_din_0_next = keccak_dout_pip;
    keccak_bytelen_din_next = 'h0;
    keccak_command_next = `SHAKE_CMD_64(2*`LAMBDA +8, `MQOM2_PARAM_MQ_N*`FIELD_BASE_LOG2_CARD+2*`LAMBDA);
    keygen_out_next = keygen_out;
    m_hat_counter_opc_next = FREEZE_M_HAT_CTR;
    update_state_next = 1'b0;
    x_word_load_next = 1'b0;
    x_word_rst_next = 1'b0;
    hash_stop_valid_input_next = hash_stop_valid_input;
    poly_comp_ready_fsm_next = 1'b0;
    incr_x_del_ctr_next = incr_x_del_ctr;
    done_next = done || (keccak_reject_nonce && verify);
    bad_sig_next = bad_sig;
    
    case (state_main_fsm)
//        S_IDLE: begin
//            if (verify)
//                main_addr_read_opc_next = GOTO_GRINDING_NONCE_ADDR;
//        end        
        
        S_EXPAND_SEED_KEY: begin
            if (|new_state_train[1+:`HASH_WORDS+2])
                keccak_din_valid_next = 1'b1;
            
            if (new_state_train[2]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'b0;
            end else if (|new_state_train[3+:`HASH_WORDS])
                keccak_bytelen_din_next = 'h8;
                
            if (|new_state_train[0+:`HASH_WORDS-1])
                main_addr_read_opc_next = INCR_ADDR_R;
            
            keccak_dout_shift_part_next = 1'b1;
            main_mem_din_0_next = {keccak_dout[(`X_BITS%64)-1:0], keccak_dout_pip[31:0]};
            
            if ((keccak_dout_valid_train[0] && keccak_dout_valid) || keccak_dout_valid_train[2] ||  keccak_dout_valid_train[4] || keccak_dout_valid_train[7:6] || keccak_dout_valid_train[9] || keccak_dout_valid_train[11] || keccak_dout_valid_train[13]) begin
                main_mem_wren_0_next = 1'b1;
                main_addr_write_opc_next = INCR_ADDR_WR;             
            end
            
            if (keccak_dout_valid_train[7])
                main_mem_din_0_next[63:(`X_BITS%64)] <= 'h0;
            
            if (keccak_dout_valid_train[14])
                main_addr_write_opc_next = GOTO_SEED_EQ_0_ADDR;
        end
        
        S_SEND_X: begin
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_SECRET_X_ADDR;
            else if (new_state_train[1] || x_delivery_counter==(`GF256_PARAL_ELEM_PER_CYCLE-3) || x_delivery_counter==(2*`GF256_PARAL_ELEM_PER_CYCLE-3))
                main_addr_read_opc_next = INCR_ADDR_R;
                
            if (new_state_train[3])
                incr_x_del_ctr_next = 1'b1;
             
            if (new_state_train[4])
                x_word_valid_next = 1'b1;
                
            if (new_state_train[3] || x_delivery_counter==(`GF256_PARAL_ELEM_PER_CYCLE-1) || x_delivery_counter==(2*`GF256_PARAL_ELEM_PER_CYCLE-1) || x_delivery_counter==(3*`GF256_PARAL_ELEM_PER_CYCLE-1))
                x_word_load_next = 1'b1;
                
            if (x_delivery_counter==(`X_WORDS*`GF256_PARAL_ELEM_PER_CYCLE-(`GF256_PARAL_ELEM_PER_CYCLE/2))) begin
                x_word_valid_next = 1'b0;
                incr_x_del_ctr_next = 1'b0;
            end
        end
        
        S_SEND_Y: begin//y_word_valid_next
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_VECTOR_Y_ADDR;
//            else if (new_state_train[`WORD_BYTES/`NUM_PARAL_EQ_VERIFY] || new_state_train[2*`WORD_BYTES/`NUM_PARAL_EQ_VERIFY])
            else if (/*last_y_next && */send_y_ctr == `WORD_BITS/`FIELD_EXT_LOG2_CARD-4)
                main_addr_read_opc_next = INCR_ADDR_R;
            
//            if (new_state_train[3] || new_state_train[3+`WORD_BYTES/`NUM_PARAL_EQ_VERIFY] || new_state_train[3+2*`WORD_BYTES/`NUM_PARAL_EQ_VERIFY])
            if (new_state_train[3] || (!last_y_next && last_y_next_pip))
                x_word_load_next = 1'b1;
                
            if (/*send_y_ctr == 'h0 && */~|new_state_train[3:0])
                y_word_valid_next = 1'b1;
        end
        
        S_EXPAND_EQUATIONS: begin
            keccak_command_next = `SHAKE_CMD_64(2*`LAMBDA +3*8, `LAMBDA);
            
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_MSEED_EQ_ADDR;
            else if (|new_state_train[1+:`HASH_WORDS-1])
                main_addr_read_opc_next = INCR_ADDR_R;
             
            if (|new_state_train[8:2])
                keccak_din_valid_next = 1'b1;
             
            if (new_state_train[3]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'h01;
            end else if (|new_state_train[4+:`HASH_WORDS])
                keccak_bytelen_din_next = 'h8;
            else if  (new_state_train[4+`HASH_WORDS])
                keccak_bytelen_din_next = 'h2;
            
            if (new_state_train[4+`HASH_WORDS])
                keccak_din_next[15:0] = {'h0, m_hat_counter};
                
            if (keccak_dout_valid) begin
                main_addr_write_opc_next = INCR_ADDR_WR;
                main_mem_wren_0_next = 1'b1;
            end
            
            if (keccak_dout_valid_train[1])
                m_hat_counter_opc_next = INCR_M_HAT_CTR;
                
            if (keccak_dout_valid_train[1]) begin
                if (m_hat_counter==`NUM_PARALLEL_ENC-1) begin // NUM_PARALLEL_ENC in, Enc already ready to start
                    keygen_out_next = keygen;
//                    poly_comp_ready_fsm_next = 1'b1;
                end
                
                if (m_hat_counter==`NUM_PARAL_EQ-1) begin // NUM_PARALLEL_ENC in, Enc already ready to start
                    poly_comp_ready_fsm_next = 1'b1;
                end
                
                if (m_hat_counter!=`MQOM2_PARAM_M_HAT-1)
                    update_state_next = 1'b1;
                    
                if (m_hat_counter==`MQOM2_PARAM_M_HAT-1)
                    main_addr_write_opc_next = GOTO_Y_ADDR;
            end
        end
        
        S_STORE_Y: begin
            main_mem_din_0_next = y_word_keygen;
            
            if (y_word_keygen_valid) begin
                main_mem_wren_0_next = 1'b1;
                main_addr_write_opc_next = INCR_ADDR_WR;
            end
            
            if (main_mem_addr_0_write == (`Y_ADDR + `Y_WORDS))
                done_next = 1'b1;
        end
        
        S_HASH_MSG: begin
            keccak_command_next = `SHAKE_CMD_64(`MLEN_BITS+8, `HASH_BITS);
            main_addr_write_opc_next = GOTO_MSG_HASH_ADDR;
            
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_MSG_ADDR;
            else if (|new_state_train[1+:`MSG_WORDS-1])
                main_addr_read_opc_next = INCR_ADDR_R;
                
            if (|new_state_train[2+:`MSG_WORDS+2])
                keccak_din_valid_next = 1'b1;
            
            if (new_state_train[3]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'h02;
            end else if (|new_state_train[4+:`MSG_WORDS-1])
                keccak_bytelen_din_next = 'h8;
            else if (new_state_train[4+`MSG_WORDS-1])
                keccak_bytelen_din_next = ((`MLEN_BYTES%`WORD_BYTES==0) ? 8 : (`MLEN_BYTES%`WORD_BYTES));
            
            
            if (keccak_dout_valid) begin
                main_addr_write_opc_next = INCR_ADDR_WR;
                main_mem_wren_0_next = 1'b1;
            end
            
//            if (keccak_dout_valid_train[`HASH_WORDS-1])
//                update_state_next = 1'b1;
        end
        
        S_BLC_COMMIT: begin
            keccak_command_next = `SHAKE_CMD_64(`N*`HASH_BITS+8, `HASH_BITS);
            main_addr_read_opc_next = GOTO_COM_BUFF_ADDR;
            main_addr_write_opc_next = GOTO_HASH_COM_ADDR;
            
            // Start the ctx & wait for the commit filled signal. Input valid includes runtime sends to Keccak     
            if (|new_state_train[1:0] || commit_filled_train[CMT_TR_LEN-1] || |commit_ctr)
                keccak_din_valid_next = 1'b1;
                
            if (new_state_train[1]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'h06;
            end
            
            // Send a full commit batch at a time
            if (|commit_filled_train || |commit_ctr)
                main_addr_read_opc_next = INCR_ADDR_R;
                
            if (commit_filled_train[CMT_TR_LEN-1] || |commit_ctr)
                keccak_bytelen_din_next = 'h8;
            
            // Store result
            if (keccak_dout_valid) begin
                main_addr_write_opc_next = INCR_ADDR_WR;
//                main_mem_wren_0_next = 1'b1;
            end
            
            if (keccak_dout_valid_train[4]) begin // Note / TODO: change to "if (sign) ... else ..."
                if (sign)
                    main_addr_read_opc_next = GOTO_SECRET_X_ADDR;
                else
                    main_addr_read_opc_next = GOTO_DX_TAIL_E_ADDR;
                main_addr_write_opc_next = GOTO_DX_TAIL_ADDR;
            end
            
            if (keccak_dout_valid || u0_u1_word_full_valid_next)
                main_mem_wren_0_next = 1'b1;
            
            use_alt_read_addr_next = u0_word_coming || u1_word_coming || ({party_idx_i_sub_paral_enc_ctr, paral_enc_ctr} == i_star_e  && verify);
            
            if (u0_word_coming || u1_word_coming)
                main_mem_din_0_next = u0_u1_word_full_width;
        end
        
        S_STORE_LAST_U: begin
            main_mem_din_0_next = u0_u1_word_full_width;
            use_alt_read_addr_next = u0_word_coming || u1_word_coming;
            
            if (u0_u1_word_full_valid_next)
                main_mem_wren_0_next = 1'b1;
        end
        
        S_SEND_X_DX_2_BLC_COMP: begin
            main_addr_read_opc_next = INCR_ADDR_R;
            x_word_load_next    = 1'b1;
            
            if (new_state_train[1+`RAW_CHUNK_NUM +`X_WORDS-2])
                main_mem_din_0_next = {'h0, delta_x_word[0 +: (`X_BITS%`WORD_BITS)]};
            else
                main_mem_din_0_next = delta_x_word;
            
            if (new_state_train[3])
                x_word_valid_next = 1'b1;
                
            if (~|new_state_train[2+`LAMBDA_WORD_RATIO +: `X_WORDS-`LAMBDA_WORD_RATIO]) // in general: ~| some range
                x_word_rst_next = 1'b1;
            
            if (new_state_train[6+`LAMBDA_WORD_RATIO +: `X_WORDS-`LAMBDA_WORD_RATIO])
                main_mem_wren_0_next = 1'b1;
            
            if (`X_WORDS-1 > `LAMBDA_WORD_RATIO) begin // i.e. if there's more than one Delta_x_tail words to store
                if (new_state_train[6+`LAMBDA_WORD_RATIO +: `X_WORDS-3])
                    main_addr_write_opc_next = INCR_ADDR_WR;
            end
                
            if (new_state_train[3+`RAW_CHUNK_NUM]) begin
                incr_e_next   = 1'b1;
                main_addr_write_opc_next = GOTO_SEED_EQ_0_ADDR;
                x_word_valid_next = 1'b0;
            end
        end
        
        S_SEND_DX_TAIL_2_BLC_COMP: begin
            x_word_load_next    = 1'b1;
            
//            if (~|new_state_train[1:0])
            if (new_state_train[1])
                delta_x_word_C2F_valid_next = 1'b1;
                
            if (~|new_state_train[3+`LAMBDA_WORD_RATIO +: `X_WORDS-`LAMBDA_WORD_RATIO]) // in general: ~| some range
                x_word_rst_next = 1'b1;
                
            if (`X_WORDS-`LAMBDA_WORD_RATIO > 1) begin // this should be ignored if Delta_x_tail is 1 word only
                if (|new_state_train[1+`LAMBDA_WORD_RATIO +: `X_WORDS-`LAMBDA_WORD_RATIO-1])
                    main_addr_read_opc_next = INCR_ADDR_R;
            end   
            
            if (new_state_train[3+`RAW_CHUNK_NUM-1])
                delta_x_word_C2F_valid_next = 1'b0;
                
            if (new_state_train[3+`RAW_CHUNK_NUM]) begin
                incr_e_next   = 1'b1;
                main_addr_write_opc_next = GOTO_SEED_EQ_0_ADDR;
            end
        end
        
        S_COMP_COM_1: begin
            keccak_command_next = `SHAKE_CMD_64(`TAU*(`HASH_BITS+`DELTA_X_TAIL_BITS)+8, `HASH_BITS);
            main_addr_write_opc_next = GOTO_COM_1_ADDR;
            
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_HASH_COM_0_ADDR;
            else if (main_mem_addr_0_read == (`HASH_COM_0_ADDR+`TAU*`HASH_WORDS-2))
                main_addr_read_opc_next = GOTO_DX_TAIL_E_ADDR;
            else if (main_mem_addr_0_read[$clog2(`MAIN_MEM_DEPTH)-1:1] != ((`DX_TAIL_0_ADDR+`TAU*`DELTA_X_TAIL_WORDS+4)>>1))
                main_addr_read_opc_next = INCR_ADDR_R;
            
            if (~|new_state_train[1:0] && !hash_stop_valid_input)
                keccak_din_valid_next = 1'b1;
            
            // NOTE: Comment out com_1_delta_tail_ctr if needed: depending on parameter set, DELTA_X_TAIL_WORDS may be 1
            if (new_state_train[3]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'h07;
            end else if (|new_state_train[2:0] || hash_stop_valid_input)
                keccak_bytelen_din_next = 'h0;
            else if (com_1_delta_tail_reached && com_1_delta_tail_ctr == `DELTA_X_TAIL_WORDS-1)
                keccak_bytelen_din_next = (`DELTA_X_TAIL_BITS % `WORD_BITS)/8;
            else
                keccak_bytelen_din_next = 'h8;
                
            if (keccak_dout_valid) begin
                main_addr_write_opc_next = INCR_ADDR_WR;
                main_mem_wren_0_next = 1'b1;
            end
            
            if (keccak_dout_valid_train[`HASH_WORDS])
                hash_stop_valid_input_next = 1'b0;
            else if (main_mem_addr_0_read[$clog2(`MAIN_MEM_DEPTH)-1:1] == ((`DX_TAIL_0_ADDR+`TAU*`DELTA_X_TAIL_WORDS+2)>>1))
                hash_stop_valid_input_next = 1'b1;
            
//            if (keccak_dout_valid_train[`HASH_WORDS])
//                main_addr_write_opc_next = GOTO_A0_ADDR;
        end
        
        S_STORE_ALPHAS: begin//valid_u1_word_ctr_goto_prev_round_next
            main_mem_din_0_next = z_word ^ main_mem_dout_0; // accumulate the alphas
            
            if (z_word_valid_next) begin
                main_addr_write_opc_next = INCR_ADDR_WR_BY_A0_WORDS;
                main_mem_wren_0_next = 1'b1;
            end if (!z_coming)
                main_addr_write_opc_next = GOTO_A0_ADDR;
                
            // Verify-relevant only
            if (use_alt_read_addr)
                incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND_next = 1'b1;
            
            if (new_state_train[0] || send_next_alpha_1)
                use_alt_read_addr_next = 1'b1;
            
            if (use_alt_read_addr)
                incr_e_next = 1'b1;
            
//            if (new_state_train[0]) begin
                
//            end
        end
        
        S_HASH_ALPHAS: begin
            main_addr_write_opc_next = GOTO_COM_2_ADDR;
            keccak_command_next = `SHAKE_CMD_64(2*`A0_BITS_TOTAL+8, `HASH_BITS);
            
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_A0_ADDR_R;
            else if (keccak_input_data_done_train[0])
                main_addr_read_opc_next = GOTO_COM_2_ADDR_R;
            else
                main_addr_read_opc_next = INCR_ADDR_R;
            
            if (~|new_state_train[1:0] && !hash_stop_valid_input)
                keccak_din_valid_next = 1'b1;
            
            if (new_state_train[3]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'h03;
            end else if (|new_state_train[2:0] || hash_stop_valid_input)
                keccak_bytelen_din_next = 'h0;
            else if (last_a_word_flag)
                keccak_bytelen_din_next = (`A0_BITS_LAST_WORD)/8;
            else
                keccak_bytelen_din_next = 'h8;
                
            if (main_mem_addr_0_read == (`A1_ADDR + `A0_WORDS+1))
                hash_stop_valid_input_next = 1'b1;
                
            if (keccak_dout_valid) begin
                main_addr_write_opc_next = INCR_ADDR_WR;
                main_mem_wren_0_next = 1'b1;
            end
            
            if (keccak_dout_valid_train[`HASH_WORDS]) begin
                main_addr_write_opc_next = GOTO_LAST_HASH_ADDR;
                hash_stop_valid_input_next = 1'b0;
                
                if (verify)
                    done_next = 1'b1;
            end
            
            // Compare com'_2 with com_2 (Verifier only)
            if (reject_com_2_prime)
                bad_sig_next = 1'b1;
        end
        
        S_HASH_LAST: begin
            if (keccak_dout_valid_train[0])
                main_addr_write_opc_next = GOTO_LAST_HASH_ADDR;
                
            keccak_command_next = `SHAKE_CMD_64((4*`HASH_BITS) +(`MQOM2_PARAM_M_HAT*`FIELD_EXT_LOG2_CARD) +8, `HASH_BITS);
            
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_MSEED_EQ_ADDR;
            else if (keccak_dout_valid_train[`HASH_WORDS])
                main_addr_read_opc_next = GOTO_GRINDING_NONCE_ADDR;
            else
                main_addr_read_opc_next = INCR_ADDR_R;
            
            if (~|new_state_train[1:0] && !hash_stop_valid_input)
                keccak_din_valid_next = 1'b1;
            
            if (new_state_train[3]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'h04;
            end else if (|new_state_train[2:0] || hash_stop_valid_input)
                keccak_bytelen_din_next = 'h0;
            else if (main_mem_addr_0_read == (`COM_1_ADDR+1))
                keccak_bytelen_din_next = (`Y_BITS_LAST_WORD)/8;
            else
                keccak_bytelen_din_next = 'h8;
                
            if (main_mem_addr_0_read == (`MSH_HASH_ADDR + `HASH_WORDS+1))
                hash_stop_valid_input_next = 1'b1;
                
            if (keccak_dout_valid) begin
                main_addr_write_opc_next = INCR_ADDR_WR;
                main_mem_wren_0_next = 1'b1;
            end
            
            if (keccak_dout_valid_train[`HASH_WORDS]) begin
//                main_addr_write_opc_next = GOTO_LAST_HASH_ADDR;
                hash_stop_valid_input_next = 1'b0;
            end
        end
        
        S_SAMPLE_CHALLENGE: begin
            keccak_dout_shift_part_next = 1'b1;
            keccak_grind_next = 1'b1;
            keccak_command_next = `SHAKE_CMD_64(`HASH_BITS+`GRIND_NONCE_BITS+8, 16*`TAU);
            main_mem_din_0_next = {'h0, grind_nonce_k2c};
            
            if (new_state_train[0])
                main_addr_read_opc_next = GOTO_LAST_HASH_ADDR_R;
            else
                main_addr_read_opc_next = INCR_ADDR_R;
            
            if (|new_state_train[2 +: `HASH_WORDS+3])
                keccak_din_valid_next = 1'b1;
            
            if (new_state_train[3]) begin
                keccak_bytelen_din_next = 'h1;
                keccak_din_next[7:0] = 8'h05;
            end else if (|new_state_train[4 +: `HASH_WORDS])
                keccak_bytelen_din_next = 'h8;
            else if (new_state_train[4 + `HASH_WORDS])
                keccak_bytelen_din_next = (`GRIND_NONCE_BITS/3); // We're not really sending anything here, but the C2K router module doesn't know how else to work when keccak_grind == 1'b1
            
            if (keccak_dout_valid_train[1])
                main_mem_wren_0_next = 1'b1;
                
            if (enc_fsm_done)// || (verify && keccak_reject_nonce))
                done_next = 1'b1;
            
            // Verification-relevant stuff:
            if (new_state_train[3])
                grind_nonce_c2k_next = main_mem_dout_0;
            
            if (verify && keccak_reject_nonce)
                bad_sig_next = 1'b1;
        end
    endcase
end

// ************************
// FSM State Update Logic
always_ff @ (posedge clk) state_main_fsm <= rst ? S_IDLE : state_main_fsm_next;
    
always_comb begin
    state_main_fsm_next <= state_main_fsm;
        
    case (state_main_fsm)
        S_IDLE:
            if (done)
                state_main_fsm_next <= S_IDLE;
            else if (keygen)
                state_main_fsm_next <= S_EXPAND_SEED_KEY;
            else if (sign)
                state_main_fsm_next <= S_HASH_MSG;
            else if (verify)
                state_main_fsm_next <= S_HASH_MSG;
        
        S_EXPAND_SEED_KEY:
            if (keccak_dout_valid_train[14])
                state_main_fsm_next <= S_SEND_X;
        
        S_SEND_X:
            if (x_delivery_counter==(`X_WORDS*`GF256_PARAL_ELEM_PER_CYCLE-(`GF256_PARAL_ELEM_PER_CYCLE/2))) begin
                if (keygen)
                    state_main_fsm_next <= S_EXPAND_EQUATIONS;
                else
                    state_main_fsm_next <= S_BLC_COMMIT;
            end
        
        S_EXPAND_EQUATIONS:
//            if ((m_hat_counter==`MQOM2_PARAM_M_HAT-1) && keccak_dout_valid_train[2])
            if (main_mem_addr_0_write==`Y_ADDR)
                state_main_fsm_next <= keygen ? S_STORE_Y : S_COMP_COM_1;
        
        S_HASH_MSG: if (keccak_dout_valid_train[`HASH_WORDS-1]) begin
            if (sign)
                state_main_fsm_next <= S_SEND_X;
            else
                state_main_fsm_next <= S_HASH_LAST;
        end
        
        S_BLC_COMMIT: begin
            if (keccak_dout_valid_train[4]) begin
                if (sign)
                    state_main_fsm_next <= S_SEND_X_DX_2_BLC_COMP;
                else
                    state_main_fsm_next <= S_SEND_DX_TAIL_2_BLC_COMP;
            end
        end
        
        S_STORE_LAST_U: begin
//            if (u0_u1_word_full_valid_pip && !(u0_word_coming || u1_word_coming)) begin
            if (exit_state_store_last_u) begin
                state_main_fsm_next <= S_EXPAND_EQUATIONS;
            end
        end
        
        S_SEND_X_DX_2_BLC_COMP:
            if (new_state_train[3+`RAW_CHUNK_NUM])
                state_main_fsm_next <= `LAST_MPC_ROUND ? S_STORE_LAST_U : S_BLC_COMMIT;
        
        S_SEND_DX_TAIL_2_BLC_COMP:
            if (new_state_train[3+`RAW_CHUNK_NUM])
                state_main_fsm_next <= `LAST_MPC_ROUND ? S_STORE_LAST_U : S_BLC_COMMIT;
        
        S_COMP_COM_1:
            if (keccak_dout_valid_train[`HASH_WORDS])
                state_main_fsm_next <= S_STORE_ALPHAS;
                
        S_STORE_ALPHAS:
            if ((main_mem_addr_0_write == (`A1_ADDR + `A0_WORDS + `A0_WORDS_PER_ROUND -1)) || (verify && main_mem_addr_0_write == (`A0_ADDR + `A0_WORDS + `A0_WORDS_PER_ROUND -1)))
                state_main_fsm_next <= S_HASH_ALPHAS;
                
        S_HASH_ALPHAS:
            if (keccak_dout_valid_train[`HASH_WORDS])
                state_main_fsm_next <= verify ? S_IDLE : S_HASH_LAST;   
                     
        S_HASH_LAST:
            if (keccak_dout_valid_train[`HASH_WORDS] && !new_state_train[0])
                state_main_fsm_next <= S_SAMPLE_CHALLENGE;
                
        S_SAMPLE_CHALLENGE:
            if (keccak_dout_valid_train[`CEIL_A_DIV_B(`TAU*16+1, `KECCAK_PARTIAL_SHIFT_LEN)] && verify)
                state_main_fsm_next <= S_SEND_Y;
        
        S_SEND_Y:
            if (send_y_done)
                state_main_fsm_next <= S_BLC_COMMIT;
                
    endcase
    
    if (done)
        state_main_fsm_next <= S_IDLE;
end

// ****************************
// Pipeline signals
always_ff @ (posedge clk) begin
    keccak_dout_shift_part <= keccak_dout_shift_part_next;
    keccak_din <= keccak_din_next;
    keccak_din_valid <= keccak_din_valid_next;
    shift_x_word <= shift_x_word_next;
    x_word_load <= x_word_load_next;
    x_word_rst <= x_word_rst_next;
    u0_u1_word_full_valid_pip <= u0_u1_word_full_valid;
    u0_u1_word_full_valid_pip2 <= u0_u1_word_full_valid_pip;
    exit_state_store_last_u <= u0_u1_word_full_valid_pip2 && u0_u1_word_full_valid_pip && !u0_u1_word_full_valid && (!u0_word_coming || verify);
    
    last_a_word_flag <= (expand_eq_round_ctr == `EXPAND_EQ_VALID_OUT_ROUNDS-1);
    
    keccak_grind <= keccak_grind_next;
    grind_nonce_c2k <= grind_nonce_c2k_next;
    
    choose_wr_addr <= main_mem_wren_0_next || state_main_fsm == S_STORE_ALPHAS;
    
    poly_comp_ready_fsm <= poly_comp_ready_fsm_next;
    
    use_alt_read_addr <= use_alt_read_addr_next;
    use_alt_read_addr_pip <= use_alt_read_addr;
    use_alt_read_addr_pip2 <= use_alt_read_addr_pip;
    alpha_1_out_valid <= use_alt_read_addr_pip2 && state_main_fsm == S_STORE_ALPHAS;
    
    alpha_1_out <= main_mem_dout_0;
        
    if ( state_main_fsm != S_COMP_COM_1 )
        com_1_delta_tail_reached <= 1'b0;
    else if ( main_mem_addr_0_read==`DX_TAIL_0_ADDR+1 )
        com_1_delta_tail_reached <= 1'b1;
    
    keccak_command <= keccak_command_next;
    keccak_bytelen_din <= keccak_bytelen_din_next;
    main_mem_din_0 <= main_mem_din_0_next;
    
    keccak_dout_pip <= keccak_dout;
    
    x_word <= x_word_rst ? 'h0 :
              x_word_load ? main_mem_dout_0 : (x_word>>`BASE_FIELD_ELEM_PARAL_WIDTH);
    
    commit_filled_train <= {commit_filled_train[CMT_TR_LEN-2:0], commit_filled};
    
    last_y_next_pip <= last_y_next;
    
    if (new_state_train[3])
        send_y_ctr <= 'h0;
    else if (state_main_fsm == S_SEND_Y)
        send_y_ctr <= send_y_ctr + 'h1;
                 
    if (commit_filled_train[CMT_TR_LEN-1])
        commit_ctr <= 'h1;
    else if (commit_ctr!=0)
        commit_ctr <= commit_ctr + 'h1;
    
    z_coming_pip <= z_coming;
    
    reject_com_2_prime <= verify && keccak_dout_valid && (verifier_hash_compare_regs[`HASH_WORDS-1] !== keccak_dout);
    
    keccak_input_data_done_train <= {keccak_input_data_done_train, keccak_input_data_done};
    
    if (state_main_fsm == S_HASH_ALPHAS && (|keccak_input_data_done_train[4 +: `HASH_WORDS] || keccak_dout_valid)) begin
        verifier_hash_compare_regs[0] <= main_mem_dout_0;
        
        for (int i0 = 1; i0<`HASH_WORDS; i0++)
                verifier_hash_compare_regs[i0] <= verifier_hash_compare_regs[i0-1];
    end
    
    if (rst)
        expand_eq_round_ctr <= 'h0;
    else if ((z_coming_pip && !z_coming) || (state_main_fsm == S_HASH_ALPHAS && keccak_din_valid))
        expand_eq_round_ctr <= (expand_eq_round_ctr == `EXPAND_EQ_VALID_OUT_ROUNDS-1) ? 'h0 : (expand_eq_round_ctr +1'b1);
    
    if (rst)
        valid_u0_word_ctr <= 'h0;
    else if (u0_word_coming && u0_u1_word_full_valid_next)
        valid_u0_word_ctr <= (valid_u0_word_ctr==`A0_WORDS-1) ? 'h0 : (valid_u0_word_ctr+1'b1);
    
    if (rst)
        valid_u1_word_ctr <= 'h0;
    else if ((!u0_word_coming && u1_word_coming && u0_u1_word_full_valid_next))
        valid_u1_word_ctr <= (valid_u1_word_ctr==`A0_WORDS-1) ? 'h0 : (valid_u1_word_ctr+1'b1);
    else if (incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND) begin
        if `LAST_MPC_ROUND
            valid_u1_word_ctr <= (valid_u1_word_ctr - (`A0_WORDS_PER_ROUND*(`TAU-1) - 'h1));
        else
            valid_u1_word_ctr <= (valid_u1_word_ctr + `A0_WORDS_PER_ROUND);
    end //else if (valid_u1_word_ctr_goto_prev_round)
        //valid_u1_word_ctr <= (valid_u1_word_ctr - (`A0_WORDS - 'h1));
        
    if (u0_word_coming) 
        main_mem_addr_0_read_alt <= `A0_ADDR + valid_u0_word_ctr;
    else if (u1_word_coming || state_main_fsm == S_STORE_ALPHAS)
        main_mem_addr_0_read_alt <= `A1_ADDR + valid_u1_word_ctr;
    else if (commit_filled_train[0])
        main_mem_addr_0_read_alt <= `COMMITS_I_STAR_ADDR + (e << $clog2(`HASH_WORDS));
    else
        main_mem_addr_0_read_alt[0+:$clog2(`HASH_WORDS)] <= main_mem_addr_0_read_alt[0+:$clog2(`HASH_WORDS)] + 1'b1;
    
//    if (state_main_fsm == S_EXPAND_SEED_KEY) begin
//        if (`KECCAK_PARTIAL_SHIFT_LEN == 'h20) // If shift_len == 'd32, don't keep anything
//            hold_keccak_res_regs <= keccak_dout[31:0];
//        else
//            hold_keccak_res_regs <= {keccak_dout[`KECCAK_PARTIAL_SHIFT_LEN-1:0], hold_keccak_res_regs[64-(`X_BITS%64)-1:`KECCAK_PARTIAL_SHIFT_LEN]};
//    end
end

// ****************************
// Memory input update logic
always_ff @ (posedge clk) begin
//    main_mem_addr_0 <= main_mem_wren_0 ? main_mem_addr_0_write    :
//                     use_alt_read_addr ? main_mem_addr_0_read_alt : main_mem_addr_0_read;
    main_mem_addr_0 <= use_alt_read_addr ? main_mem_addr_0_read_alt :
                         choose_wr_addr ? main_mem_addr_0_write : main_mem_addr_0_read;
    
    if (rst) begin
        main_mem_wren_0_out <= 1'b0;
        main_mem_wren_0 <= 1'b0;
        m_hat_counter <= 'b0;
        bad_sig <= 'b0;
        
//        last_mpc_round_out <= `LAST_MPC_ROUND;
        
        main_addr_write_opc <= FREEZE_ADDR_WR;
        main_addr_read_opc <= FREEZE_ADDR_R;
        m_hat_counter_opc <= FREEZE_M_HAT_CTR;
        
        main_mem_addr_0_write <= `SECRET_X_ADDR;
        main_mem_addr_0_read <= `SEED_KEY_ADDR;
        
        party_idx_i_sub_paral_enc_ctr <= `N/`NUM_PARALLEL_ENC -1;
        paral_enc_ctr <= 'b0; // could be commit_filled for extra safety
        
        incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND <= 1'b0;
        valid_u1_word_ctr_goto_prev_round <= 1'b0;
    end else begin
        bad_sig <= bad_sig_next;
        main_mem_wren_0_out <= main_mem_wren_0;
        main_mem_wren_0 <= main_mem_wren_0_next;
        
        incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND <= incr_valid_u1_word_ctr_by_A0_WORDS_PER_ROUND_next;
        valid_u1_word_ctr_goto_prev_round <= valid_u1_word_ctr_goto_prev_round_next;
        
        main_addr_write_opc <= main_addr_write_opc_next;
        main_addr_read_opc <= main_addr_read_opc_next;
        m_hat_counter_opc <= m_hat_counter_opc_next;
        
        if (commit_filled_train[CMT_TR_LEN-1] || (|commit_ctr[$bits(commit_ctr)-1 : $clog2(`NUM_PARALLEL_ENC)] && ~|commit_ctr[$clog2(`NUM_PARALLEL_ENC)-1:0])) // Every `NUM_PARALLEL_ENC clocks
            paral_enc_ctr <= paral_enc_ctr + 1'b1;
        
        if (commit_filled)
            party_idx_i_sub_paral_enc_ctr <= party_idx_i_sub_paral_enc_ctr + 1'b1;
        
        case (main_addr_write_opc)
            INCR_ADDR_WR: main_mem_addr_0_write <= main_mem_addr_0_write + 1'b1;
            
            GOTO_SEED_EQ_0_ADDR: main_mem_addr_0_write <= `SEED_EQ_0_ADDR;
            
            GOTO_Y_ADDR: main_mem_addr_0_write <= `Y_ADDR;
            
            GOTO_MSG_HASH_ADDR: main_mem_addr_0_write <= `MSH_HASH_ADDR;
            
            GOTO_COM_1_ADDR: main_mem_addr_0_write <= `COM_1_ADDR;
            
            GOTO_HASH_COM_ADDR: main_mem_addr_0_write <= `HASH_COM_0_ADDR + (e << $clog2(`HASH_WORDS)); // Go to the storage place for hash_com[e]
            
            GOTO_DX_TAIL_ADDR: main_mem_addr_0_write <= `DX_TAIL_0_ADDR + (e << $clog2(`DELTA_X_TAIL_WORDS)); // Go to the Delta_x[e] storage place
            
            GOTO_A0_ADDR: main_mem_addr_0_write <= `A0_ADDR + expand_eq_round_ctr;
            
            GOTO_COM_2_ADDR: main_mem_addr_0_write <= `COM_2_ADDR;
            
            GOTO_LAST_HASH_ADDR: main_mem_addr_0_write <= `LAST_HASH_ADDR;
            
            INCR_ADDR_WR_BY_A0_WORDS: main_mem_addr_0_write <= main_mem_addr_0_write + `A0_WORDS_PER_ROUND;
        endcase
                
        case (main_addr_read_opc)
            INCR_ADDR_R: main_mem_addr_0_read <= main_mem_addr_0_read + 1'b1;
            
            GOTO_MSEED_EQ_ADDR: main_mem_addr_0_read <= `MSEED_EQ_ADDR;
            
            GOTO_SECRET_X_ADDR: main_mem_addr_0_read <= `SECRET_X_ADDR;
            
            GOTO_VECTOR_Y_ADDR: main_mem_addr_0_read <= `Y_ADDR;
            
            GOTO_MSG_ADDR: main_mem_addr_0_read <= `MSG_ADDR;
            
            GOTO_COM_BUFF_ADDR: main_mem_addr_0_read <= `COM_BUFF_ADDR;
            
            GOTO_HASH_COM_0_ADDR: main_mem_addr_0_read <= `HASH_COM_0_ADDR;
            
            GOTO_COM_2_ADDR_R: main_mem_addr_0_read <= `COM_2_ADDR;
            
            GOTO_DX_TAIL_E_ADDR: main_mem_addr_0_read <= `DX_TAIL_0_ADDR + (e << $clog2(`DELTA_X_TAIL_WORDS));
            
            GOTO_A0_ADDR_R: main_mem_addr_0_read <= `A0_ADDR;
            
            GOTO_LAST_HASH_ADDR_R: main_mem_addr_0_read <= `LAST_HASH_ADDR;
            
            GOTO_GRINDING_NONCE_ADDR: main_mem_addr_0_read <= `GRINDING_NONCE_ADDR;
        endcase
                
        case (m_hat_counter_opc)
            INCR_M_HAT_CTR: m_hat_counter <= (m_hat_counter==`MQOM2_PARAM_M_HAT-1) ? 'h0 : (m_hat_counter+1'b1);
            
//            INCR_M_HAT_CTR_4x: m_hat_counter <= (m_hat_counter==`MQOM2_PARAM_M_HAT-4) ? 'h0 : (m_hat_counter+3'h4);
        endcase
        
    end
end

always_ff @ (posedge clk) begin // update routine flags
    if (rst) begin
        keygen <= 1'b0;
        keygen_out <= 1'b0;
        sign  <= 1'b0;
        sign_out  <= 1'b0;
        verify <= 1'b0;
        verify_out <= 1'b0;
        update_state <= 1'b0;
        done <= 1'b0;
        done_out <= 1'b0;
        e <= 1'b0;
        incr_e <= 1'b0;
        hash_stop_valid_input <= 1'b0;
        
        x_delivery_counter <= 'b0;
        incr_x_del_ctr <= 1'b0;
        comm_received <= 1'b0;
        x_word_valid <= 1'b0;
        y_word_valid <= 1'b0;
        delta_x_word_C2F_valid <= 1'b0;
        com_1_delta_tail_ctr <= 'b0;
        
    end else begin
        keygen_out <= keygen_out_next;
        update_state <= update_state_next;
        incr_x_del_ctr <= incr_x_del_ctr_next;
        x_word_valid <= x_word_valid_next;
        y_word_valid <= y_word_valid_next;
        delta_x_word_C2F_valid <= delta_x_word_C2F_valid_next;
        done <= done_next;
        sign_out <= sign;
        verify_out <= verify;
            
        incr_e <= incr_e_next;
        
        if (incr_e)
            e <= `LAST_MPC_ROUND ? 'h0 : (e +1'b1);
            
        hash_stop_valid_input <= hash_stop_valid_input_next;
        
        if (state_main_fsm == S_IDLE)
            done_out <= done;
        
        if (incr_x_del_ctr) x_delivery_counter <= x_delivery_counter + 1'b1;
        
        if (com_1_delta_tail_reached) begin
            if (`DELTA_X_TAIL_WORDS == (1 << $clog2(`DELTA_X_TAIL_WORDS)))
                com_1_delta_tail_ctr <= com_1_delta_tail_ctr + 1'b1;
            else
                com_1_delta_tail_ctr <= (com_1_delta_tail_ctr == `DELTA_X_TAIL_WORDS-1) ? 'h0 : (com_1_delta_tail_ctr + 1'b1);
        end
        
        if (~comm_received) begin
            if (|start_comm)
                comm_received <= 1'b1;
                
            case (start_comm)
                `START_KEYGEN: keygen <= 1'b1;
                
                `START_SIGN: sign  <= 1'b1;
                
                `START_VERIFY: verify <= 1'b1;
            endcase
        end
    end
    
    if (rst)
        new_state_train <= 'h0;
    else
        new_state_train <= {new_state_train, (state_main_fsm_next != state_main_fsm) || update_state}; 
    
    if (rst)
        keccak_dout_valid_train <= 'h0;
//    else if (keccak_dout_valid)
//        keccak_dout_valid_train <= keccak_dout_valid_train << 1;
    else if (new_state_train[0])
        keccak_dout_valid_train <= 1'b1;
    else if (keccak_dout_valid)
        keccak_dout_valid_train <= keccak_dout_valid_train << 1;
end

endmodule

`default_nettype wire