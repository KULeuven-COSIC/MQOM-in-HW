/*
 * mqom2_L1_gf2_fast_r3_Enc4_ParEq4.vh
 * -----------------------------------
 * This file defines the MQOM2 Level 1 GF(2) fast 3-round parameter set,
 * with four parallel Enc engines, datapath configuration, and memory layout.
 * NUM_PARAL_EQ is fixed to 4.
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

`ifndef MQOM_PARAM_HEADER
`define MQOM_PARAM_HEADER

`define FIELD_BASE_LOG2_CARD 1
`define FIELD_EXT_LOG2_CARD 8

`define MQOM2_PARAM_MQ_N 160

`define MQOM2_PARAM_MU  8

`define MQOM2_PARAM_MQ_M `MQOM2_PARAM_MQ_N
`define MQOM2_PARAM_M_HAT (`MQOM2_PARAM_MQ_M/`MQOM2_PARAM_MU)
`define MQOM2_PARAM_ETA (`MQOM2_PARAM_MQ_M / `MQOM2_PARAM_MU)

`define W_GRIND_VEC    'd9

`define MQOM2_PARAM_NB_EVALS_LOG2   8

`define NUM_PARALLEL_ENC 4
//`define NUM_PARALLEL_ENC 2
//`define NUM_PARALLEL_ENC 1

`define PARAL_ENC_4
//`define PARAL_ENC_2
//`define PARAL_ENC_1

`define NUM_PARAL_EQ (`NUM_PARALLEL_ENC)
`define EXPAND_EQ_HW_ROUNDS `CEIL_A_DIV_B(`MQOM2_PARAM_M_HAT, `NUM_PARAL_EQ)

`define EXPAND_EQ_VALID_OUT_ROUNDS `CEIL_A_DIV_WORD_BITS(`MQOM2_PARAM_M_HAT*`FIELD_EXT_LOG2_CARD)

`define M_HAT_VECTORS_PAD_ELEMS     (`EXPAND_EQ_VALID_OUT_ROUNDS*(`WORD_BITS/`FIELD_EXT_LOG2_CARD)-`MQOM2_PARAM_M_HAT)

`define MQOM_NB_EVALS_DIV_NUM_PARALLEL_ENC (`MQOM2_PARAM_NB_EVALS/`NUM_PARALLEL_ENC)

`define TAU 'd17
`define TAU_BITS 'h5

`define LAST_MPC_ROUND  (e[4])
`define IS_LAST_MPC_ROUND(something)   (something[4])

`define LAMBDA 128 // lambda
`define LAMBDA_WORD_RATIO   (`LAMBDA/`WORD_BITS)

`define MAIN_MEM_DEPTH      2048
`define MAIN_MEM_DEPTH_ENC  (`MAIN_MEM_DEPTH/`LAMBDA_WORD_RATIO)

`define NUM_EXPAND_EQ_ELEMS      ((((`MQOM2_PARAM_MQ_N+1)*`MQOM2_PARAM_MQ_N)/2)+`MQOM2_PARAM_MQ_N)
`define NUM_EXPAND_EQ_ENC_CALLS  `CEIL_A_DIV_B(`NUM_EXPAND_EQ_ELEMS, (`LAMBDA/`FIELD_EXT_LOG2_CARD))

// Below: Chunk = 64 bits of PRG output sample
`define RAW_CHUNK_BITS  64

`define RAW_CHUNKS_L1_GF2_FAST_3R   5
`define RAW_CHUNKS_L1_GF2_FAST_5R   5

`define RAW_CHUNKS_L1_GF16_FAST_3R  7
`define RAW_CHUNKS_L1_GF16_FAST_5R  6

`define RAW_CHUNKS_L1_GF256_FAST_3R 12
`define RAW_CHUNKS_L1_GF256_FAST_5R 8

`define RAW_CHUNKS_L3_GF2_FAST_3R   8
`define RAW_CHUNKS_L3_GF2_FAST_5R   7

`define RAW_CHUNKS_L3_GF16_FAST_3R  11
`define RAW_CHUNKS_L3_GF16_FAST_5R  9

`define RAW_CHUNKS_L3_GF256_FAST_3R 18
`define RAW_CHUNKS_L3_GF256_FAST_5R 12

`define RAW_CHUNKS_L5_GF2_FAST_3R   10
`define RAW_CHUNKS_L5_GF2_FAST_5R   9

`define RAW_CHUNKS_L5_GF16_FAST_3R  15
`define RAW_CHUNKS_L5_GF16_FAST_5R  12

`define RAW_CHUNKS_L5_GF256_FAST_3R 24
`define RAW_CHUNKS_L5_GF256_FAST_5R 16

`define RAW_CHUNK_NUM  `RAW_CHUNKS_L1_GF2_FAST_3R

// ***************************************
// raw_counter -> acc_mem_addr
`define RAW_CTR_2_ACC_MEM_ADDR(raw_counter) ( \
  (raw_counter == 00) ? 2 : \
  (raw_counter == 01) ? 3 : \
  (raw_counter == 02) ? 2 : \
  (raw_counter == 03) ? 3 : \
  (raw_counter == 04) ? 2 : \
  (raw_counter == 05) ? 3 : \
  (raw_counter == 06) ? 2 : \
  (raw_counter == 07) ? 3 : \
  (raw_counter == 08) ? 4 : \
  (raw_counter == 09) ? 4 : \
  (raw_counter == 10) ? 4 : \
  (raw_counter == 11) ? 4 : \
  (raw_counter == 12) ? 2 : \
  (raw_counter == 13) ? 3 : \
  (raw_counter == 14) ? 2 : \
  (raw_counter == 15) ? 3 : \
  (raw_counter == 16) ? 2 : \
  (raw_counter == 17) ? 3 : \
  (raw_counter == 18) ? 2 : \
  (raw_counter == 19) ? 3 : 4)
  
  `define X_ELEM_PARALLEL 2
  
  
// **************************
// Main mem address defines
// ************************
// Part 0: growing up from address 0
`define SEED_KEY_ADDR       'h0
`define SECRET_X_ADDR       (`SEED_KEY_ADDR + `HASH_WORDS)
`define MSEED_EQ_ADDR       (`SECRET_X_ADDR + `X_WORDS)
`define Y_ADDR              (`MSEED_EQ_ADDR + `MSEED_EQ_WORDS)
`define COM_1_ADDR          (`Y_ADDR + `Y_WORDS)
`define COM_2_ADDR          (`COM_1_ADDR + `HASH_WORDS)
`define MSH_HASH_ADDR       (`COM_2_ADDR + `HASH_WORDS)
`define DX_TAIL_0_ADDR      (`MSH_HASH_ADDR + `HASH_WORDS)
`define A0_ADDR             (`DX_TAIL_0_ADDR + `DELTA_X_TAIL_WORDS*`TAU)
`define A1_ADDR             (`A0_ADDR + `A0_WORDS)
`define LAST_HASH_ADDR      (`A1_ADDR + `A0_WORDS)
`define GRINDING_NONCE_ADDR (`LAST_HASH_ADDR + `HASH_WORDS)
`define SIBL_PATH_ADDR      (`GRINDING_NONCE_ADDR + 1 + (((`GRINDING_NONCE_ADDR+1)%`LAMBDA_WORD_RATIO == 'h0) ? 'h0 : (`LAMBDA_WORD_RATIO-(`GRINDING_NONCE_ADDR%`LAMBDA_WORD_RATIO))))
//`define COMMITS_I_STAR_ADDR (`SIBL_PATH_ADDR + `LAMBDA_WORD_RATIO*`FIELD_EXT_LOG2_CARD*`TAU + `LAMBDA_WORD_RATIO)//`LAMBDA_WORD_RATIO safety distance
`define COMMITS_I_STAR_ADDR (`CEIL_A_DIV_B(`SIBL_PATH_ADDR + `LAMBDA_WORD_RATIO*`FIELD_EXT_LOG2_CARD*`TAU + `LAMBDA_WORD_RATIO, `HASH_WORDS)*`HASH_WORDS)//`LAMBDA_WORD_RATIO safety distance + round to `HASH_WORDS for easy addressing


// Part 1: growing down from the end of the main mem    ->  Remember to use `ENC_SIDE_ADDR(addr) for the Enc side
`define SEED_EQ_0_ADDR          (`MAIN_MEM_DEPTH    -`SEEDS_EQ_WORDS_TOTAL)
`define ON_THE_FLY_GGM_ADDR     (`SEED_EQ_0_ADDR    -`GGM_ON_THE_FLY_NODES_WORDS)
`define ROOT_SEED_PAIR_0_ADDR   (`ON_THE_FLY_GGM_ADDR-`ROOT_SEED_PAIRS_WORDS)
`define MSEED_ADDR              (`ROOT_SEED_PAIR_0_ADDR-`LAMBDA_WORD_RATIO)
`define SALT_ADDR               (`MSEED_ADDR        -`LAMBDA_WORD_RATIO)
`define COM_BUFF_ADDR           (`SALT_ADDR         -`CMT_FIFO_DEPTH)
`define MSG_ADDR                (`COM_BUFF_ADDR     -`MSG_WORDS)
`define HASH_COM_0_ADDR         (`MSG_ADDR          - `HASH_WORDS*`TAU)
  
`endif
