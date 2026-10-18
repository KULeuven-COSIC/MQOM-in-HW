module asym_ram_tdp_write_first #(
    parameter WIDTH_0 = 8,
    parameter DEPTH_0 = 64,
    parameter WIDTH_1 = 8,
    parameter DEPTH_1 = 64,
    parameter FILE = "",
    parameter INIT = 0
)(
  input  wire                       clock,
  input  wire [WIDTH_0-1:0]         data_0,
  input  wire [WIDTH_1-1:0]         data_1,
  input  wire [$clog2(DEPTH_0)-1:0] address_0,
  input  wire [$clog2(DEPTH_1)-1:0] address_1,
  input  wire                       wren_0,
  input  wire                       wren_1,
  output reg  [WIDTH_0-1:0]         q_0,
  output reg  [WIDTH_1-1:0]         q_1
);

`define max(a,b) {(a) > (b) ? (a) : (b)}
`define min(a,b) {(a) < (b) ? (a) : (b)}

localparam maxDEPTH = `max(DEPTH_0, DEPTH_1);
localparam maxWIDTH = `max(WIDTH_0, WIDTH_1);
localparam minWIDTH = `min(WIDTH_0, WIDTH_1);

localparam RATIO = maxWIDTH / minWIDTH;
localparam log2RATIO = $clog2(RATIO);

reg [minWIDTH-1:0] mem [0:maxDEPTH-1];

  initial
    begin
      // set all data to 0 if INIT is true
      if (INIT)
        for (int i = 0; i < DEPTH_0; i = i + 1)
          mem[i] = {WIDTH_0{1'b0}};
    
      // read file contents if FILE is given
      if (FILE != "")
        //$readmemb(FILE, mem);
        $readmemh(FILE, mem);
   end

always_ff @(posedge clock) begin    
    if (wren_0) begin
        mem[address_0] <= data_0;
        q_0 <= data_0;
    end else
        q_0 <= mem[address_0];

end

always_ff @(posedge clock) begin
    integer i;
    reg [log2RATIO-1:0] lsbaddr ;
    for (i=0; i< RATIO; i= i+ 1) begin
        lsbaddr = i;
        if (wren_1) begin
            mem[{address_1, lsbaddr}] <= data_1[(i+1)*minWIDTH-1 -: minWIDTH];
            q_1[(i+1)*minWIDTH -1 -: minWIDTH] <= data_1[(i+1)*minWIDTH-1 -: minWIDTH];
        end else
            q_1[(i+1)*minWIDTH -1 -: minWIDTH] <= mem[{address_1, lsbaddr}];
        
    end
end

endmodule
