/*
 * mqom2_main_header.vh
 * --------------------
 * This file defines generic MQOM hardware parameters and macros, including
 * field sizes, datapath widths, memory addressing, salt tweaks, and GGM tree
 * sibling-path handling.
 * The message length (MLEN_BYTES) can be adjusted as needed.
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

`ifndef MQOM_GENERIC_HEADER
`define MQOM_GENERIC_HEADER

`include "mqom2_L1_gf2_fast_r3_Enc4_ParEq4.vh"

`define BYTE_SIZE_FIELD_BASE(num) (((num) * `FIELD_BASE_LOG2_CARD) / 8)

`define FIELD_BASE (1 << `FIELD_BASE_LOG2_CARD)
`define FIELD_EXT  (1 << `FIELD_EXT_LOG2_CARD)

`define MIN64(x) (((x) < 64) ? (x) : 64)
`define CEIL_A_DIV_B(A,B)   (((A)+(B)-1)/(B))

`define WORD_BITS   64
`define WORD_BYTES  (`WORD_BITS/8)
`define WORD_BITS_LOG2   $clog2(`WORD_BITS)
`define WORD_BYTES_LOG2   $clog2(`WORD_BYTES)
`define CEIL_A_DIV_WORD_BITS(A)    `CEIL_A_DIV_B(A, `WORD_BITS)

`define GRIND_NONCE_BITS    'd32

`define MQOM2_PARAM_NB_EVALS        (1 << `MQOM2_PARAM_NB_EVALS_LOG2)
`define N                           (1 << `MQOM2_PARAM_NB_EVALS_LOG2)

`define SALT_TWEAK(sel, e, j)       {'h0, j, 6'(e) , 2'(sel)}
`define SALT_TWEAK_GGM(e, j)        `SALT_TWEAK(2'h2, e, j)
`define SALT_TWEAK_CMT(e, cmt_ctr)  (`SALT_TWEAK(2'h0, e, 8'h0) ^ {'h0, cmt_ctr})
`define SALT_TWEAK_PRG(e, i)        `SALT_TWEAK(2'h3, e, i)


// **** Important macros ahead! ****
//
// path_node = sibling node at this level
//
// current_node = where we're at
//
// In general, in many cases the state we're at can be exploited to avoid passing the full bits of both,
// hence avoiding a large comparator in the combinational path
//
`define NODE_HIDDEN(node, sibl_node)   ((node ^ 'h1) == sibl_node)
`define SIBL_HIDDEN(node, sibl_node)   (node == sibl_node)
`define PARENT_HIDDEN(node, sibl_node)   (node == (sibl_node >> 1))

`define SECURITY_BITS   `LAMBDA // lambda
`define MAIN_MEM_ENC_ADDR_BITS  $clog2(`MAIN_MEM_DEPTH_ENC)
`define ENC_SIDE_ADDR(addr) (addr/`LAMBDA_WORD_RATIO)   // Used to access asymmetric TDP main mem from the Enc PRG side

`define HASH_BITS  (2*`LAMBDA)
`define HASH_WORDS `CEIL_A_DIV_WORD_BITS(`HASH_BITS)

`define RATE_BITS_SHAKE ((`LAMBDA==128) ? (1344) : (1088))
`define RATE_WORDS_SHAKE (`RATE_BITS_SHAKE/`WORD_BITS)

`define GGM_ON_THE_FLY_NODES        (`MQOM2_PARAM_NB_EVALS) // Store intermediate GGM tree nodes & leaves at the same place to save (MQOM2_PARAM_NB_EVALS-4) nodes' worths of storage
`define GGM_ON_THE_FLY_NODES_WORDS  (`GGM_ON_THE_FLY_NODES*`LAMBDA_WORD_RATIO) 

`define ROOT_SEED_PAIRS_WORDS   (2*`TAU*`LAMBDA_WORD_RATIO)

`define NUM_LEAF_EXPAND_BITS   (`RAW_CHUNK_NUM*`RAW_CHUNK_BITS - `LAMBDA)
`define NUM_LEAF_EXPAND_WORDS   (`NUM_LEAF_EXPAND_BITS/`WORD_BITS)
`define NUM_LEAF_EXPANDS        (`CEIL_A_DIV_B(`NUM_LEAF_EXPAND_WORDS, `LAMBDA_WORD_RATIO))

// *********************************
// Message length defined here.
// Do not forget to adapt if needed.
// *********************************
`define MLEN_BYTES  'd33
`define MLEN_BITS   (`MLEN_BYTES*8)
`define MSG_WORDS   `CEIL_A_DIV_B(`MLEN_BITS, `WORD_BITS)

`define X_BITS (`MQOM2_PARAM_MQ_N*`FIELD_BASE_LOG2_CARD)

`define X_DELIVERY_CYCLES (`MQOM2_PARAM_MQ_N/`X_ELEM_PARALLEL)

`define X_MEM_WIDTH (`X_ELEM_PARALLEL*`FIELD_BASE_LOG2_CARD)

`define U_1_START_CHUNK `CEIL_A_DIV_B((`MQOM2_PARAM_MQ_N+`FIELD_EXT_LOG2_CARD),`RAW_CHUNK_BITS)
//`define U_1_END_CHUNK `CEIL_A_DIV_B((`MQOM2_PARAM_MQ_N+`MQOM2_PARAM_ETA*`FIELD_EXT_LOG2_CARD),`RAW_CHUNK_BITS)

`define GF2_ELEM_PARAL_WIDTH  (`X_ELEM_PARALLEL*`FIELD_BASE_LOG2_CARD) // 2
`define GF256_ELEM_PARAL_WIDTH  (`X_ELEM_PARALLEL*8) // 16
`define GF256_ELEM_PARAL_WIDTH_SMALL_VEC  (8) // 16
`define GF256_ELEM_WORDS_PER_CHUNK   (`RAW_CHUNK_BITS/`GF256_ELEM_PARAL_WIDTH) // 4
`define GF2_ELEM_WORDS_PER_CHUNK   (`RAW_CHUNK_BITS/`X_ELEM_PARALLEL) // 32
`define GF256_ELEMS_PER_CHUNK       (`RAW_CHUNK_BITS/8) // 8

`define GF256_PARAL_ELEM_PER_CYCLE  (`WORD_BITS/`GF2_ELEM_PARAL_WIDTH)

`define PER_ROUND_T0_WIDTH  (`X_ELEM_PARALLEL*`FIELD_EXT_LOG2_CARD)
//`define T1_WIDTH            (`X_ELEM_PARALLEL)
//`define TOTAL_T0_T1_WIDTH   (`T1_WIDTH + `TAU*`PER_ROUND_T0_WIDTH)
`define PER_ROUND_X0_WIDTH  (`X_ELEM_PARALLEL*`FIELD_EXT_LOG2_CARD)
`define TOTAL_X0_WIDTH      (`TAU*`PER_ROUND_X0_WIDTH)
`define TOTAL_A_MEM_WIDTH   (`TAU*`GF256_ELEM_PARAL_WIDTH_SMALL_VEC)

`define A0_BITS_PER_ROUND   (`FIELD_EXT_LOG2_CARD*`MQOM2_PARAM_M_HAT)
`define A0_WORDS_PER_ROUND  (`CEIL_A_DIV_WORD_BITS(`A0_BITS_PER_ROUND))
`define A0_BITS_LAST_WORD   (`A0_BITS_PER_ROUND%`WORD_BITS)

`define A0_BITS_TOTAL       (`TAU*`FIELD_EXT_LOG2_CARD*`MQOM2_PARAM_M_HAT)
//`define A0_BITS_LAST_WORD   (`A0_BITS_TOTAL%`WORD_BITS)
//`define A0_WORDS            (`CEIL_A_DIV_WORD_BITS(`A0_BITS_TOTAL))
`define A0_WORDS            (`A0_WORDS_PER_ROUND*`TAU)

// ************************************************************************************************
// Compute Delta_x tail (= non-zero) bits 
`define DELTA_X_TAIL_BITS   (((`MQOM2_PARAM_MQ_N) * (`FIELD_BASE_LOG2_CARD)) - (`LAMBDA))
`define DELTA_X_TAIL_WORDS  `CEIL_A_DIV_WORD_BITS(`DELTA_X_TAIL_BITS)

// If more than 64, we still work with 64-bit words
`define DELTA_X_WORD_REG_W `MIN64(`DELTA_X_TAIL_BITS)

// ***************************************
// Common vector sizes in (64-bit) words
// *************************************
`define SEED_KEY_WORDS  `HASH_WORDS
`define X_WORDS         `CEIL_A_DIV_WORD_BITS(`FIELD_BASE_LOG2_CARD*`MQOM2_PARAM_MQ_N)
`define MSEED_EQ_WORDS  `HASH_WORDS
`define Y_WORDS         `CEIL_A_DIV_WORD_BITS(`MQOM2_PARAM_M_HAT*`FIELD_EXT_LOG2_CARD)

`define Y_BITS_LAST_WORD    ((`MQOM2_PARAM_M_HAT*`FIELD_EXT_LOG2_CARD)%`WORD_BITS)

`define SEEDS_EQ_WORDS_TOTAL (`LAMBDA*`MQOM2_PARAM_M_HAT/`WORD_BITS)  

// *****************************
// Commit fifo address defines
// ***************************
`define CMT_FIFO_DEPTH  (`HASH_WORDS*`NUM_PARALLEL_ENC)
`define CMT_FIFO_ADDR_BITS $clog2(`CMT_FIFO_DEPTH)

// ***********************
// Start commands
`define START_KEYGEN    'h1
`define START_SIGN      'h2
`define START_VERIFY    'h3

`endif
