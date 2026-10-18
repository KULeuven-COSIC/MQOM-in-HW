// Minimal streaming AES-128 key expander
// Supports NUM_PARAL_KEY_EXPAND parallel AES-128 key schedules sharing control.

`default_nettype none

module aes_on_the_fly_key_expand_parallel #(
    parameter NUM_PARAL_KEY_EXPAND = 1
)(
    input wire                                      rst,
    input wire                                      clk,

    input wire  [NUM_PARAL_KEY_EXPAND*128 - 1 : 0]  key,
    input wire                                      start,
    input wire                                      stop,

    output reg  [NUM_PARAL_KEY_EXPAND*128 - 1 : 0]  round_key
);

    wire [NUM_PARAL_KEY_EXPAND*128 - 1 : 0] round_key_next;

    reg key_update_en;
    reg [7 : 0] rcon;

    genvar lane;
    generate
        for (lane = 0; lane < NUM_PARAL_KEY_EXPAND; lane = lane + 1) begin : gen_key_expand_lane

            wire [127:0] lane_round_key;
            wire [127:0] lane_round_key_next;

            assign lane_round_key = round_key[lane*128 +: 128];

            wire [31:0] w0 = lane_round_key[127 : 096];
            wire [31:0] w1 = lane_round_key[095 : 064];
            wire [31:0] w2 = lane_round_key[063 : 032];
            wire [31:0] w3 = lane_round_key[031 : 000];

            wire [31:0] sbox_out;

            (* keep_hierarchy = "yes" *)
            aes_sbox sbox_inst (
                .sboxw      ({w3[23:0], w3[31:24]}),
                .new_sboxw  (sbox_out)
            );

            wire [31:0] g_word = sbox_out ^ {rcon, 24'b0};

            assign lane_round_key_next = {
                w0 ^ g_word,
                w1 ^ w0 ^ g_word,
                w2 ^ w1 ^ w0 ^ g_word,
                w3 ^ w2 ^ w1 ^ w0 ^ g_word
            };

            assign round_key_next[lane*128 +: 128] = lane_round_key_next;

        end
    endgenerate

    always_ff @ (posedge clk) begin
        // If start is enabled, the key expander should ignore the stop signal.
        if (rst)
            key_update_en <= 1'b0;
        else if (start)
            key_update_en <= 1'b1;
        else if (stop)
            key_update_en <= 1'b0;

        // If start, load new keys. Otherwise, if key_update_en, update all round keys.
        if (start) begin
            round_key <= key;
            rcon      <= 8'h01;
        end else if (key_update_en) begin
            round_key <= round_key_next;
            rcon      <= {rcon[6:0], 1'b0} ^ {3'b0, rcon[7], rcon[7], 1'b0, rcon[7], rcon[7]}; // {rcon << 1} mod 'h1B
        end
    end

endmodule

`default_nettype wire