/*
 * keccak_wrapper.v
 * ------------
 * This file is a wrapper containing the SHA3 / Keccak engine and the
 * modules used to interface it to the rest of the system. The
 * control_to_keccak_router, k_input_fifo, and keccak_to_control_router modules
 * instantiated here simplify the connections between the SHA3 / Keccak
 * engine and the top-level controller FSM and allows input data to be
 * streamed directly independently of whether the engine is currently in
 * the IDLE, ABSORB or PROCESS state.
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */
 
`include "clog2.v"
`include "keccak_interc_defs.vh"
`default_nettype none

module keccak_wrapper #(
    parameter KECCAK_WIN = 64,
    parameter KECCAK_WIN_BYTES = (KECCAK_WIN>>3),
    parameter CLOG2_WIN = `CLOG2(KECCAK_WIN), // should be 6
    parameter CLOG2_WIN_BYTES = `CLOG2(KECCAK_WIN_BYTES), // should be 3
    parameter CAPACITY_BYTES = 13
)(
    input wire rst,
    input wire clk,
    
    input wire verify_in,
    input wire grind_in,
    input wire [`GRIND_NONCE_BITS-1:0] grind_nonce_in,
    
    input wire c2k_shift_partial,
    input wire c2k_din_valid,
    input wire [CLOG2_WIN_BYTES:0] bytelen_din,
    input wire [KECCAK_WIN-1:0] c2k_din,
    input wire [KECCAK_WIN-1:0] com_in,
    
    output wire [KECCAK_WIN-1:0] k2c_dout,
    output wire k2c_dout_valid,
//    output wire data_done,
    output wire input_done,
    output reg  reject_nonce_out,
    
    output reg [`GRIND_NONCE_BITS-1:0] grind_nonce_out_q//,
//    output wire rst_y_mul
);

wire squeeze_done, c2k_dout_valid;
wire [KECCAK_WIN-1:0] keccak_fifo_din, keccak_com_in, keccak_dout;

wire keccak_din_ready, k_dout_ready_next;
wire consume_buffer, input_round_valid;
wire [KECCAK_WIN-1:0] k_fifo_dout;

wire keccak_dout_valid;
wire [`K_FIFO_ADDR_BITS-1:0] k_din_fifo_addr_wr, k_din_fifo_addr_re;

wire verify_q;
wire grind_q;
wire reject_nonce;
wire [`GRIND_NONCE_BITS-1:0] grind_nonce_in_q;
wire [`GRIND_NONCE_BITS-1:0] grind_nonce_out;

always @ (posedge clk) begin
    reject_nonce_out <= reject_nonce;
    grind_nonce_out_q <= grind_nonce_out;
end

control_to_keccak_router c2k_router (
    .rst                    (rst),
    .clk                    (clk),
    
    .verify_in              (verify_in),
    .grind_in               (grind_in),
    .grind_nonce_in         (grind_nonce_in),
    
    .c2k_din_valid          (c2k_din_valid),
    .bytelen_din            (bytelen_din), // Can go up to 8 -> Make sure its zero when c2k_din_valid==1'b0
    .c2k_din                (c2k_din),
    .com_in                 (com_in),
    .squeeze_done           (squeeze_done),
    .consume_buffer         (consume_buffer),
    
    .c2k_dout_valid         (c2k_dout_valid),
    .dout                   (keccak_fifo_din),
    .com_out                (keccak_com_in),
    .input_done             (input_done),
    .input_round_valid      (input_round_valid),
    .k_din_fifo_addr_wr     (k_din_fifo_addr_wr),
    
    .verify_out              (verify_q),
    .grind_out               (grind_q),
    .grind_nonce_out         (grind_nonce_in_q)
);

shake_64_unified_w_grinding shake (
    .rst                    (rst),
    .clk                    (clk),

    .verify                 (verify_q),
    .grind                  (grind_q),
    .grind_nonce_in         (grind_nonce_in_q),
    
    .input_round_valid      (input_round_valid),
    .data_in                (k_fifo_dout),
    .com_in                 (keccak_com_in),
    .dout_ready_next        (k_dout_ready_next),
    
    .consume_buffer         (consume_buffer),
    .dout_valid             (keccak_dout_valid),
    .dout                   (keccak_dout),
    .squeeze_done           (squeeze_done),

    .reject_nonce           (reject_nonce),
    .grind_nonce_q          (grind_nonce_out),
    
    .k_din_fifo_addr_re     (k_din_fifo_addr_re)
);

keccak_to_control_router k2c_router (
    .rst                    (rst),
    .clk                    (clk),
    
    .din_valid              (keccak_dout_valid),
    .keccak_squeeze_done    (squeeze_done), 
    .din                    (keccak_dout),
    
    .shift_partial          (c2k_shift_partial),
    
    .din_ready_next         (k_dout_ready_next),
    
    .dout_valid             (k2c_dout_valid),
    .dout                   (k2c_dout)//,
//    .keccak_data_done       (data_done)
);

`ifdef USE_ECONOMY_SDP
simple_dual_port_mem_economy #(
`elsif FORCE_K_FIFO_DISTR_RAM
simple_dual_port_mem_distr #(
`else
simple_dual_port_mem #(
`endif
    .WIDTH  (KECCAK_WIN),
    .DEPTH  (`K_FIFO_DEPTH)
) k_input_fifo (
    .clk    (clk),
    .wea    (c2k_dout_valid),
    .addra  (k_din_fifo_addr_wr),
    .addrb  (k_din_fifo_addr_re),
    
    .dia     (keccak_fifo_din),
    .dob     (k_fifo_dout)
);

wire k_fifo_debug_wire = (k_din_fifo_addr_wr == k_din_fifo_addr_re);

endmodule
