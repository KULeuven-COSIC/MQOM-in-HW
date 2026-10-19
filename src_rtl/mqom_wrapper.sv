`default_nettype none

`include "mqom2_main_header.vh"

module mqom_wrapper(
    input wire          rst,
    input wire          clk,
    
    input wire [1:0]    start_comm,
    
    output wire         done,
    output wire         bad_sig
);

wire [`WORD_BITS-1:0] main_mem_din_0, main_mem_dout_0;
wire [`LAMBDA-1:0]    main_mem_din_1, main_mem_dout_1;

wire [$clog2(`MAIN_MEM_DEPTH)-1:0] main_mem_addr_0;
wire [$clog2(`MAIN_MEM_DEPTH/`LAMBDA_WORD_RATIO)-1:0] main_mem_addr_1;

wire main_mem_wren_0, main_mem_wren_1;

wire [`WORD_BITS-1:0] keccak_dout, keccak_din, keccak_command;

wire [`WORD_BITS-1:0] y_word_keygen;
wire y_word_keygen_valid;//, y_done_keygen;

wire [`WORD_BYTES_LOG2:0] c2k_bytelen_din;

wire                  c2k_shift_partial;
wire                  k2c_dout_valid, c2k_din_valid;
//wire                  keccak_done;
wire                  k2c_input_data_done;

wire                  keygen, sign, verify;

wire [`WORD_BITS-1:0] x_word;
wire                           x_word_valid;
wire                           y_word_valid;

wire [`DELTA_X_WORD_REG_W-1:0] delta_x_word;
//wire                           delta_x_word_valid;

wire                         raw_chunk_valid;
wire                         commit_filled;
wire                         enc_fsm_done;
//wire                         send_x;

wire expand_eq_input_valid, expand_eq_out_valid, sample_is_b_vec, end_of_row;
wire [$clog2(`LAMBDA/`WORD_BITS)-1:0]   a_row_q_last_bits;
wire [16*`NUM_PARALLEL_ENC-1:0]         expand_eq_out;
wire [`LAMBDA*`NUM_PARALLEL_ENC-1:0]    expand_eq_input;

wire [`LAMBDA-1:0] result_0_enc;

wire [$clog2($clog2(`N-1))-1:0] p_i;
wire  [`RAW_CHUNK_BITS-1 : 0] raw_share;

wire [`GF256_ELEM_PARAL_WIDTH-1:0] x0_word;
//wire [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0] u0_word;
//wire [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0] u1_word;
//wire [`GF256_ELEM_PARAL_WIDTH_SMALL_VEC-1:0] u0_u1_word;

wire x_0_word_valid;
//wire u_0_word_valid;
//wire u_1_word_valid;
wire poly_comp_ready;

wire                  send_next_alpha_1, z_word_valid_next, z_coming, last_y_next, send_y_done;
wire [`WORD_BITS-1:0] z_word;

wire keccak_grind;
wire [`GRIND_NONCE_BITS-1:0] grind_nonce_c2k;
wire [`GRIND_NONCE_BITS-1:0] grind_nonce_k2c;

wire delta_x_word_C2F_valid;
wire sibl_path_valid;
wire [$clog2(`TAU)-1:0] e_enc;
wire [`FIELD_EXT_LOG2_CARD:0] sibl_node;
wire [`FIELD_EXT_LOG2_CARD-1:0] i_star_e;
wire [$clog2(`FIELD_EXT_LOG2_CARD)-1:0] tree_lvl_ctr_j_enc;

wire [`WORD_BITS-1:0] alpha_1_out;
wire alpha_1_out_valid;
wire keccak_reject_nonce;
//wire last_mpc_round_tl;
wire u0_word_coming, u1_word_coming, u0_u1_word_full_valid, u0_u1_word_full_valid_next;

wire [$clog2(`N)-1:0] eval_point_r, eval_point_r_hold;

wire [`WORD_BITS-1:0] u0_u1_word_full_width;

// Main FSM Contorller Instance
mqom_main_fsm mqom_main_fsm_inst (
    .rst                    (rst),
    .clk                    (clk),

    .start_comm             (start_comm),

    .main_mem_dout_0        (main_mem_dout_0),
    .keccak_dout            (keccak_dout),

    .keccak_dout_valid      (k2c_dout_valid),
//    .keccak_done            (keccak_done),
    .keccak_input_data_done (k2c_input_data_done),
    
    .delta_x_word           (delta_x_word),
//    .delta_x_word_valid     (delta_x_word_valid),

    .commit_filled          (commit_filled),
//    .blc_send_x             (send_x),
    
//    .y_done_keygen          (y_done_keygen),
    .y_word_keygen          (y_word_keygen),
    .y_word_keygen_valid    (y_word_keygen_valid),
    
    .alpha_1_out            (alpha_1_out),
    .alpha_1_out_valid      (alpha_1_out_valid),
    
    .keccak_reject_nonce    (keccak_reject_nonce),
    
    .last_y_next            (last_y_next),
    .send_y_done            (send_y_done),
    .send_next_alpha_1      (send_next_alpha_1),
    .z_word_valid_next      (z_word_valid_next),
    .z_coming               (z_coming),
    .z_word                 (z_word),
    
    .grind_nonce_k2c        (grind_nonce_k2c),
    .u0_word_coming         (u0_word_coming),
    .u1_word_coming         (u1_word_coming),
    .u0_u1_word_full_valid  (u0_u1_word_full_valid),
    .u0_u1_word_full_valid_next  (u0_u1_word_full_valid_next),
    .u0_u1_word_full_width  (u0_u1_word_full_width),
    
    .i_star_e               (i_star_e),
    
    .enc_fsm_done           (enc_fsm_done),

    .keygen_out             (keygen),
    .sign_out               (sign),
    .verify_out             (verify),

    .main_mem_din_0         (main_mem_din_0),
    .keccak_command         (keccak_command),
    .keccak_din             (keccak_din),
    .keccak_din_valid       (c2k_din_valid),
    .keccak_bytelen_din     (c2k_bytelen_din),
    .keccak_dout_shift_part (c2k_shift_partial),

    .x_word                 (x_word),

    .x_word_valid           (x_word_valid),
    .y_word_valid           (y_word_valid),
    .delta_x_word_C2F_valid (delta_x_word_C2F_valid),
    .main_mem_wren_0_out    (main_mem_wren_0),

    .main_mem_addr_0        (main_mem_addr_0),
    
    .poly_comp_ready_fsm    (poly_comp_ready),
    
    .keccak_grind           (keccak_grind),
    
    .grind_nonce_c2k        (grind_nonce_c2k),
//    .last_mpc_round_out     (last_mpc_round_tl),
    
    .done_out               (done),
    .bad_sig                (bad_sig)
);

// Enc PRG
enc_prg_wrapper enc_prg_wrapper_inst (
    .rst                (rst),
    .clk                (clk),

    .keygen             (keygen),
    .sign               (sign),
    .verify             (verify),
    
    .poly_comp_ready    (poly_comp_ready),
    
    .sibl_node          (sibl_node),
    .i_star_e           (i_star_e),
    .sibl_path_valid    (sibl_path_valid),

    .main_mem_dout_1    (main_mem_dout_1),
    .main_mem_wren_1_out(main_mem_wren_1),
    .main_mem_addr_1    (main_mem_addr_1),

    .p_i_q              (p_i),
    .share_valid_q      (raw_chunk_valid),
    .raw_share          (raw_share),

    .main_mem_din_1     (main_mem_din_1),
    .result_0           (result_0_enc),
    .commit_filled      (commit_filled),
    .expand_eq_valid    (expand_eq_input_valid),
    .expand_eq_sample   (expand_eq_input),
    .sibl_path_lvl_ctr  (tree_lvl_ctr_j_enc),
    
    .enc_fsm_done       (enc_fsm_done),
    .e                  (e_enc)
);

compute_poly_alpha compute_poly_alpha_inst (
    .rst                (rst),
    .clk                (clk),

    .x_in               (x_word),
    .x_in_valid         (x_word_valid),
    .y_in_valid         (y_word_valid),

    .keygen             (keygen),
    .sign               (sign),
    .verify             (verify),

    .sample_in          (expand_eq_out),
    .sample_in_valid    (expand_eq_out_valid),
    .sample_is_b_vec    (sample_is_b_vec),
    .end_of_row         (end_of_row),
    .a_row_q_last_bits  (a_row_q_last_bits),

    .alpha_1_in_valid  (alpha_1_out_valid),
    .alpha_1_in        (alpha_1_out),

    .x0_word            (x0_word),
//    .u0_word            (u0_word),
//    .u1_word            (u1_word),
//    .u0_u1_word         (u0_u1_word),
    .x_0_word_valid     (x_0_word_valid),
//    .u_0_word_valid     (u_0_word_valid),
//    .u_1_word_valid     (u_1_word_valid),
    
    .eval_point_r_hold  (eval_point_r_hold),
    
    .y_word_out         (y_word_keygen),
    .y_word_valid       (y_word_keygen_valid),
//    .y_done             (y_done_keygen),
    
    .last_y_next        (last_y_next),
    .send_y_done        (send_y_done),
    
    .send_next_alpha_1  (send_next_alpha_1),
    .z_out_valid_next   (z_word_valid_next),
    .z_coming           (z_coming),
    .z_word_out         (z_word)
    
//    .poly_comp_ready    (poly_comp_ready)
);

// Get_sibling_path module
get_sibling_path get_sibl_path_inst (
    .rst                (rst),
    .clk                (clk),
    .keccak_grind       (keccak_grind),
    .keccak_dout_valid  (k2c_dout_valid),
    .keccak_dout        (keccak_dout),
    .tree_lvl_ctr_j_enc (tree_lvl_ctr_j_enc),
    
    .sibl_path_valid    (sibl_path_valid),
    .sibl_node          (sibl_node),
    .eval_point_r       (eval_point_r),
    .i_star_e           (i_star_e),
    .e                  (e_enc)
);


// BLC Folding Compute module
blc_folding_computer blc_folding_comp_inst (
    .rst                    (rst),
    .clk                    (clk),

    .raw_chunk              (raw_share),
    .raw_chunk_valid        (raw_chunk_valid),
    .p_i                    (p_i),
    .eval_point_r           (eval_point_r),

    .verify                 (verify),

    .x_word                 (x_word),
    .x_word_valid           (x_word_valid),
//    .last_mpc_round         (last_mpc_round_tl),

    .delta_x_word_in_valid  (delta_x_word_C2F_valid),//(delta_x_word_in_valid),

    .delta_x_word           (delta_x_word),
//    .delta_x_word_valid     (delta_x_word_valid),

    .eval_point_r_hold      (eval_point_r_hold),
    
    .x0_word                (x0_word),
//    .u0_u1_word             (u0_u1_word),
//    .u0_word                (u0_word),
//    .u1_word                (u1_word),
    .x_0_word_valid         (x_0_word_valid),
//    .u_0_word_valid         (u_0_word_valid),
//    .u_1_word_valid         (u_1_word_valid),
    
    .u0_word_coming_out     (u0_word_coming),
    .u1_word_coming_out     (u1_word_coming),
    .u0_u1_word_full_valid  (u0_u1_word_full_valid),
    .u0_u1_word_full_valid_next  (u0_u1_word_full_valid_next),
    .u0_u1_word_full_width  (u0_u1_word_full_width),

    .x_0_done               (),//(x_0_done),
    .u_0_done               (),//(u_0_done),
    .u_1_done               ()//(u_1_done),
//    .send_x                 (send_x)//(u_1_done),
);

// Enc PRG output -> matrix A & vector b
gf256_lowertri_pair_streamer gf256_lowertri_pair_streamer_inst (
    .clk          (clk),
    .rst          (rst),

    .input_valid  (expand_eq_input_valid),
    .input_elems  (expand_eq_input),

    .sample_data  (expand_eq_out),
    .sample_valid (expand_eq_out_valid),
    .sample_is_b  (sample_is_b_vec),
    .end_of_row   (end_of_row),

    .a_row_q      (a_row_q_last_bits)
);

// SHAKE XOF instance (Keccak)
keccak_wrapper keccak_inst (
    .rst              ( rst ),
    .clk              ( clk ),

    // Inputs
    .verify_in        ( verify ),
    .grind_in         ( keccak_grind ),
    .grind_nonce_in   ( grind_nonce_c2k ),
    
    .c2k_shift_partial( c2k_shift_partial ),
    .c2k_din_valid    ( c2k_din_valid ),
    .bytelen_din      ( c2k_bytelen_din ),
    .c2k_din          ( keccak_din ),
    .com_in           ( keccak_command ),

    // Outputs
    .k2c_dout         ( keccak_dout ),
    .k2c_dout_valid   ( k2c_dout_valid ),
//    .data_done        ( keccak_done ),
    .input_done       ( k2c_input_data_done ),
    .grind_nonce_out_q( grind_nonce_k2c ),
    .reject_nonce_out ( keccak_reject_nonce)
);

// Main Memory (Asymmetric True Dual-Port RAM)
(* DONT_TOUCH = "TRUE" *) 
asym_ram_tdp_write_first #(
    .WIDTH_0 (`WORD_BITS),
    .DEPTH_0 (`MAIN_MEM_DEPTH),
    .WIDTH_1 (`LAMBDA),
    .DEPTH_1 (`MAIN_MEM_DEPTH/`LAMBDA_WORD_RATIO),
    .FILE    ("mqom_main_mem_init_file.mem")
) main_mem (
  .clock    (clk),
  .data_0   (main_mem_din_0),
  .data_1   (main_mem_din_1),
  .address_0(main_mem_addr_0),
  .address_1(main_mem_addr_1),
  .wren_0   (main_mem_wren_0),
  .wren_1   (main_mem_wren_1),
  .q_0      (main_mem_dout_0),
  .q_1      (main_mem_dout_1)
);

endmodule

`default_nettype wire