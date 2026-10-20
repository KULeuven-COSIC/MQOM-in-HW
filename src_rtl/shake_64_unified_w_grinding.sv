`include "keccak_interc_defs.vh"

`default_nettype none

module shake_64_unified_w_grinding(
    input  wire                     rst,
    input  wire                     clk,
    
    input  wire                     input_round_valid,
    input  wire [`K_WORD_BITS-1:0]  data_in,
    input  wire [`K_WORD_BITS-1:0]  com_in,
    input  wire                     dout_ready_next,
    
    input  wire                     verify,
    input  wire                     grind,
    input  wire [`GRIND_NONCE_BITS-1:0] grind_nonce_in,
    
    output reg                      consume_buffer,
    output reg                      dout_valid,
    output wire [`K_WORD_BITS-1:0]  dout,
    output reg                      squeeze_done,
    
    output reg                      reject_nonce,
//    output reg                      accept_nonce,
    output reg [`GRIND_NONCE_BITS-1:0] grind_nonce_q,
    
    output reg [`K_FIFO_ADDR_BITS-1:0] k_din_fifo_addr_re
);

reg  [1599:0] state_regs;
assign dout = state_regs[`K_WORD_BITS-1:0];
wire [1599:0] state_regs_next;
wire [63:0] state_sliced [24:0];

typedef enum logic [3:0] {
    S_IDLE,  // IDLE: waiting for command
    S_ABSORB,
    S_ABSORB_PAD,
    S_PERMUTE,
    S_SQUEEZE,
    S_CHECK_GRIND_BITS
} state_keccak_t;

state_keccak_t state_keccak, state_keccak_next;

reg                         state_update_en, computation_en;

reg [`K_WORD_BITS-1:0]              absorb_data;
reg  [$clog2(`KECCAK_ROUNDS)-1:0]   counter = 0;

reg                                 extra_pad, extra_pad_next;
reg                                 data_done, data_done_next;
//reg                                 grind, grind_next;
//reg                                 verify, verify_next;
reg                                 last_abs_round, last_abs_round_next;
reg                                 dout_ready;

reg [`K_HALF_WORD_BITS-3-3:0]           req_bytes, req_bytes_next;
reg [`K_HALF_WORD_BITS-2-3:0]           inp_len, inp_len_next;
reg [`RATE_W_BYTES-1:0]             round_inp_len, round_inp_len_next;
//reg [`RATE_W_BYTES-1:0]             rate, rate_next; MQOM uses SHAKE only. We can hardcode :)
//reg [`RATE_W_BYTES-1:0]             reduced_rate, reduced_rate_next;
//reg [$clog2(`KECCAK_ABS_CC)-1:0]    abs_cycles_max, abs_cycles_max_next; MQOM uses SHAKE only. We can hardcode :)

reg                     verify_q;
reg                     grind_q;
reg                     reject_nonce_next;
//reg                     accept_nonce_next;
reg                     prev_state_was_check_grind_vec;

always_ff @ (posedge clk) begin // grinding functionality regs
    grind_q <= grind;
    verify_q <= verify;
    reject_nonce <= reject_nonce_next;
//    accept_nonce <= accept_nonce_next;
    
    if (rst)
        grind_nonce_q <= 'h0;
    else if (verify)
        grind_nonce_q <= grind_nonce_in;
    else if (squeeze_done && grind_q && reject_nonce)
        grind_nonce_q <= grind_nonce_q + 1'b1;
        
    if (rst)
        prev_state_was_check_grind_vec <= 1'b0;
    else
        prev_state_was_check_grind_vec <= (state_keccak == S_CHECK_GRIND_BITS);
end

always_ff @ (posedge clk) begin // update Keccak-1600 state
    state_update_en <= 1'b0;
    
    case (state_keccak_next)
        S_ABSORB:
            state_update_en <= 1'b1; // Once we get into absorb, we process a full buffer sequentially
        S_PERMUTE:
            state_update_en <= (counter!=`KECCAK_ROUNDS_m1 || data_done || input_round_valid);
        S_ABSORB_PAD:
            state_update_en <= 1'b1;
        S_SQUEEZE:
            state_update_en <= dout_ready_next;
    endcase       

    computation_en <= (state_keccak_next == S_PERMUTE);
end

always_ff @ (posedge clk) consume_buffer <= rst ? 1'b0 : (input_round_valid && ((state_keccak==S_IDLE) || (state_keccak==S_PERMUTE && counter==`KECCAK_ROUNDS_m1)));
always_ff @ (posedge clk) dout_ready <= dout_ready_next;

always_ff @ (posedge clk) dout_valid <= (state_keccak_next == S_SQUEEZE);

always_ff @ (posedge clk) squeeze_done <= (rst || (state_keccak != S_IDLE && state_keccak_next == S_IDLE));


// *********************************
// FSM decode logic
always_comb begin
    extra_pad_next       = extra_pad;
    data_done_next       = data_done;
    last_abs_round_next  = last_abs_round;
    req_bytes_next       = req_bytes;
    inp_len_next         = inp_len;
    round_inp_len_next   = round_inp_len;
    reject_nonce_next    = 1'b0;
//    accept_nonce_next    = 1'b0;
    
    absorb_data   = 'h0;
    
    case (state_keccak)
        S_IDLE: begin
            extra_pad_next      = com_in[`K_WORD_BITS-1] && (com_in[`RATE_W_BITS+`K_HALF_WORD_BITS-1:`K_HALF_WORD_BITS+3] == `RATE_SHAKE_BYTES);
            last_abs_round_next = com_in[`K_WORD_BITS-1];
            inp_len_next   = com_in[`K_WORD_BITS-2:`K_HALF_WORD_BITS+3];
            
            req_bytes_next  = com_in[`K_HALF_WORD_BITS-3:3];
            data_done_next  = 1'b0;
            
            if (com_in[`K_WORD_BITS-1])
                round_inp_len_next = com_in[`RATE_W_BITS+`K_HALF_WORD_BITS-1:`K_HALF_WORD_BITS+3];
            else
                round_inp_len_next = `RATE_SHAKE_BYTES;
        end
        
        S_ABSORB: begin
            absorb_data = data_in;
        
            if (inp_len <= `K_WORD_BYTES) begin
                data_done_next    = 1'b1;
                inp_len_next      = 'h0;
            end else begin
                inp_len_next = inp_len - `K_WORD_BYTES;
            end
            
            if (data_done) begin
                if (counter == `KECCAK_ABS_WORDS_m1)
                    round_inp_len_next <= round_inp_len - `RATE_SHAKE_BYTES; // Appending trick    
            end
            
            if (inp_len == 1) absorb_data[1*8+:8] = 0;
                
            if (inp_len < 2) absorb_data[2*8+:8] = 0;
                
            if (inp_len < 3) absorb_data[3*8+:8] = 0;
                
            if (inp_len < 4) absorb_data[4*8+:8] = 0;
                
            if (inp_len < 5) absorb_data[5*8+:8] = 0;
                
            if (inp_len < 6) absorb_data[6*8+:8] = 0;
                
            if (inp_len < 7) absorb_data[7*8+:8] = 0;
            
            if (data_done) absorb_data = 0;
            
            if (last_abs_round && (inp_len < `K_WORD_BYTES)) begin
                if (counter == (round_inp_len >> $clog2(`K_WORD_BYTES))) begin
                    absorb_data[{round_inp_len, 3'd0} & (`K_WORD_BITS-1)] = 1'b1; // is_mode_shake_reg;

                    absorb_data[{round_inp_len, 3'd1} & (`K_WORD_BITS-1)] = 1'b1; 

                    absorb_data[{round_inp_len, 3'd2} & (`K_WORD_BITS-1)] = 1'b1;

                    absorb_data[{round_inp_len, 3'd3} & (`K_WORD_BITS-1)] = 1'b1; // is_mode_shake_reg;                
                           
                    absorb_data[{round_inp_len, 3'd4} & (`K_WORD_BITS-1)] = 1'b1; // is_mode_shake_reg;  
                    
                    absorb_data[({round_inp_len, 3'd5} & (`K_WORD_BITS-1)) +: 3] = 1'b0;                
                end
                
                if((counter == `KECCAK_ABS_WORDS_m1) && !extra_pad)
                    absorb_data[`K_WORD_BITS-1] = 1'b1;
                    
                if (counter == `GRIND_NONCE_START_WORD && grind_q)
                    absorb_data[`GRIND_NONCE_START_BITS +: `GRIND_NONCE_BITS] = grind_nonce_q;
            end
        end
        
        S_ABSORB_PAD: begin
            last_abs_round_next = 1'b0;
            extra_pad_next = 1'b0;
            
            if (counter == 'h0) begin
                absorb_data[0] = 1'b1; // is_mode_shake_reg;
                absorb_data[1] = 1'b1;
                absorb_data[2] = 1'b1;
                absorb_data[3] = 1'b1; // is_mode_shake_reg;                
                absorb_data[4] = 1'b1; // is_mode_shake_reg;                  
            end
            
            if (counter == `KECCAK_ABS_WORDS_m1)
                absorb_data[`K_WORD_BITS-1] = 1'b1;
        end
        
        S_PERMUTE: begin
            if (counter == `KECCAK_ROUNDS_m1 && (data_done || input_round_valid)) begin
                if (inp_len < `RATE_SHAKE_BYTES) begin
                    last_abs_round_next = 1'b1;
                    round_inp_len_next = inp_len[`RATE_W_BYTES-1:0];
                end else
                    round_inp_len_next = `RATE_SHAKE_BYTES;
                
                extra_pad_next = (inp_len == `RATE_SHAKE_BYTES);
                
                if (last_abs_round && !extra_pad) begin
                    if (req_bytes > `K_WORD_BYTES)
                        req_bytes_next = req_bytes - `K_WORD_BYTES;
                    else
                        req_bytes_next = 'h0;
                end
            end
        end
        
        S_SQUEEZE: begin
            if (counter != `KECCAK_ABS_WORDS_m1) begin
                if (dout_ready_next) begin
                    if (req_bytes > `K_WORD_BYTES)
                        req_bytes_next = req_bytes - `K_WORD_BYTES;
                    else
                        req_bytes_next = 'h0;
                end
            end  
        end
        
        S_CHECK_GRIND_BITS: begin
            if (state_regs[`GRIND_VEC_START_BIT +: `W_GRIND_VEC] != 'h0)
                reject_nonce_next = 1'b1;
//            else
//                accept_nonce_next = 1'b1;
        end
    endcase
end

// ******************************
// FSM state update logic:
always_ff @ (posedge clk) state_keccak <= rst ? S_IDLE : state_keccak_next;

always_comb begin
    state_keccak_next <= state_keccak;
    
    case (state_keccak)
        S_IDLE:
            if (input_round_valid || (prev_state_was_check_grind_vec && reject_nonce && !verify_q))  
                state_keccak_next <= S_ABSORB;
            else
                state_keccak_next <= S_IDLE;
    
        S_ABSORB:
            if (counter == `KECCAK_ABS_WORDS_m1)
                state_keccak_next <= S_PERMUTE;
            else
                state_keccak_next <= S_ABSORB;
    
        S_ABSORB_PAD:
            if (counter == `KECCAK_ABS_WORDS_m1)
                state_keccak_next <= S_PERMUTE;
            else
                state_keccak_next <= S_ABSORB_PAD;
    
        S_PERMUTE:
            if (counter == `KECCAK_ROUNDS_m1)
                if (data_done && extra_pad)
                    state_keccak_next <= S_ABSORB_PAD; // Absorb a pad block       
                else if (data_done) begin
                    if (grind_q)
                        state_keccak_next <= S_CHECK_GRIND_BITS; // Check grinding vector
                    else
                        state_keccak_next <= S_SQUEEZE; // Absorb done
                end else if (input_round_valid)
                    state_keccak_next <= S_ABSORB; // Absorb not done
            else
                state_keccak_next <= S_PERMUTE;
      
        S_SQUEEZE: begin
            if ((req_bytes == 0) && dout_ready_next)
                state_keccak_next <= S_IDLE;
            else if (counter==`KECCAK_ABS_WORDS_m1 /*&& dout_ready_next*/)
                state_keccak_next <= S_PERMUTE;
        end

        S_CHECK_GRIND_BITS: begin
            if (state_regs[`GRIND_VEC_START_BIT +: `W_GRIND_VEC] != 'h0)
                state_keccak_next <= S_IDLE;
            else
                state_keccak_next <= S_SQUEEZE;
        end
    endcase
end

// ************************************************
// Main counter used for bookkeeping & addressing
always_ff @ (posedge clk) begin
    if (state_keccak==S_IDLE || (state_keccak==S_PERMUTE && counter==`KECCAK_ROUNDS_m1 && (data_done || input_round_valid))
    || (((state_keccak==S_ABSORB /*&& (data_done || input_round_valid)*/) || state_keccak==S_ABSORB_PAD) && counter == `KECCAK_ABS_WORDS_m1)
    || (state_keccak==S_SQUEEZE && counter==`KECCAK_ABS_WORDS_m1 /*&& dout_ready_next*/))
        counter <= 'h0;
    
    else if (state_keccak==S_ABSORB || state_keccak==S_ABSORB_PAD || (state_keccak==S_SQUEEZE /*&& req_bytes<=`K_WORD_BYTES*/ && dout_ready_next) || (state_keccak==S_PERMUTE && counter!=`KECCAK_ROUNDS_m1))
        counter <= counter +1'b1;  
end

// ****************************
// Update k_din_fifo_addr_re
always_ff @ (posedge clk) begin
    if (state_keccak == S_CHECK_GRIND_BITS)
        k_din_fifo_addr_re <= 'h0;
    else if (state_keccak == S_IDLE) begin
        if (input_round_valid || reject_nonce)
            k_din_fifo_addr_re <= k_din_fifo_addr_re +1'b1;
        else
            k_din_fifo_addr_re <= 'h0;
    end else if (state_keccak == S_ABSORB) begin
        if (counter != `KECCAK_ABS_WORDS_m1)
            k_din_fifo_addr_re <= k_din_fifo_addr_re +1'b1;
    end else if (state_keccak == S_PERMUTE && counter == `KECCAK_ROUNDS_m1 && input_round_valid)
        k_din_fifo_addr_re <= k_din_fifo_addr_re +1'b1;
end

// *********************************
// Update bookkeeping registers
always_ff @ (posedge clk) begin
    extra_pad       <= extra_pad_next;
    data_done       <= data_done_next;
    last_abs_round  <= last_abs_round_next;
    req_bytes       <= req_bytes_next;
    inp_len         <= inp_len_next;
    round_inp_len   <= round_inp_len_next;
end

// *********************************
// Keccak-1600 Datapath for SHAKE:
genvar j;
generate
    for(j=0; j<25; j=j+1) begin: debug_wires
        assign state_sliced[j] = state_regs[j*64+:64];
    end
endgenerate

 permute_64 permute(
    .din(state_regs), // lane-major
    .rcin(`RC_ROM_64(counter)),
    .dout(state_regs_next) //also lane-major
);
 
 always_ff @ (posedge clk) begin
    if (squeeze_done)
        state_regs <= 'h0;
            
    else if (state_update_en) begin
        if (computation_en)
            state_regs <= state_regs_next;
        else //if (absorb_en)
            state_regs[`RATE_SHAKE-1:0] <= {state_regs[`K_WORD_BITS-1:0] ^ absorb_data, state_regs[`RATE_SHAKE-1:`K_WORD_BITS]};
    end           
end

endmodule

`default_nettype wire