`ifndef MQOM_PARAM_HEADER
`define MQOM_PARAM_HEADER

`define FIELD_BASE_LOG2_CARD 4
`define FIELD_EXT_LOG2_CARD 8

`define MQOM2_PARAM_MQ_N 56

`define MQOM2_PARAM_MU  (`FIELD_EXT_LOG2_CARD/`FIELD_BASE_LOG2_CARD)

`define MQOM2_PARAM_MQ_M `MQOM2_PARAM_MQ_N
`define MQOM2_PARAM_M_HAT (`MQOM2_PARAM_MQ_M/`MQOM2_PARAM_MU)
`define MQOM2_PARAM_ETA (`MQOM2_PARAM_MQ_M / `MQOM2_PARAM_MU)

`define W_GRIND_VEC    'd9

`define MQOM2_PARAM_NB_EVALS_LOG2   8

// Lift gf16 to gf256 copy-paste:
// ({3'b0, x[0]} ^ (x[1] ? 8'he0 : 0) ^ (x[2] ? 8'h5d : 0) ^ (x[3] ? 8'hb0 : 0))

`define NUM_PARALLEL_ENC 4
//`define NUM_PARALLEL_ENC 2
//`define NUM_PARALLEL_ENC 1

`define PARAL_ENC_4
//`define PARAL_ENC_2
//`define PARAL_ENC_1

`define NUM_PARAL_EQ (1)
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

`define RAW_CHUNK_NUM  `RAW_CHUNKS_L1_GF16_FAST_3R

`define X_MUL_RAW_CHUNK_NUM(x)  ((x<<3) - (x))

`define FD_X_COMBINE_REG_BITS ((`RAW_CHUNK_BITS / `FIELD_BASE_LOG2_CARD) * `FIELD_EXT_LOG2_CARD)

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
  (raw_counter == 09) ? 5 : \
  (raw_counter == 10) ? 4 : \
  (raw_counter == 11) ? 5 : \
  (raw_counter == 12) ? 4 : \
  (raw_counter == 13) ? 5 : \
  (raw_counter == 14) ? 4 : \
  (raw_counter == 15) ? 5 : \
  (raw_counter == 16) ? 6 : \
  (raw_counter == 17) ? 6 : \
  (raw_counter == 18) ? 6 : \
  (raw_counter == 19) ? 6 : \
  (raw_counter == 20) ? 2 : \
  (raw_counter == 21) ? 3 : \
  (raw_counter == 22) ? 2 : \
  (raw_counter == 23) ? 3 : \
  (raw_counter == 24) ? 2 : \
  (raw_counter == 25) ? 3 : \
  (raw_counter == 26) ? 2 : \
  (raw_counter == 27) ? 3 : \
  (raw_counter == 28) ? 4 : \
  (raw_counter == 29) ? 5 : \
  (raw_counter == 30) ? 4 : \
  (raw_counter == 31) ? 5 : \
  (raw_counter == 32) ? 4 : \
  (raw_counter == 33) ? 5 : \
  (raw_counter == 34) ? 4 : \
  (raw_counter == 35) ? 5 : 6)

`define GGM_ON_THE_FLY_NODES        (`MQOM2_PARAM_NB_EVALS) // Store intermediate GGM tree nodes & leaves at the same place to save (MQOM2_PARAM_NB_EVALS-4) nodes' worths of storage
`define GGM_ON_THE_FLY_NODES_WORDS  (`GGM_ON_THE_FLY_NODES*`LAMBDA_WORD_RATIO) 

`define ROOT_SEED_PAIRS_WORDS   (2*`TAU*`LAMBDA_WORD_RATIO)

`define X_ELEM_PARALLEL 2
 
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
`define X_BITS  (`MQOM2_PARAM_MQ_N*`FIELD_BASE_LOG2_CARD)
`define X_WORDS `CEIL_A_DIV_WORD_BITS(`X_BITS)
`define MSEED_EQ_WORDS  `HASH_WORDS
`define Y_WORDS         `CEIL_A_DIV_WORD_BITS(`MQOM2_PARAM_M_HAT*`FIELD_EXT_LOG2_CARD)

`define Y_BITS_LAST_WORD    ((`MQOM2_PARAM_M_HAT*`FIELD_EXT_LOG2_CARD)%`WORD_BITS)

`define SEEDS_EQ_WORDS_TOTAL (`LAMBDA*`MQOM2_PARAM_M_HAT/`WORD_BITS)  

// *****************************
// Commit fifo address defines
// ***************************
`define CMT_FIFO_DEPTH  (`HASH_WORDS*`NUM_PARALLEL_ENC)
`define CMT_FIFO_ADDR_BITS $clog2(`CMT_FIFO_DEPTH)
  
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