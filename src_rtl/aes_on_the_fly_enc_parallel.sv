`default_nettype none

module aes_on_the_fly_enc_parallel #(
    parameter NUM_PARALLEL_ENC = 1,
    parameter NUM_PARAL_KEY_EXPAND = 1 // We reuse the same key expander for all parallel Enc
)(
    input wire                                      rst,
    input wire                                      clk,
    
    input wire                                      start,
    
    input wire  [NUM_PARAL_KEY_EXPAND*128 - 1 : 0]  key,
//    input wire  [NUM_PARAL_KEY_EXPAND*128 - 1 : 0]  key_big_end,
    input wire  [NUM_PARALLEL_ENC*128 - 1 : 0]      plaintext,
//    input wire  [NUM_PARALLEL_ENC*128 - 1 : 0]      plaintext_big_end,

    output wire [NUM_PARALLEL_ENC*128 - 1 : 0]      ciphertext,
//    output reg [NUM_PARALLEL_ENC*128 - 1 : 0]       ciphertext_big_end,
    output reg                                      ready_in_7,
    output reg                                      ready_in_6,
    output reg                                      ready_in_5,
    output reg                                      ready_in_4,
    output reg                                      ready_in_3,
    output reg                                      ready_in_2,
    output reg                                      ready_in_1,
    output reg                                      ready,
    output reg                                      idle
);

wire [NUM_PARAL_KEY_EXPAND*128 - 1 : 0] round_key;
wire [NUM_PARAL_KEY_EXPAND*128 - 1 : 0] key_big_end;
wire [NUM_PARALLEL_ENC*128 - 1 : 0]     plaintext_big_end;
reg  [NUM_PARALLEL_ENC*128 - 1 : 0]     ciphertext_big_end;

genvar i;
generate
    for (i=0; i<NUM_PARAL_KEY_EXPAND; i++) begin
        assign key_big_end[128*i +: 128] = reverse_endianness(key[128*i +: 128]);
    end
    for (i=0; i<NUM_PARALLEL_ENC; i++) begin
        assign plaintext_big_end[128*i +: 128] = reverse_endianness(plaintext[128*i +: 128]);
        assign ciphertext[128*i +: 128]        = reverse_endianness(ciphertext_big_end[128*i +: 128]);
    end
endgenerate


// Instantiate key_expander
aes_on_the_fly_key_expand_parallel #(
    .NUM_PARAL_KEY_EXPAND (NUM_PARAL_KEY_EXPAND)
) key_expander_inst (
    .rst       (rst),
    .clk       (clk),

    .key       (key_big_end),
    .start     (start),
    .stop      (ready_in_1),

    .round_key (round_key)
);

localparam [3:0] NUM_ROUNDS = 4'ha;

reg [$clog2(NUM_ROUNDS+1)-1:0] aes_counter;

reg start_pip; // Avoids extra aes_counter == 'h0 comparator
always_ff @ (posedge clk) begin // delay start signal (1 cycle) to load the key into the key expander
    if (rst)
        start_pip <= 1'b0;
    else
        start_pip <= start;
end

// Generate early ready signals to let external FSM prepare
always_ff @ (posedge clk) begin
    if (rst) begin
        ready_in_7 <= 1'b0;
        ready_in_6 <= 1'b0;
        ready_in_5 <= 1'b0;
        ready_in_4 <= 1'b0;
        ready_in_3 <= 1'b0;
        ready_in_2 <= 1'b0;
        ready_in_1 <= 1'b0;
        
    end else begin
        ready_in_7 <= (aes_counter == (NUM_ROUNDS-'h7));
        ready_in_6 <= ready_in_7;
        ready_in_5 <= ready_in_6;
        ready_in_4 <= ready_in_5;
        ready_in_3 <= ready_in_4;
        ready_in_2 <= ready_in_3;
        ready_in_1 <= ready_in_2; // Can use ready_in_1 as last_round mux select
    end
    
    ready <= ready_in_1;
    
    if (start)
        idle <= 1'b0;
    else if (ready_in_1)
        idle <= 1'b1;
end

function automatic [7:0] xtime;
    input [7:0] x;
    begin
        xtime = {x[6:0], 1'b0} ^ (8'h1b & {8{x[7]}});
    end
endfunction

function automatic [31:0] mix_column;
    input [31:0] col;

    reg [7:0] a0;
    reg [7:0] a1;
    reg [7:0] a2;
    reg [7:0] a3;

    reg [7:0] x0;
    reg [7:0] x1;
    reg [7:0] x2;
    reg [7:0] x3;

    begin
        a0 = col[31:24];
        a1 = col[23:16];
        a2 = col[15: 8];
        a3 = col[ 7: 0];

        x0 = xtime(a0);
        x1 = xtime(a1);
        x2 = xtime(a2);
        x3 = xtime(a3);

        mix_column[31:24] = x0 ^ (x1 ^ a1) ^ a2 ^ a3;
        mix_column[23:16] = a0 ^ x1 ^ (x2 ^ a2) ^ a3;
        mix_column[15: 8] = a0 ^ a1 ^ x2 ^ (x3 ^ a3);
        mix_column[ 7: 0] = (x0 ^ a0) ^ a1 ^ a2 ^ x3;
    end
endfunction

// *************
// Update state
// ************
wire [NUM_PARALLEL_ENC*128 - 1 : 0] round_out;
genvar aes_lane;
generate
    for (aes_lane = 0; aes_lane < NUM_PARALLEL_ENC; aes_lane = aes_lane + 1) begin : gen_aes_datapath

        localparam integer AES_MSB = NUM_PARALLEL_ENC*128 - 1 - aes_lane*128;
        localparam integer AES_LSB = AES_MSB - 127;

        wire [127 : 0] subbytes_out;
        wire [127 : 0] shiftrows_out;
        wire [127 : 0] mixcolumns_out;
//        wire [127 : 0] round_out;

        // 16 parallel AES S-boxes, one per state byte.
        // No nested generate block: keep each AES lane flat.
        aes_sbox sbox_00 (
            ciphertext_big_end  [AES_MSB - 0 -: 32],
            subbytes_out[127 -: 32]
        );

        aes_sbox sbox_01 (
            ciphertext_big_end  [AES_MSB -32 -: 32],
            subbytes_out[95 -: 32]
        );

        aes_sbox sbox_02 (
            ciphertext_big_end  [AES_MSB -64 -: 32],
            subbytes_out[63 -: 32]
        );

        aes_sbox sbox_03 (
            ciphertext_big_end  [AES_MSB -96 -: 32],
            subbytes_out[31 -: 32]
        );

        // AES/FIPS state byte order:
        // byte 0  = state[127:120] = s0,0
        // byte 1  = state[119:112] = s1,0
        // byte 2  = state[111:104] = s2,0
        // byte 3  = state[103: 96] = s3,0
        // byte 4  = state[ 95: 88] = s0,1
        // ...
        // byte 15 = state[  7:  0] = s3,3

        assign shiftrows_out = {
            subbytes_out[127:120], // byte 0  <- byte 0
            subbytes_out[ 87: 80], // byte 1  <- byte 5
            subbytes_out[ 47: 40], // byte 2  <- byte 10
            subbytes_out[  7:  0], // byte 3  <- byte 15

            subbytes_out[ 95: 88], // byte 4  <- byte 4
            subbytes_out[ 55: 48], // byte 5  <- byte 9
            subbytes_out[ 15:  8], // byte 6  <- byte 14
            subbytes_out[103: 96], // byte 7  <- byte 3

            subbytes_out[ 63: 56], // byte 8  <- byte 8
            subbytes_out[ 23: 16], // byte 9  <- byte 13
            subbytes_out[111:104], // byte 10 <- byte 2
            subbytes_out[ 71: 64], // byte 11 <- byte 7

            subbytes_out[ 31: 24], // byte 12 <- byte 12
            subbytes_out[119:112], // byte 13 <- byte 1
            subbytes_out[ 79: 72], // byte 14 <- byte 6
            subbytes_out[ 39: 32]  // byte 15 <- byte 11
        };

        assign mixcolumns_out = {
            mix_column(shiftrows_out[127: 96]),
            mix_column(shiftrows_out[ 95: 64]),
            mix_column(shiftrows_out[ 63: 32]),
            mix_column(shiftrows_out[ 31:  0])
        };

        // Rounds 1 through 9 use MixColumns.
        // Round 10 skips MixColumns.
        assign round_out[AES_MSB : AES_LSB] = (ready_in_1 ? shiftrows_out : mixcolumns_out) ^ round_key;
//        assign round_out[AES_MSB : AES_LSB] = (ready_in_1 ? shiftrows_out : mixcolumns_out) ^ round_key[AES_MSB : AES_LSB];

//        always_ff @ (posedge clk) begin
//            if (start_pip) // Initial AddRoundKey.
//                ciphertext_big_end[AES_MSB : AES_LSB] <= plaintext_big_end[AES_MSB : AES_LSB] ^ round_key[AES_MSB : AES_LSB];
//            else if (!idle)
//                ciphertext_big_end[AES_MSB : AES_LSB] <= round_out;
//        end
    end
endgenerate

always_ff @ (posedge clk) begin
    if (start_pip) // Initial AddRoundKey.
        ciphertext_big_end <= plaintext_big_end ^ {(NUM_PARALLEL_ENC/NUM_PARAL_KEY_EXPAND){round_key}};
    else if (!idle)
        ciphertext_big_end <= round_out;
end

always_ff @ (posedge clk) begin
    if (rst)
        aes_counter <= '0;
    else if (ready_in_1)
        aes_counter <= '0;
    else if (!idle)
        aes_counter <= aes_counter + 1'b1;
end


localparam WIDTH = 'd128;

function [WIDTH-1:0] reverse_endianness (input [WIDTH-1:0] in); // output = reverse_endianness(input);
    for (int i = 0; i < WIDTH/8; i++)
        reverse_endianness[i*8 +: 8] = in[(WIDTH/8 - 1 - i)*8 +: 8];
endfunction

endmodule

`default_nettype wire