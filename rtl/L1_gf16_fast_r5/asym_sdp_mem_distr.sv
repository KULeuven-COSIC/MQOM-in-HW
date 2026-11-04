/*
 * This file implements an asymmetric simple dual-port distributed RAM with
 * configurable write and read port widths and depths.
 *
 * Derived from an AMD/Xilinx memory template and modified for this project.
 *
 */

module asym_sdp_mem_distr #(
    parameter WIDTH_0 = 8, // Should always be a power-of-two multiple of WIDTH_1
    parameter DEPTH_0 = 64,
    parameter WIDTH_1 = 8,
    parameter DEPTH_1 = 64, // Should always be a power-of-two multiple of DEPTH_0
    parameter FILE = "",
    parameter INIT = 0
)(
  input  wire                       clock,
  
  input  wire [WIDTH_0-1:0]         data_0,  
  input  wire [$clog2(DEPTH_0)-1:0] address_0,
  input  wire                       wren_0,
  
  input  wire [$clog2(DEPTH_1)-1:0] address_1,
  output reg  [WIDTH_1-1:0]         q_1
);

localparam RATIO = WIDTH_0 / WIDTH_1;
localparam log2RATIO = $clog2(RATIO);

(* ram_style = "distributed" *) 
reg [WIDTH_0-1:0] mem [0:DEPTH_0-1];

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
    if (wren_0)
        mem[address_0] <= data_0;
    
    if (RATIO == 1)
        q_1 <= mem[address_1];
    else
        q_1 <= mem[address_1[$clog2(DEPTH_1)-1 : log2RATIO]][address_1[log2RATIO-1 : 0] * WIDTH_1 +: WIDTH_1];
end

endmodule
