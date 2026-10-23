 /*
  * This file implements a simple dual-port memory module.
  *
  * Derived from an AMD/Xilinx memory template and modified for this project.
  *
  */

`default_nettype none

module simple_dual_port_mem_economy #(
    parameter WIDTH = 32,
    parameter DEPTH = 512
)(
    input wire                      clk, wea,
    input wire [$clog2(DEPTH)-1:0]  addra, addrb,
    input wire [WIDTH-1:0]          dia,
    output reg [WIDTH-1:0]          dob
);

    localparam WIDTH_0 = (WIDTH / 36) * 36; // round down
    localparam WIDTH_1 = WIDTH % 36; // calculate remainder

    reg [WIDTH_0-1:0] ram_0 [0:DEPTH-1];
    
    (* ram_style = "distributed" *)
    reg [WIDTH_1-1:0] ram_1 [0:DEPTH-1];
    
    always @(posedge clk) begin
            dob <= {ram_1[addrb], ram_0[addrb]};
    end
            
    always @(posedge clk) begin
            if (wea) begin
                ram_0[addra] <= dia[WIDTH_0-1:0];
                ram_1[addra] <= dia[WIDTH-1 : WIDTH_0];
            end
    end
endmodule
