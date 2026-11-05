/*
 * gf256_lowertri_pair_streamer.sv
 * -------------------------------
 * This file implements a streaming interface that converts Enc PRG output
 * GF(256) element pairs for the lower-triangular matrix A and vector b.
 * Supports parallel AES lanes. 
 * The comments are written for the simple NUM_PARALLEL_ENC==1 case,
 * therefore some indexing comments may not be exact for NUM_PARALLEL_ENC!=1
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

`default_nettype none

`include "mqom2_main_header.vh"

module gf256_lowertri_pair_streamer #(
    parameter NUM_PARALLEL_ENC = `NUM_PARALLEL_ENC,
    parameter MQOM2_PARAM_MQ_N = `MQOM2_PARAM_MQ_N // Always a multiple of 2
)(
    input  wire                             clk,
    input  wire                             rst,

    input  wire                             input_valid,
    input  wire [128*NUM_PARALLEL_ENC-1:0]  input_elems,

    output reg  [16*NUM_PARALLEL_ENC-1:0]   sample_data,
    output reg                              sample_valid,
    output reg                              sample_is_b,
    output reg                              end_of_row,
    
    output reg [$clog2(MQOM2_PARAM_MQ_N+1)-1:0] a_row_q
);

    localparam INPUT_BYTES  = 16;                     // One input beat contains 16 GF256 bytes.
    localparam BUFFER_BYTES = INPUT_BYTES + 1;        // One leftover byte plus one fresh input beat.
    localparam COUNT_W      = $clog2(BUFFER_BYTES+1); // Counts 0 through 17 valid bytes.

    localparam N_W = $clog2(MQOM2_PARAM_MQ_N + 1);    // Row/vector counter width.
    
    localparam MAX_SHIFT_LEN = 2;                     // Max for A. Exact for b.

    reg [135:0] fifo_q [0:NUM_PARALLEL_ENC-1];          // 17-byte shift buffer; byte 0 is fifo_q[7:0].
    reg [COUNT_W-1:0] fifo_count_q;                       // Number of valid bytes currently in fifo_q.

    reg phase_b_q;                                        // 0: streaming A, 1: streaming b.

//    reg [N_W-1:0] a_row_q;                                // Current A row, 0-based.
    reg [N_W:0]   a_rem_q;                                // True A elements left in current row.
    reg [N_W-1:0] b_rem_q;                                // True b elements left.

    reg [1:0] need_bytes_c;                               // True bytes needed for next output word: 1 or 2.
    reg       can_pop_c;                                  // Enough bytes exist to produce one output word.

    reg [135:0] fifo_after_pop_c [0:NUM_PARALLEL_ENC-1];  // fifo_q after removing pop_bytes_c bytes.
//    reg [COUNT_W-1:0] fifo_count_after_pop_c;             // Occupancy after the same pop.

    always_comb begin
        if (phase_b_q) begin
            need_bytes_c = 2'd2;  // b streams two elements at any point for all parameter sets.
        end else begin
            need_bytes_c = (a_rem_q == 1) ? 2'd1 : 2'd2;  // A may need row-end zero padding.
        end

        can_pop_c   = fifo_count_q >= need_bytes_c;       // Output only when the needed true bytes exist.

//        fifo_count_after_pop_c = fifo_count_q - need_bytes_c;     // Occupancy after the output pop. Gated below.
    end
    
    genvar i;
    generate
        for (i=0; i<NUM_PARALLEL_ENC; i++) begin: gen_updated_fifo
            always_comb begin
                if (need_bytes_c[1])
                    fifo_after_pop_c[i] = {16'h0, fifo_q[i][16 +: 120]};
                else
                    fifo_after_pop_c[i] = {8'h0,  fifo_q[i][8  +: 128]};
            end
        end
    endgenerate
    


    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            fifo_count_q <= '0;                            // Buffer starts logically empty.

            phase_b_q    <= 1'b0;                          // New frame starts with A.
            a_row_q      <= '0;                            // Start at A row 0.
            a_rem_q      <= 1;                             // Row 0 has one element.
            b_rem_q      <= MQOM2_PARAM_MQ_N/MAX_SHIFT_LEN; // b has N elements. -> DIV_MAX_SHIFT_LEN version

            sample_valid <= 1'b0;                          // Output invalid during reset.
            sample_is_b  <= 1'b0;                          // Valid-qualified, so reset to 0.
            end_of_row  <= 1'b0;                           
        end else begin
            sample_valid <= can_pop_c;                     // sample_data is valid when one word was emitted.
//            sample_is_b  <= can_pop_c && phase_b_q;        // High only for valid b outputs.
            sample_is_b  <= phase_b_q;                     // High after A is done.
            end_of_row <= 1'b0;
            
            fifo_count_q <= fifo_count_q
                          - (can_pop_c ? need_bytes_c : 0)
                          + (input_valid ? INPUT_BYTES : 0); // Pop first, then append possible 16-byte input.
            
            if (phase_b_q) begin
                if (can_pop_c) begin
//                    if (b_rem_q > need_bytes_c) begin
                    if (b_rem_q > 1) begin
//                        b_rem_q <= b_rem_q - 2'd2;  // Continue b.
                        b_rem_q <= b_rem_q - 1'd1;
                    end else begin
                        phase_b_q <= 1'b0;                 // Finished b; next frame starts with A.
                        a_row_q   <= '0;                   // Reset A row index.
                        a_rem_q   <= 1;                    // First A row has one element.
                        end_of_row <= 1'b1;                // Technically end of column
                    end
                end
            end else begin  // ~phase_b_q
                b_rem_q   <= MQOM2_PARAM_MQ_N/MAX_SHIFT_LEN; // Load b count.
                end_of_row <= 1'b0;
                
                if (can_pop_c) begin
                    if (a_rem_q > need_bytes_c) begin
                        a_rem_q <= a_rem_q - need_bytes_c;  // Continue current A row.
                        end_of_row <= 1'b0;
                    end else begin
                        end_of_row <= 1'b1;
                        
                        if (a_row_q == MQOM2_PARAM_MQ_N - 1) begin
                            phase_b_q <= 1'b1;             // Last A row finished; next byte belongs to b.
                        end else begin
                            a_row_q <= a_row_q + 1'b1;     // Advance to next A row.
                            a_rem_q <= a_row_q + 2;        // Next row length is old row index + 2.
                        end
                    end
                end
            end
        end
    end
    
    generate
        for (i=0; i<NUM_PARALLEL_ENC; i++) begin: update_data
            always_ff @(posedge clk) begin
                if (~need_bytes_c[1])
                    sample_data[16*i +: 16] <= {8'b0, fifo_q[i][7:0]};    // Always update data.
                else
                    sample_data[16*i +: 16] <= {fifo_q[i][15:8], fifo_q[i][7:0]};
            
                if (input_valid) begin
                    if (fifo_count_q[0]) begin
                        fifo_q[i] <= {input_elems[128*i +: 128], fifo_q[i][7:0]};  // One leftover byte: input goes to [135:8].
                    end else begin
                        fifo_q[i] <= {8'h00, input_elems[128*i +: 128]};           // Empty buffer: input goes to fifo_q[127:0].
                    end
                end else if (can_pop_c) begin
                    fifo_q[i] <= fifo_after_pop_c[i];                    // No input: just keep the shifted buffer.
                end
            end
        end
    endgenerate

endmodule

`default_nettype wire
