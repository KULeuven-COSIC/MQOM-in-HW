/*
 * asym_sdp_mem_distr_small_inp_big_out.sv
 * ---------------------------------------
 * This file implements an asymmetric simple dual-port distributed RAM with
 * a narrow write port and a wider read port, supporting configurable widths
 * and depths, memory initialization, and synchronous read reset.
 *
 * Derived from an AMD/Xilinx memory template and modified for this project.
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

module asym_sdp_mem_distr_small_inp_big_out #(
    parameter WIDTH_0 = 8,
    parameter DEPTH_0 = 64, // Should always be a power-of-two multiple of DEPTH_1
    parameter WIDTH_1 = 8, // Should always be a power-of-two multiple of WIDTH_0
    parameter DEPTH_1 = 64,
    parameter FILE = "",
    parameter INIT = 0
)(
  input  wire                       rst,
  input  wire                       clock,
  
  input  wire [WIDTH_0-1:0]         data_0,  
  input  wire [$clog2(DEPTH_0)-1:0] address_0,
  input  wire                       wren_0,
  
  input  wire [$clog2(DEPTH_1)-1:0] address_1,
  output reg  [WIDTH_1-1:0]         q_1
);

localparam RATIO = WIDTH_1 / WIDTH_0;
localparam log2RATIO = $clog2(RATIO);

(* ram_style = "distributed" *) 
reg [WIDTH_1-1:0] mem [0:DEPTH_1-1];

initial begin
  // set all data to 0 if INIT is true
  if (INIT)
    for (int i = 0; i < DEPTH_0; i = i + 1)
      mem[i] = {WIDTH_0{1'b0}};

  // read file contents if FILE is given
  if (FILE != "")
    //$readmemb(FILE, mem);
    $readmemh(FILE, mem);
end
   
always_ff @ (posedge clock) begin
    if (wren_0) begin
        if (RATIO == 1)
            mem[address_0] <= data_0;
        else
            mem[address_0[$clog2(DEPTH_0)-1 : log2RATIO]][address_0[log2RATIO-1 : 0] * WIDTH_0 +: WIDTH_0] <= data_0;
    end
    
    q_1 <= rst ? 1'b0 : mem[address_1];
end

endmodule
