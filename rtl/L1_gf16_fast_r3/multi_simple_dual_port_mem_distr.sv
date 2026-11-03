/*
 * This file implements a multiple simple dual-port (SDP) LUTRAM-based memory module.
 *
 * To simplify external memory instantiation, a single module is used for
 * multiple SDP memories sharing the same widths, depths, and addresses.
 *
 * Derived from an AMD/Xilinx memory template and modified for this project.
 *
 */

`default_nettype none

module multi_simple_dual_port_mem_distr #(
    parameter NUM_PARAL_ELEM = 17,
    parameter WIDTH_PER_ELEM = 16,
    parameter WIDTH = NUM_PARAL_ELEM*WIDTH_PER_ELEM,
    parameter DEPTH = 80,
    parameter FILE = ""
)(
    input wire                      clk,
    input wire [NUM_PARAL_ELEM-1:0]  wea,
    input wire [$clog2(DEPTH)-1:0]  addra, addrb,
    input wire [WIDTH-1:0]          dia,
    output reg [WIDTH-1:0]          dob
);
    
    (* ram_style = "distributed" *) 
    reg [WIDTH-1:0] ram [0:DEPTH-1];
    
    initial begin
      // read file contents if FILE is given
      if (FILE != "")
//        $readmemb(FILE, ram);
        $readmemh(FILE, ram);
   end
    
    always @(posedge clk) begin
            dob <= ram[addrb];
    end
    
    always @(posedge clk) begin
        for (int i=0; i<NUM_PARAL_ELEM; i++) begin // concat_mems
            if (wea[i])
                ram[addra][WIDTH_PER_ELEM*i +: WIDTH_PER_ELEM] <= dia[WIDTH_PER_ELEM*i +: WIDTH_PER_ELEM];
        end
    end
endmodule

`default_nettype wire
