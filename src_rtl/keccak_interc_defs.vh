/*
 * keccak_interc_defs.vh
 * -----------
 * This header file declares some parameters specific to the SHA3 / Keccak
 * interface modules.
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
`include "mqom2_main_header.vh"

`ifndef K_INTERC_DEFS
`define K_INTERC_DEFS

`define K_FIFO_ROUND_CTR_MAX 'h3F

`define USE_ECONOMY_SDP
//`define FORCE_K_FIFO_DISTR_RAM

`define K_FIFO_DEPTH      64
`define K_FIFO_ADDR_BITS  `CLOG2(`K_FIFO_DEPTH)

`define MAX_SINGLE_ROUND_INPUT_SHAKE        ((`LAMBDA==128) ? 'd1344 : 'd1088)

//`define SHAKE_CMD_0_ZERO_OUTLEN             ((`SHAKE_RATE == 128) ? 32'h80000000 : 32'h80000000)
`define SHAKE_CMD_0_ZERO_OUTLEN             (32'h80000000)
`define SHAKE_CMD_O_CALC(OUTLEN)            (`SHAKE_CMD_0_ZERO_OUTLEN | OUTLEN)
`define SHAKE_CMD_1_CALC(INPUT_LENGTH)      ({ ((INPUT_LENGTH <= `MAX_SINGLE_ROUND_INPUT_SHAKE) ? 1'b1 : 1'b0), {31{1'b0}} } | (INPUT_LENGTH)) 
`define SHAKE_CMD_64(INPUT_LENGTH, OUTLEN)  {`SHAKE_CMD_1_CALC(INPUT_LENGTH), `SHAKE_CMD_O_CALC(OUTLEN)}

`define KECCAK_PARTIAL_SHIFT_LEN   ((`X_BITS%'h40=='h0) ? 'h40 : \
                                    (`X_BITS%'h20=='h0) ? 'h20 : \
                                    (`X_BITS%'h10=='h0) ? 'h10 : 'h08)
                                    
`define K_PART_SH_LEN   `KECCAK_PARTIAL_SHIFT_LEN
`define K_WORD_BITS        `WORD_BITS
`define K_WORD_BYTES       (`K_WORD_BITS/8)
`define K_HALF_WORD_BITS   (`K_WORD_BITS/2)
`define K_HALF_WORD_BYTES  (`K_HALF_WORD_BITS/8)

`define RATE_SHAKE          `RATE_BITS_SHAKE
`define RATE_SHAKE_BYTES    (`RATE_SHAKE/8)
`define RATE_W_BITS         $clog2(`RATE_BITS_SHAKE)
`define RATE_W_BYTES        (`RATE_W_BITS-3)

`define KECCAK_ABS_WORDS    (`RATE_BITS_SHAKE/`K_WORD_BITS) // Note: Will have to use `CEIL with higher than 64-bit wordlengths
`define KECCAK_ABS_WORDS_m1 (`KECCAK_ABS_WORDS-1)
`define KECCAK_ROUNDS       24
`define KECCAK_ROUNDS_m1    (`KECCAK_ROUNDS-1)

`define GRIND_NONCE_START_BITS  ((8+`HASH_BITS)%`K_WORD_BITS)
`define GRIND_NONCE_START_WORD  ((8+`HASH_BITS)/`K_WORD_BITS)

`define GRIND_VEC_START_BIT (`TAU*16)
//`define GRIND_VEC_END_BIT (`GRIND_VEC_START_BIT + `W_GRIND_VEC -1)

`define RC_ROM_64(counter) ( \
  (counter == 01) ? 64'h0000000000008082 : \
  (counter == 02) ? 64'h800000000000808A : \
  (counter == 03) ? 64'h8000000080008000 : \
  (counter == 04) ? 64'h000000000000808B : \
  (counter == 05) ? 64'h0000000080000001 : \
  (counter == 06) ? 64'h8000000080008081 : \
  (counter == 07) ? 64'h8000000000008009 : \
  (counter == 08) ? 64'h000000000000008A : \
  (counter == 09) ? 64'h0000000000000088 : \
  (counter == 10) ? 64'h0000000080008009 : \
  (counter == 11) ? 64'h000000008000000A : \
  (counter == 12) ? 64'h000000008000808B : \
  (counter == 13) ? 64'h800000000000008B : \
  (counter == 14) ? 64'h8000000000008089 : \
  (counter == 15) ? 64'h8000000000008003 : \
  (counter == 16) ? 64'h8000000000008002 : \
  (counter == 17) ? 64'h8000000000000080 : \
  (counter == 18) ? 64'h000000000000800A : \
  (counter == 19) ? 64'h800000008000000A : \
  (counter == 20) ? 64'h8000000080008081 : \
  (counter == 21) ? 64'h8000000000008080 : \
  (counter == 22) ? 64'h0000000080000001 : \
  (counter == 23) ? 64'h8000000080008008 : 64'h0000000000000001)

`endif