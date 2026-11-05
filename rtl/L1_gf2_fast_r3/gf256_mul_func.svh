/*
 * gf256_mul_func.svh
 * ------------------
 * This file implements gate-level GF(256) multiplication and squaring
 * modulo 0x11B, along with GF(16)-to-GF(256) lifting, fused multiplication,
 * and multiplication by selected GF(256) basis elements.
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
 

`ifndef GF256_MUL_FUNC
`define GF256_MUL_FUNC

function [7:0] gf256_mul ( input [7:0] a, input [7:0] b);
    
    logic [7:0] pp [7:0];
    logic [14:0] prod;
    logic r0, r1, r2, r3, r4, r5, r6, r7;
    
    for (int i = 0; i < 8; i = i + 1) begin
        pp[i][0] = a[i] & b[0];
        pp[i][1] = a[i] & b[1];
        pp[i][2] = a[i] & b[2];
        pp[i][3] = a[i] & b[3];
        pp[i][4] = a[i] & b[4];
        pp[i][5] = a[i] & b[5];
        pp[i][6] = a[i] & b[6];
        pp[i][7] = a[i] & b[7];
    end
        
    prod[0]  = pp[0][0];

    prod[1]  = pp[0][1] ^ pp[1][0];

    prod[2]  = pp[0][2] ^ pp[1][1] ^ pp[2][0];

    prod[3]  = pp[0][3] ^ pp[1][2] ^ pp[2][1] ^ pp[3][0];

    prod[4]  = pp[0][4] ^ pp[1][3] ^ pp[2][2] ^ pp[3][1] ^ pp[4][0];

    prod[5]  = pp[0][5] ^ pp[1][4] ^ pp[2][3] ^ pp[3][2] ^ pp[4][1] ^ pp[5][0];

    prod[6]  = pp[0][6] ^ pp[1][5] ^ pp[2][4] ^ pp[3][3] ^ pp[4][2] ^ pp[5][1] ^ pp[6][0];

    prod[7]  = pp[0][7] ^ pp[1][6] ^ pp[2][5] ^ pp[3][4] ^ pp[4][3] ^ pp[5][2] ^ pp[6][1] ^ pp[7][0];

    prod[8]  = pp[1][7] ^ pp[2][6] ^ pp[3][5] ^ pp[4][4] ^ pp[5][3] ^ pp[6][2] ^ pp[7][1];

    prod[9]  = pp[2][7] ^ pp[3][6] ^ pp[4][5] ^ pp[5][4] ^ pp[6][3] ^ pp[7][2];

    prod[10] = pp[3][7] ^ pp[4][6] ^ pp[5][5] ^ pp[6][4] ^ pp[7][3];

    prod[11] = pp[4][7] ^ pp[5][6] ^ pp[6][5] ^ pp[7][4];

    prod[12] = pp[5][7] ^ pp[6][6] ^ pp[7][5];

    prod[13] = pp[6][7] ^ pp[7][6];

    prod[14] = pp[7][7];
    
    r0 = prod[0]  ^ prod[8]  ^ prod[12] ^ prod[13];
    r1 = prod[1]  ^ prod[8]  ^ prod[9]  ^ prod[12] ^ prod[14];
    r2 = prod[2]  ^ prod[9]  ^ prod[10] ^ prod[13];
    r3 = prod[3]  ^ prod[8]  ^ prod[10] ^ prod[11] ^ prod[12] ^ prod[13] ^ prod[14];
    r4 = prod[4]  ^ prod[8]  ^ prod[9]  ^ prod[11] ^ prod[14];
    r5 = prod[5]  ^ prod[9]  ^ prod[10] ^ prod[12];
    r6 = prod[6]  ^ prod[10] ^ prod[11] ^ prod[13];
    r7 = prod[7]  ^ prod[11] ^ prod[12] ^ prod[14];
    
    gf256_mul = {r7, r6, r5, r4, r3, r2, r1, r0};
endfunction


function [7:0] gf256_square ( input [7:0] a);
    
    logic r0, r1, r2, r3, r4, r5, r6, r7;
    
    r0 = a[0] ^ a[4] ^ a[6];
    r1 = a[4] ^ a[6] ^ a[7];
    r2 = a[1] ^ a[5];
    r3 = a[4] ^ a[5] ^ a[6] ^ a[7];
    r4 = a[2] ^ a[4] ^ a[7];
    r5 = a[5] ^ a[6];
    r6 = a[3] ^ a[5];
    r7 = a[6] ^ a[7];
    
    gf256_square = {r7, r6, r5, r4, r3, r2, r1, r0};
endfunction

`endif
