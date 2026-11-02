/*
 * enc_prg_wrapper.sv
 * ------------------
 * This file implements the Enc PRG wrapper for MQOM key
 * generation, signing, and verification, including GGM tree
 * expansion, commitment generation, and equation sampling.
 *
 * Copyright (c) 2026 KU Leuven - COSIC
 * Author: Stelios Manasidis
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 */

`default_nettype none

`include "mqom2_main_header.vh"

module enc_prg_wrapper(
    input wire                          rst,
    input wire                          clk,
    
    input wire                          keygen,
    input wire                          sign,
    input wire                          verify,
    
    input wire [`LAMBDA-1 : 0]          main_mem_dout_1,
    
    input wire                          poly_comp_ready,
    
    input wire                          sibl_path_valid,
    input wire [`FIELD_EXT_LOG2_CARD:0] sibl_node,
    input wire [`FIELD_EXT_LOG2_CARD-1:0] i_star_e,
    
    output wire [$clog2(`TAU)-1:0]      e,
    
    output reg [`LAMBDA-1 : 0]          main_mem_din_1,
    output wire [`LAMBDA-1 : 0]         result_0,
    output reg [`RAW_CHUNK_BITS-1 : 0] raw_share,
    
    output wire [`LAMBDA*`NUM_PARALLEL_ENC-1:0] expand_eq_sample,

    output wire                         commit_filled,
    output wire                         expand_eq_valid,
    output reg                          share_valid_q,
    output wire                         enc_fsm_done,
    output wire                         main_mem_wren_1_out,

    output reg [$clog2($clog2(`N-1))-1:0] p_i_q,
    output wire [$clog2(`N-1)-1:0]      omega_out,
//    output wire [$clog2(`N-1)-1:0]      eval_point_r,
    output wire [$clog2($clog2(`N))-1:0] sibl_path_lvl_ctr,
    output wire [$clog2($clog2(`N))-1:0] tree_lvl_ctr_j,
    
    output reg [`MAIN_MEM_ENC_ADDR_BITS-1:0] main_mem_addr_1
);

reg poly_comp_ready_q;
always_ff @ (posedge clk) poly_comp_ready_q <= poly_comp_ready;

wire [$clog2($clog2(`N-1))-1:0] p_i;
wire                         share_valid, rst_raw_regs;
always_ff @ (posedge clk) begin
    share_valid_q <= share_valid;
    p_i_q <= p_i;
//    raw_share <= !share_valid ? 'h0 : result_0[0 +: `RAW_CHUNK_BITS];
    raw_share <= rst_raw_regs ? 'h0 : result_0[0 +: `RAW_CHUNK_BITS];
end

reg [2*`NUM_PARALLEL_ENC*`LAMBDA-1 : 0]  result_regs;
assign result_0 = result_regs[`LAMBDA-1:0];

wire mem_input_is_enc_out, rst_mem_input_regs;
always_ff @ (posedge clk) main_mem_din_1 <= rst_mem_input_regs   ? 'h0                      :
                                            mem_input_is_enc_out ? result_regs[`LAMBDA-1:0] : main_mem_dout_1;

wire enc_ready_in_7, enc_ready_in_6, enc_ready_in_5, enc_ready_in_4, enc_ready_in_3, enc_ready_in_2, enc_ready_in_1, enc_ready, cmt_ctr;

wire [`NUM_PARALLEL_ENC*`LAMBDA-1 : 0] packed_result; // {Res_{N-1}, ... , Res_1, Res_0}

wire [`NUM_PARALLEL_ENC-1:0] seed_regs_load_en;
reg [`NUM_PARALLEL_ENC*`LAMBDA-1 : 0] seed_regs, hold_seeds;

//wire [$clog2($clog2(`N))-1:0] tree_lvl_ctr_j;
//wire [$clog2(`N)-1:0] log2_N_ctr;
//wire [$clog2(`TAU)-1:0] e;
wire [$clog2(`NUM_EXPAND_EQ_ENC_CALLS+1)-1:0] prg_counter;

reg  [`LAMBDA-1 : 0] salt_reg;
wire [`LAMBDA-1 : 0] key_enc;
enc_mode_t           enc_mode;
assign key_enc = salt_reg ^ ((enc_mode==MODE_GGM) ? `SALT_TWEAK_GGM(e, tree_lvl_ctr_j)  :
                             (enc_mode==MODE_CMT) ? `SALT_TWEAK_CMT(e, cmt_ctr)         : `SALT_TWEAK_PRG(e, prg_counter));

wire start_enc, shift_small, shift_tail, add_delta, load_sibl_leaf, pre_load_sibl_leaf, rst_salt, load_salt; // , shift_res_0

reg [`LAMBDA-1:0] preloaded_leaf_regs;

`ifdef PARAL_ENC_4
reg start_enc_pip;
`endif

always_ff @ (posedge clk) begin 
    if (pre_load_sibl_leaf)
        preloaded_leaf_regs <= main_mem_dout_1;
    
//`ifdef PARAL_ENC_4
//    start_enc_pip <= start_enc;
//    if (start_enc)
//        hold_seeds[0 +: 3*`LAMBDA] <= seed_regs[0 +: 3*`LAMBDA]; // Use to get xl & xr to apply psi, etc..
//    if (start_enc_pip)
//        hold_seeds[3*`LAMBDA +: `LAMBDA] <= seed_regs[3*`LAMBDA +: `LAMBDA];
//`else
//    if (start_enc)
//        hold_seeds <= seed_regs; // Use to get xl & xr to apply psi, etc..
//`endif
    start_enc_pip <= start_enc;
    if (start_enc_pip)
        hold_seeds <= seed_regs; // Use to get xl & xr to apply psi, etc..

    if (add_delta)
        result_regs[`LAMBDA/2-1 : 0] <= result_regs[`LAMBDA/2-1 : 0] ^ main_mem_dout_1[`LAMBDA/2-1 : 0];
    else if (load_sibl_leaf)
        result_regs[`LAMBDA/2-1 : 0] <= preloaded_leaf_regs[`LAMBDA/2-1 : 0];
    else if (enc_ready)
        result_regs[`LAMBDA/2-1 : 0] <= packed_result[`LAMBDA/2-1 : 0] ^ hold_seeds[`LAMBDA-1 : `LAMBDA/2] ^ hold_seeds[`LAMBDA/2-1 : 0];
    else //if (shift_res_0)
        result_regs[`LAMBDA/2-1 : 0] <= shift_small ? result_regs[`LAMBDA-1 : `LAMBDA/2] : result_regs[3*`LAMBDA/2-1 : `LAMBDA];
    
    if (add_delta)
        result_regs[`LAMBDA-1 : `LAMBDA/2] <= result_regs[`LAMBDA-1 : `LAMBDA/2] ^ main_mem_dout_1[`LAMBDA-1:`LAMBDA/2];
    else if (load_sibl_leaf)
        result_regs[`LAMBDA-1 : `LAMBDA/2] <= preloaded_leaf_regs[`LAMBDA-1:`LAMBDA/2];
    else if (enc_ready)
        result_regs[`LAMBDA-1 : `LAMBDA/2] <= packed_result[`LAMBDA-1 : `LAMBDA/2] ^ hold_seeds[`LAMBDA/2-1 : 0];
    else if (shift_tail)
        result_regs[`LAMBDA-1 : `LAMBDA/2] <= result_regs[`LAMBDA/2 + `LAMBDA +: `LAMBDA/2];
        
    if (enc_ready)
        result_regs[2*`NUM_PARALLEL_ENC*`LAMBDA-1 : `LAMBDA] <= extend_packed_res_tail(packed_result) ^ tail_mask(hold_seeds);
    else if (shift_tail)
        result_regs[2*`NUM_PARALLEL_ENC*`LAMBDA-1 : `LAMBDA] <= (result_regs[2*`NUM_PARALLEL_ENC*`LAMBDA-1 : `LAMBDA] >> `LAMBDA);
end

always_ff @ (posedge clk) begin
    if (rst_salt)
        salt_reg <= 'h0;
    else if (load_salt)
        salt_reg <= main_mem_dout_1;
end

always_ff @ (posedge clk) begin // update seeds seperately
    if (seed_regs_load_en[0])
        seed_regs[`LAMBDA*0 +: `LAMBDA] <= main_mem_dout_1;
        
    if (seed_regs_load_en[1])
        seed_regs[`LAMBDA*1 +: `LAMBDA] <= main_mem_dout_1;
        
    if (seed_regs_load_en[2])
        seed_regs[`LAMBDA*2 +: `LAMBDA] <= main_mem_dout_1;
        
    if (seed_regs_load_en[3])
        seed_regs[`LAMBDA*3 +: `LAMBDA] <= main_mem_dout_1;    
end

aes_on_the_fly_enc_parallel #(
    .NUM_PARALLEL_ENC(`NUM_PARALLEL_ENC)
) aes_on_the_fly_enc_parallel_inst (
    .rst          (rst),
    .clk          (clk),

    .start        (start_enc),  // Start enc command

    .key          (key_enc),    // Single key
    .plaintext    (seed_regs),  // {Seed_{NUM_PARALLEL_AES-1}, ... , Seed_1, Seed_0}

    .ciphertext   (packed_result),  // {Res_{2*NUM_PARALLEL_AES-1}, ... , Res_1, Res_0}
    .ready_in_7   (enc_ready_in_7),
    .ready_in_6   (enc_ready_in_6),
    .ready_in_5   (enc_ready_in_5),
    .ready_in_4   (enc_ready_in_4),
    .ready_in_3   (enc_ready_in_3),
    .ready_in_2   (enc_ready_in_2),
    .ready_in_1   (enc_ready_in_1),
    .ready        (enc_ready) // goes high for a signle cycle
);

enc_fsm_4_aes_128 enc_fsm_inst (
    .rst                  (rst),
    .clk                  (clk),

    .keygen               (keygen),
    .sign                 (sign),
    .verify               (verify),

    .enc_ready_in_7       (enc_ready_in_7),
    .enc_ready_in_6       (enc_ready_in_6),
    .enc_ready_in_5       (enc_ready_in_5),
    .enc_ready_in_4       (enc_ready_in_4),
    .enc_ready_in_3       (enc_ready_in_3),
    .enc_ready_in_2       (enc_ready_in_2),
    .enc_ready_in_1       (enc_ready_in_1),
    .enc_ready            (enc_ready),
    
    .poly_comp_ready      (poly_comp_ready_q),

    .sibl_node          (sibl_node),
    .i_star_e           (i_star_e),
    .sibl_path_valid    (sibl_path_valid),
    
    .rst_salt             (rst_salt),
    .load_salt            (load_salt),
    .start_enc            (start_enc),
    .shift_small          (shift_small),
    .shift_tail           (shift_tail),
    .add_delta            (add_delta),
    .load_sibl_leaf       (load_sibl_leaf),
    .pre_load_sibl_leaf   (pre_load_sibl_leaf),
    .cmt_ctr              (cmt_ctr),
    .seed_regs_load_en    (seed_regs_load_en),
    .e_out                (e),

    .commit_filled        (commit_filled),
    .expand_eq_valid      (expand_eq_valid),
    .rst_raw_regs         (rst_raw_regs),
    .share_valid          (share_valid),
    .enc_fsm_done         (enc_fsm_done),
    .main_mem_wren_1_out  (main_mem_wren_1_out),
    .mem_input_is_enc_out (mem_input_is_enc_out),
    .rst_mem_input_regs   (rst_mem_input_regs),
    .enc_mode             (enc_mode),

    .sibl_path_lvl_ctr    (sibl_path_lvl_ctr),
    .tree_lvl_ctr_j       (tree_lvl_ctr_j),
    .p_i                  (p_i),
    .omega_out            (omega_out),
//    .eval_point_r         (eval_point_r),
    .prg_counter          (prg_counter),

    .main_mem_addr_1      (main_mem_addr_1)
);

assign expand_eq_sample = (`NUM_PARALLEL_ENC==1) ?  result_regs[0*`LAMBDA+:`LAMBDA] :
                          (`NUM_PARALLEL_ENC==2) ? {result_regs[2*`LAMBDA+:`LAMBDA], result_regs[0*`LAMBDA+:`LAMBDA]} :
                                                   {result_regs[6*`LAMBDA+:`LAMBDA], result_regs[4*`LAMBDA+:`LAMBDA], result_regs[2*`LAMBDA+:`LAMBDA], result_regs[0*`LAMBDA+:`LAMBDA]};

//virtual class rev_class#(parameter WIDTH);
//    static function [WIDTH-1:0] reverse_endianness( // output = rev_class#(`LAMBDA)::reverse_endianness(input);
//        input logic [WIDTH-1:0] in
//    );
    
//        for (int i = 0; i < WIDTH/8; i++)
//            reverse_endianness[i*8 +: 8] = in[(WIDTH/8 - 1 - i)*8 +: 8];
//    endfunction
//endclass

function [`LAMBDA-1:0] mask_left_child( // psi(parent)
    input logic [`LAMBDA-1:0] parent
);
    mask_left_child = {{(`LAMBDA/2){1'b0}}, parent[`LAMBDA/2-1 : 0]} ^ {parent[`LAMBDA/2-1 : 0], parent[`LAMBDA-1 : `LAMBDA/2]};
endfunction

function [`LAMBDA-1:0] mask_right_child( // psi(parent) ^ parent
    input logic [`LAMBDA-1:0] parent
);
    mask_right_child = {parent[`LAMBDA-1 : `LAMBDA/2], {(`LAMBDA/2){1'b0}}} ^ {parent[`LAMBDA/2-1 : 0], parent[`LAMBDA-1 : `LAMBDA/2]};
endfunction

function [(2*`NUM_PARALLEL_ENC*`LAMBDA)-`LAMBDA-1 : 0] tail_mask ( // First `LAMBDA/2 bits of result_0 handled exclusively. This computes the tail mask.
    input logic [`NUM_PARALLEL_ENC*`LAMBDA-1 : 0] packed_seeds
);
//    tail_mask[`LAMBDA/2-1 : 0] = packed_seeds[`LAMBDA/2-1 : 0];
    
    if (`NUM_PARALLEL_ENC==4) begin
        tail_mask[ (`LAMBDA*1)-(`LAMBDA) +: `LAMBDA] = mask_right_child(packed_seeds[0*`LAMBDA +: `LAMBDA]);
            
        tail_mask[ (`LAMBDA*2)-(`LAMBDA) +: `LAMBDA] = mask_left_child(packed_seeds[1*`LAMBDA +: `LAMBDA]);
        
        tail_mask[ (`LAMBDA*3)-(`LAMBDA) +: `LAMBDA] = mask_right_child(packed_seeds[1*`LAMBDA +: `LAMBDA]);
        
        tail_mask[ (`LAMBDA*4)-(`LAMBDA) +: `LAMBDA] = mask_left_child(packed_seeds[2*`LAMBDA +: `LAMBDA]);
        
        tail_mask[ (`LAMBDA*5)-(`LAMBDA) +: `LAMBDA] = mask_right_child(packed_seeds[2*`LAMBDA +: `LAMBDA]);
        
        tail_mask[ (`LAMBDA*6)-(`LAMBDA) +: `LAMBDA] = mask_left_child(packed_seeds[3*`LAMBDA +: `LAMBDA]);
        
        tail_mask[ (`LAMBDA*7)-(`LAMBDA) +: `LAMBDA] = mask_right_child(packed_seeds[3*`LAMBDA +: `LAMBDA]);
        
    end else if (`NUM_PARALLEL_ENC==2) begin
        tail_mask[ (`LAMBDA*1)-(`LAMBDA) +: `LAMBDA] = mask_right_child(packed_seeds[0*`LAMBDA +: `LAMBDA]);
            
        tail_mask[ (`LAMBDA*2)-(`LAMBDA) +: `LAMBDA] = mask_left_child(packed_seeds[1*`LAMBDA +: `LAMBDA]);
        
        tail_mask[ (`LAMBDA*3)-(`LAMBDA) +: `LAMBDA] = mask_right_child(packed_seeds[1*`LAMBDA +: `LAMBDA]);
        
    end else begin   // `NUM_PARALLEL_ENC==1
        tail_mask[ (`LAMBDA)-(`LAMBDA) +: `LAMBDA] = mask_right_child(packed_seeds[0*`LAMBDA +: `LAMBDA]);

    end
endfunction

function [(2*`NUM_PARALLEL_ENC*`LAMBDA)-(`LAMBDA)-1 : 0] extend_packed_res_tail ( // extend the encryption result
    input logic [`NUM_PARALLEL_ENC*`LAMBDA-1 : 0] packed_res
);
//    extend_packed_res_tail[`LAMBDA/2-1 : 0] = packed_res[`LAMBDA-1 : `LAMBDA/2];
    
    if (`NUM_PARALLEL_ENC==4) begin
        extend_packed_res_tail[ (`LAMBDA*1)-(`LAMBDA) +: `LAMBDA] = packed_res[0*`LAMBDA +: `LAMBDA];
            
        extend_packed_res_tail[ (`LAMBDA*2)-(`LAMBDA) +: `LAMBDA] = packed_res[1*`LAMBDA +: `LAMBDA];
        
        extend_packed_res_tail[ (`LAMBDA*3)-(`LAMBDA) +: `LAMBDA] = packed_res[1*`LAMBDA +: `LAMBDA];
        
        extend_packed_res_tail[ (`LAMBDA*4)-(`LAMBDA) +: `LAMBDA] = packed_res[2*`LAMBDA +: `LAMBDA];
        
        extend_packed_res_tail[ (`LAMBDA*5)-(`LAMBDA) +: `LAMBDA] = packed_res[2*`LAMBDA +: `LAMBDA];
        
        extend_packed_res_tail[ (`LAMBDA*6)-(`LAMBDA) +: `LAMBDA] = packed_res[3*`LAMBDA +: `LAMBDA];
        
        extend_packed_res_tail[ (`LAMBDA*7)-(`LAMBDA) +: `LAMBDA] = packed_res[3*`LAMBDA +: `LAMBDA];
        
    end else if (`NUM_PARALLEL_ENC==2) begin
        extend_packed_res_tail[ (`LAMBDA*1)-(`LAMBDA) +: `LAMBDA] = packed_res[0*`LAMBDA +: `LAMBDA];
            
        extend_packed_res_tail[ (`LAMBDA*2)-(`LAMBDA) +: `LAMBDA] = packed_res[1*`LAMBDA +: `LAMBDA];
        
        extend_packed_res_tail[ (`LAMBDA*3)-(`LAMBDA) +: `LAMBDA] = packed_res[1*`LAMBDA +: `LAMBDA];
        
    end else begin   // `NUM_PARALLEL_ENC==1
        extend_packed_res_tail[ (`LAMBDA*1)-(`LAMBDA) +: `LAMBDA] = packed_res[0*`LAMBDA +: `LAMBDA];

    end
endfunction

endmodule

`default_nettype wire
