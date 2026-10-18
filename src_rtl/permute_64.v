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
`include "keccak_pkg_64.v"

module permute_64 (
    input  wire [`DATAPATH_WIDTH-1:0]     din,   // lane-major
    input  wire [`PARALLEL_SLICES-1:0]    rcin,

    output wire [`DATAPATH_WIDTH-1:0]     dout   // lane-major
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
//`include "clog2.v"
//`include "keccak_pkg_64.v"

//module permute_64 (
//    input  wire [`DATAPATH_WIDTH-1:0]     din, // lane-major
//    input  wire [`PARALLEL_SLICES-1:0]    rcin,
    
//    output wire [`DATAPATH_WIDTH-1:0]     dout //also lane-major
//);

//wire [63:0] A_theta [0:24];   // state  A[x+5*y][z]
//wire [63:0] C [0:4];    // C[x][z]
//wire [63:0] D [0:4];    // D[x][z]

//wire [63:0] A_rho [0:24];   // state  A[x+5*y][z]
//wire [63:0] A_pi  [0:24];   // state  A[x+5*y][z]
//wire [63:0] A_chi [0:24];   // state  A[x+5*y][z]
////wire [63:0] A_iota [0:24];   // state  A[x+5*y][z]
//wire [63:0] A_out [0:24];   // state  A[x+5*y][z]


//genvar x,y, z;
//generate
//    //------------------------------------------------------------------
//    // 1) unpack the 1600-bit vector into 25 lanes
//    //------------------------------------------------------------------
//    for(x=0; x<25; x=x+1) begin: unpack_din// lanes
//           assign A_theta[x] = din[64*x+:64];
//    end 
    
//    //------------------------------------------------------------------
//    // 2) C[x] = ⨁y A[x,y]
//    //------------------------------------------------------------------   
//    for(x=0; x<5; x=x+1) begin: get_C_x
//        assign C[x] = A_theta[x]^A_theta[x+5]^A_theta[x+10]^A_theta[x+15]^A_theta[x+20];
//    end
    
//    //-----------------------------------------------
//    // Combine 3 & 4 for sim acceleration
//    //-----------------------------------------------
//    for(x=0; x<5; x=x+1) begin
//        assign A_rho[x   ] = A_theta[x   ]^C[`MOD5(x-1)] ^ {C[`MOD5(x+1)][62:0], C[`MOD5(x+1)][63]};
//        assign A_rho[x+5 ] = A_theta[x+5 ]^C[`MOD5(x-1)] ^ {C[`MOD5(x+1)][62:0], C[`MOD5(x+1)][63]};
//        assign A_rho[x+10] = A_theta[x+10]^C[`MOD5(x-1)] ^ {C[`MOD5(x+1)][62:0], C[`MOD5(x+1)][63]};
//        assign A_rho[x+15] = A_theta[x+15]^C[`MOD5(x-1)] ^ {C[`MOD5(x+1)][62:0], C[`MOD5(x+1)][63]};
//        assign A_rho[x+20] = A_theta[x+20]^C[`MOD5(x-1)] ^ {C[`MOD5(x+1)][62:0], C[`MOD5(x+1)][63]};
//    end
    
//    //--------------------------------------------
//    // Combine 5 and 6: Even faster sim
//    //--------------------------------------------
//    for (x = 0; x < 25; x = x + 1) begin: apply_rho_pi
//        localparam integer R = `INVERSE_RHO(x);
//        assign A_chi[`PI(x)] = (R == 0) ? A_rho[x] : {A_rho[x][R-1:0], A_rho[x][63:R]};
//    end
    
    
//    //----------------------------------------------------------------------------------------
//    // 7) A'[x+5*y] = A[x+5*y]  ⨁ (~A[`MOD5(x+1)+5*y] & A[`MOD5(x+2)+5*y]); + round constants
//    //----------------------------------------------------------------------------------------
//    // Partial unroll
//    assign A_out[0] = (A_chi[0] ^ (~A_chi[1] & A_chi[2])) ^ rcin; // add iota
//    assign A_out[1] =  A_chi[1] ^ (~A_chi[2] & A_chi[3]);
//    assign A_out[2] =  A_chi[2] ^ (~A_chi[3] & A_chi[4]);
//    assign A_out[3] =  A_chi[3] ^ (~A_chi[4] & A_chi[0]);
//    assign A_out[4] =  A_chi[4] ^ (~A_chi[0] & A_chi[1]);
    
//    // Rest of the loop
//    for (y = 1; y < 5; y = y + 1) begin: apply_chi_row // faster sim version
//        assign A_out[5*y + 0] = (A_chi[5*y + 0] ^ (~A_chi[5*y + 1] & A_chi[5*y + 2]));
//        assign A_out[5*y + 1] =  A_chi[5*y + 1] ^ (~A_chi[5*y + 2] & A_chi[5*y + 3]);
//        assign A_out[5*y + 2] =  A_chi[5*y + 2] ^ (~A_chi[5*y + 3] & A_chi[5*y + 4]);
//        assign A_out[5*y + 3] =  A_chi[5*y + 3] ^ (~A_chi[5*y + 4] & A_chi[5*y + 0]);
//        assign A_out[5*y + 4] =  A_chi[5*y + 4] ^ (~A_chi[5*y + 0] & A_chi[5*y + 1]);
//    end
    
    
//    //------------------------------------------------------------------
//    // 8) Add round constants
//    //------------------------------------------------------------------
////    assign A_out[0] = A_iota[0] ^ rcin;
////    for (x = 1; x < 25; x=x+1) begin: direct_connect
////        assign A_out[x] = A_iota[x];
////    end
    
//    //------------------------------------------------------------------
//    // 9) Pack lanes into dout
//    //------------------------------------------------------------------
//    for (x = 0; x < 25; x=x+1) begin: pack_lanes
//        assign dout[x*64 +:64] = A_out[x];
//    end
    
//endgenerate 

//endmodule


   //-------------------------------------------------
    // Combine 2 & 3 & 4 for even faster sim: Works, but the implementation result is worse
    //-------------------------------------------------
//    for(x=0; x<5; x=x+1) begin
//        assign A_rho[x   ] = A_theta[x   ]^A_theta[`MOD5(x-1)]^A_theta[`MOD5(x-1)+5]^A_theta[`MOD5(x-1)+10]^A_theta[`MOD5(x-1)+15]^A_theta[`MOD5(x-1)+20]
//                                          ^ {A_theta[`MOD5(x+1)][62:0]^A_theta[`MOD5(x+1)+5][62:0]^A_theta[`MOD5(x+1)+10][62:0]^A_theta[`MOD5(x+1)+15][62:0]^A_theta[`MOD5(x+1)+20][62:0],
//                                             A_theta[`MOD5(x+1)][63]  ^A_theta[`MOD5(x+1)+5][63]  ^A_theta[`MOD5(x+1)+10][63]  ^A_theta[`MOD5(x+1)+15][63]  ^A_theta[`MOD5(x+1)+20][63]};
        
//        assign A_rho[x+5 ] = A_theta[x+5 ]^A_theta[`MOD5(x-1)]^A_theta[`MOD5(x-1)+5]^A_theta[`MOD5(x-1)+10]^A_theta[`MOD5(x-1)+15]^A_theta[`MOD5(x-1)+20]
//                                          ^ {A_theta[`MOD5(x+1)][62:0]^A_theta[`MOD5(x+1)+5][62:0]^A_theta[`MOD5(x+1)+10][62:0]^A_theta[`MOD5(x+1)+15][62:0]^A_theta[`MOD5(x+1)+20][62:0],
//                                             A_theta[`MOD5(x+1)][63]  ^A_theta[`MOD5(x+1)+5][63]  ^A_theta[`MOD5(x+1)+10][63]  ^A_theta[`MOD5(x+1)+15][63]  ^A_theta[`MOD5(x+1)+20][63]};
        
//        assign A_rho[x+10] = A_theta[x+10]^A_theta[`MOD5(x-1)]^A_theta[`MOD5(x-1)+5]^A_theta[`MOD5(x-1)+10]^A_theta[`MOD5(x-1)+15]^A_theta[`MOD5(x-1)+20]
//                                          ^ {A_theta[`MOD5(x+1)][62:0]^A_theta[`MOD5(x+1)+5][62:0]^A_theta[`MOD5(x+1)+10][62:0]^A_theta[`MOD5(x+1)+15][62:0]^A_theta[`MOD5(x+1)+20][62:0],
//                                             A_theta[`MOD5(x+1)][63]  ^A_theta[`MOD5(x+1)+5][63]  ^A_theta[`MOD5(x+1)+10][63]  ^A_theta[`MOD5(x+1)+15][63]  ^A_theta[`MOD5(x+1)+20][63]};
        
//        assign A_rho[x+15] = A_theta[x+15]^A_theta[`MOD5(x-1)]^A_theta[`MOD5(x-1)+5]^A_theta[`MOD5(x-1)+10]^A_theta[`MOD5(x-1)+15]^A_theta[`MOD5(x-1)+20]
//                                          ^ {A_theta[`MOD5(x+1)][62:0]^A_theta[`MOD5(x+1)+5][62:0]^A_theta[`MOD5(x+1)+10][62:0]^A_theta[`MOD5(x+1)+15][62:0]^A_theta[`MOD5(x+1)+20][62:0],
//                                             A_theta[`MOD5(x+1)][63]  ^A_theta[`MOD5(x+1)+5][63]  ^A_theta[`MOD5(x+1)+10][63]  ^A_theta[`MOD5(x+1)+15][63]  ^A_theta[`MOD5(x+1)+20][63]};
        
//        assign A_rho[x+20] = A_theta[x+20]^A_theta[`MOD5(x-1)]^A_theta[`MOD5(x-1)+5]^A_theta[`MOD5(x-1)+10]^A_theta[`MOD5(x-1)+15]^A_theta[`MOD5(x-1)+20]
//                                          ^ {A_theta[`MOD5(x+1)][62:0]^A_theta[`MOD5(x+1)+5][62:0]^A_theta[`MOD5(x+1)+10][62:0]^A_theta[`MOD5(x+1)+15][62:0]^A_theta[`MOD5(x+1)+20][62:0],
//                                             A_theta[`MOD5(x+1)][63]  ^A_theta[`MOD5(x+1)+5][63]  ^A_theta[`MOD5(x+1)+10][63]  ^A_theta[`MOD5(x+1)+15][63]  ^A_theta[`MOD5(x+1)+20][63]};
//    end
