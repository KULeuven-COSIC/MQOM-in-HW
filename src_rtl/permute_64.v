/*
 * permute_64.v
 * ----------------------
 * This file implements a combinational Keccak-f[1600] round function,
  * including theta, rho, pi, chi, and iota, on a lane-major state.
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */
`include "clog2.v"
`include "keccak_interc_defs.vh"

module permute_64 (
    input  wire [1600-1:0]     din,   // lane-major
    input  wire [64-1:0]    rcin,

    output wire [1600-1:0]     dout   // lane-major
);

    // Column parity C[x]
    wire [63:0] C [0:4];

    // B is the state after theta + rho + pi, before chi.
    wire [63:0] B [0:24];

    function [63:0] rol1_64;
        input [63:0] v;
        begin
            rol1_64 = {v[62:0], v[63]};
        end
    endfunction

    function [63:0] ror64;
        input [63:0] v;
        input integer r;
        begin
            if (r == 0)
                ror64 = v;
            else
                ror64 = (v >> r) | (v << (64 - r));
        end
    endfunction

    genvar x, y;

    generate
        //------------------------------------------------------------------
        // C[x] = A[x,0] ^ A[x,1] ^ A[x,2] ^ A[x,3] ^ A[x,4]
        //------------------------------------------------------------------
        for (x = 0; x < 5; x = x + 1) begin : gen_c
            assign C[x] =
                din[64*(x +  0) +: 64] ^
                din[64*(x +  5) +: 64] ^
                din[64*(x + 10) +: 64] ^
                din[64*(x + 15) +: 64] ^
                din[64*(x + 20) +: 64];
        end

        //------------------------------------------------------------------
        // Fold theta, rho and pi into B.
        //
        // theta:
        //   A[x,y] ^= C[x-1] ^ ROTL1(C[x+1])
        //
        // rho + pi:
        //   B[PI(src)] = ROTR(theta_lane(src), INVERSE_RHO(src))
        //------------------------------------------------------------------
        for (x = 0; x < 25; x = x + 1) begin : gen_theta_rho_pi
            localparam integer XCOL = x % 5;
            localparam integer XM1  = (XCOL == 0) ? 4 : (XCOL - 1);
            localparam integer XP1  = (XCOL == 4) ? 0 : (XCOL + 1);

            localparam integer DST  = `PI(x);
            localparam integer R    = `INVERSE_RHO(x);

            assign B[DST] = ror64(
                din[64*x +: 64] ^ C[XM1] ^ rol1_64(C[XP1]),
                R
            );
        end

        //------------------------------------------------------------------
        // Chi + iota, packed directly into dout.
        //------------------------------------------------------------------
        for (y = 0; y < 5; y = y + 1) begin : gen_chi_row
            localparam integer BASE = 5*y;

            if (y == 0) begin : gen_row0_with_iota
                assign dout[64*(BASE + 0) +: 64] =
                    (B[BASE + 0] ^ (~B[BASE + 1] & B[BASE + 2])) ^ rcin;

                assign dout[64*(BASE + 1) +: 64] =
                     B[BASE + 1] ^ (~B[BASE + 2] & B[BASE + 3]);

                assign dout[64*(BASE + 2) +: 64] =
                     B[BASE + 2] ^ (~B[BASE + 3] & B[BASE + 4]);

                assign dout[64*(BASE + 3) +: 64] =
                     B[BASE + 3] ^ (~B[BASE + 4] & B[BASE + 0]);

                assign dout[64*(BASE + 4) +: 64] =
                     B[BASE + 4] ^ (~B[BASE + 0] & B[BASE + 1]);
            end else begin : gen_rows_without_iota
                assign dout[64*(BASE + 0) +: 64] =
                     B[BASE + 0] ^ (~B[BASE + 1] & B[BASE + 2]);

                assign dout[64*(BASE + 1) +: 64] =
                     B[BASE + 1] ^ (~B[BASE + 2] & B[BASE + 3]);

                assign dout[64*(BASE + 2) +: 64] =
                     B[BASE + 2] ^ (~B[BASE + 3] & B[BASE + 4]);

                assign dout[64*(BASE + 3) +: 64] =
                     B[BASE + 3] ^ (~B[BASE + 4] & B[BASE + 0]);

                assign dout[64*(BASE + 4) +: 64] =
                     B[BASE + 4] ^ (~B[BASE + 0] & B[BASE + 1]);
            end
        end
    endgenerate

endmodule

