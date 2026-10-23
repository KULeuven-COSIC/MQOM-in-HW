 /*
  * This file implements a simple dual-port distributed memory module with a
  * handy reset input to avoid inserting trash into the pipeline.
  *
  * Derived from an AMD/Xilinx memory template and modified for this project.
  *
  */

`default_nettype none

module simple_dual_port_mem_distr_wRst #(
    parameter WIDTH = 32,
    parameter DEPTH = 512,
    parameter FILE = ""
)(
    input wire                      rst, clk, wea,
    input wire [$clog2(DEPTH)-1:0]  addra, addrb,
    input wire [WIDTH-1:0]          dia,
    output reg [WIDTH-1:0]          dob
);
    (* ram_style = "distributed" *) 
    reg [WIDTH-1:0] ram [0:DEPTH-1];
    
    initial begin
      // read file contents if FILE is given
      if (FILE != "")
        $readmemb(FILE, ram);
        //$readmemh(FILE, ram);

   end
    
    always @(posedge clk) begin
        if (rst)
            dob <= 'h0;
        else
            dob <= ram[addrb];
    end
            
    always @(posedge clk) begin
        if (wea)
            ram[addra] <= dia;
    end
endmodule

`default_nettype wire