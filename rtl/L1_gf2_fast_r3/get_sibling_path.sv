/*
 * get_sibling_path.sv
 * -------------------
 * This file implements the GGM sibling-path generation for MQOM.
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

`include "keccak_interc_defs.vh" // Also calls mqom header(s)

`default_nettype none

module get_sibling_path (
    input wire                  rst,
    input wire                  clk,
    
    input wire                  keccak_grind,
    input wire                  keccak_dout_valid,
    input wire [`WORD_BITS-1:0] keccak_dout,
    
    input wire [$clog2(`TAU)-1:0] e,
    input wire [$clog2(`FIELD_EXT_LOG2_CARD)-1:0] tree_lvl_ctr_j_enc,
    
    output reg sibl_path_valid,
    
    output reg [$clog2(`N)-1:0] eval_point_r,
    output wire [`FIELD_EXT_LOG2_CARD:0] sibl_node,
    output wire [`FIELD_EXT_LOG2_CARD-1:0] i_star_e
);

reg [$clog2(`TAU)-1:0] e_pip;
reg e_transition_detected;
always_ff @ (posedge clk) begin
    e_pip <= e;
    e_transition_detected <= e_pip != e;
end

typedef enum logic [1:0] {
    S_IDLE,
    S_LOAD_I_STAR,
    S_GET_SIBL_PATH
} state_get_sibl_path_t;

state_get_sibl_path_t state_get_sibl_path, state_get_sibl_path_next;

reg go, stop;
reg [`FIELD_EXT_LOG2_CARD : 0] node_idx;

localparam NUM_I_STARS_IN_A_WORD = ((`K_PART_SH_LEN/2)/`FIELD_EXT_LOG2_CARD);
localparam VALID_I_STAR_WORDS    = `CEIL_A_DIV_B(`TAU, NUM_I_STARS_IN_A_WORD);

reg [$clog2(VALID_I_STAR_WORDS)-1:0] write_addr_i_star_mem;

reg [$clog2(`FIELD_EXT_LOG2_CARD)-1:0] tree_lvl_j;

// ***********************
// FSM state update
always_ff @ (posedge clk) state_get_sibl_path <= rst ? S_IDLE : state_get_sibl_path_next;

always_comb begin
    state_get_sibl_path_next = state_get_sibl_path;
    
    if (state_get_sibl_path == S_IDLE && keccak_grind)
        state_get_sibl_path_next = S_LOAD_I_STAR;
    
    if (write_addr_i_star_mem == (VALID_I_STAR_WORDS-1))
        state_get_sibl_path_next = S_GET_SIBL_PATH;
end


// ****************************
// Update start & stop signals
always_ff @ (posedge clk) begin
    if (state_get_sibl_path == S_IDLE)
        eval_point_r <= 'h0;
    else begin
        eval_point_r <= i_star_e ^ (i_star_e >> 1);
    end

    if (rst) begin
        go <= 1'b0;
        stop <= 1'b0;
    end else begin
        if (stop)
            go <= 1'b0;  
        else if (write_addr_i_star_mem == (VALID_I_STAR_WORDS-1) || e_transition_detected)
            go <= 1'b1;
        
        stop <= (tree_lvl_j == 'h1);
    end
    
    sibl_path_valid <= stop && (state_get_sibl_path == S_GET_SIBL_PATH);
    
    if (write_addr_i_star_mem == (VALID_I_STAR_WORDS-1) || e_transition_detected) begin
        tree_lvl_j <= `FIELD_EXT_LOG2_CARD-1;
        node_idx <= `FIELD_EXT + i_star_e;
    end else if (go) begin
        tree_lvl_j <= tree_lvl_j - 1'b1;
        node_idx <= (node_idx >> 1);
    end
    
end

// ******************************
// Update write_mem
always_ff @ (posedge clk) begin
    if (rst)
        write_addr_i_star_mem <= 'h0;
    else if (keccak_dout_valid && state_get_sibl_path == S_LOAD_I_STAR)
        write_addr_i_star_mem <= write_addr_i_star_mem + 1'b1;
end

// ***********************************************
// Parse keccak_dout bus to individual sub_words
wire [`FIELD_EXT_LOG2_CARD*NUM_I_STARS_IN_A_WORD-1 : 0] i_star_mem_data_in;
genvar i;
generate
    for (i=0; i<NUM_I_STARS_IN_A_WORD; i++)
        assign i_star_mem_data_in[`FIELD_EXT_LOG2_CARD*i +: `FIELD_EXT_LOG2_CARD] = keccak_dout[16*i +: `FIELD_EXT_LOG2_CARD];
endgenerate

// *****************************************************
// Asymmetric LUTRAM-based TDP mem instance i_star_mem
asym_sdp_mem_distr #(
    .WIDTH_0    (`FIELD_EXT_LOG2_CARD*NUM_I_STARS_IN_A_WORD),
    .DEPTH_0    (VALID_I_STAR_WORDS),
    .WIDTH_1    (`FIELD_EXT_LOG2_CARD),
    .DEPTH_1    (VALID_I_STAR_WORDS * NUM_I_STARS_IN_A_WORD)
) i_star_mem (
    .clock      (clk),
    .data_0     (i_star_mem_data_in),
    .address_0  (write_addr_i_star_mem),
    .wren_0     (keccak_dout_valid && state_get_sibl_path == S_LOAD_I_STAR),
    .address_1  (e),
    .q_1        (i_star_e)
);

// ************************************
// LUTRAM-based SDP mem with rst input
simple_dual_port_mem_distr_wRst #(
    .WIDTH(`FIELD_EXT_LOG2_CARD+1),
    .DEPTH(`FIELD_EXT_LOG2_CARD),
    .FILE("")
) sibl_path_mem (
    .rst   (state_get_sibl_path == S_IDLE),
    .clk   (clk),
    .wea   (go),
    .addra (tree_lvl_j),
    .addrb (tree_lvl_ctr_j_enc),
    .dia   (node_idx ^ 'h1),
    .dob   (sibl_node)
);

endmodule

`default_nettype wire
