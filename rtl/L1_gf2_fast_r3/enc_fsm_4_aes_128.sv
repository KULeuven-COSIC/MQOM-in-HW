/*
 * enc_fsm_4_aes_128.sv
 * --------------------
 * This file implements the AES-128 control FSM for MQOM key generation,
 * signing, and verification.
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

`include "keccak_interc_defs.vh" // Also calls mqom header(s)

typedef enum logic [1:0] {
    MODE_GGM,
    MODE_CMT,
    MODE_PRG
} enc_mode_t;

module enc_fsm_4_aes_128 (
    input wire          rst,
    input wire          clk,
    
    input wire          keygen,
    input wire          sign,
    input wire          verify,
   
    input wire          enc_ready_in_7,
    input wire          enc_ready_in_6,
    input wire          enc_ready_in_5,
    input wire          enc_ready_in_4,
    input wire          enc_ready_in_3,
    input wire          enc_ready_in_2,
    input wire          enc_ready_in_1,
    input wire          enc_ready,
    
    input wire          poly_comp_ready,

    input wire                          sibl_path_valid,
    input wire [`FIELD_EXT_LOG2_CARD:0] sibl_node,
    input wire [`FIELD_EXT_LOG2_CARD-1:0] i_star_e,
    
    output reg          rst_salt,                  
    output reg          load_salt,                  
    output reg          start_enc,                  
    output reg          shift_small,                  
    output reg          shift_tail,
    output reg          add_delta,
    output reg          load_sibl_leaf,
    output reg          pre_load_sibl_leaf,
    output reg          cmt_ctr,
    
    output reg [`NUM_PARALLEL_ENC-1:0] seed_regs_load_en,
    
    output reg [$clog2(`TAU)-1:0] e_out,
    
    output reg          commit_filled, // Signal to main FSM that a commit batch can be fed to the SHAKE fifo
    output reg          expand_eq_valid,
    output reg          share_valid,
    output reg          rst_raw_regs,
    output reg          enc_fsm_done,
    output reg          main_mem_wren_1_out,
    output reg          mem_input_is_enc_out,
    output reg          rst_mem_input_regs,
    
    output enc_mode_t   enc_mode,
    
    output reg [$clog2($clog2(`N))-1:0] tree_lvl_ctr_j,
    
    output reg [$clog2($clog2(`N))-1:0] sibl_path_lvl_ctr,
    
    output reg [$clog2($clog2(`N-1))-1:0] p_i,
    output reg [$clog2(`N)-1:0] omega_out,
//    output reg [$clog2(`N)-1:0] eval_point_r,
    
    output reg [$clog2(`NUM_EXPAND_EQ_ENC_CALLS+1)-1:0] prg_counter,
    
    output reg [`MAIN_MEM_ENC_ADDR_BITS-1:0] main_mem_addr_1
);

localparam SEED_EQ_0_ADDR = `SEED_EQ_0_ADDR;
localparam ON_THE_FLY_GGM_ADDR = `ON_THE_FLY_GGM_ADDR;
localparam SALT_ADDR = `SALT_ADDR;
reg [`NUM_PARALLEL_ENC-1:0] seed_regs_load_en_next;
reg [$clog2(`TAU)-1:0] e;
reg incr_e, incr_e_next;
reg start_enc_next, shift_small_next, shift_tail_next, mem_wren_1, mem_wren_1_next, mem_input_is_enc_out_next, flip_cmt_ctr;
reg update_enc_state_next, expand_eq_valid_next, share_valid_next, add_delta_next, load_sibl_leaf_next, last_m_hat, last_m_hat_4x, enc_fsm_done_next;
reg load_salt_next, cmt_ctr_prev, cmt_ctr_prev_2, commit_filled_next; //, incr_tree_lvl_ctr, incr_tree_lvl_ctr_next;

//localparam N_SUB_CTR_VALUES = 2*`NUM_PARALLEL_ENC;
reg [$clog2(`N)-1:0] eval_counter;
typedef enum logic [1:0] {
    FREEZE_EVAL_CTR,
    INCR_EVAL_CTR,
    DECR_EVAL_CTR_x3
} eval_counter_opc_t;

eval_counter_opc_t eval_counter_opc, eval_counter_opc_next;

localparam NEW_ENC_STATE_MSB = 'd14;
reg [NEW_ENC_STATE_MSB:0] new_enc_state_train;
reg [13:0] enc_ready_train;

reg [`MAIN_MEM_ENC_ADDR_BITS-1:0] main_mem_addr_1_read, main_mem_addr_1_write, main_mem_addr_1_read_alt;

//reg [$clog2(`CEIL_A_DIV_B(`MQOM2_PARAM_M_HAT,`NUM_PARALLEL_ENC))-1:0] m_hat_counter;
reg [$clog2(`MQOM2_PARAM_M_HAT)-1:0] m_hat_counter;
reg [$clog2(`N/`NUM_PARALLEL_ENC)-1:0] N_div_par_enc_counter;
reg incr_N_div_par_enc_counter, incr_N_div_par_enc_counter_next, N_div_par_enc_counter_zero, prg_counter_last_leaf_exp;

reg toggling_counter, toggle_on;
reg goto_wait_sibl_path, goto_wait_sibl_path_next;
reg incr_tree_lvl_ctr_j, incr_tree_lvl_ctr_j_next;
reg last_mpc_round_pip;
reg rst_mem_input_regs_next;

reg use_alt_read_addr, use_alt_read_addr_next;

//reg [`FIELD_EXT_LOG2_CARD:0] sibl_node_gated;
reg [`FIELD_EXT_LOG2_CARD:0] sibl_node_pip;

reg [$clog2(`N):0] loading_node_idx;
reg incr_loading_node_idx, incr_loading_node_idx_next, loading_node_idx_log2_N_trail_zeros;
reg loading_sibl_node;
wire loading_sibl_node_next = `SIBL_HIDDEN(loading_node_idx, sibl_node_pip) || `SIBL_HIDDEN(loading_node_idx, sibl_node);

enc_mode_t enc_mode_next;

typedef enum logic [1:0] {
    ALT_ADDR_FREEZE,
    ALT_ADDR_GOTO_SIBL_PATH_START,
    ALT_ADDR_GOTO_SIBL_PATH_END,
    ALT_ADDR_INCR
} alt_read_addr_opc_t;

alt_read_addr_opc_t alt_read_addr_opc, alt_read_addr_opc_next;


typedef enum logic [3:0] {
    FREEZE_ADDR_R,
    INCR_ADDR_R,
    GOTO_SEED_EQ_0_ADDR,
    GOTO_SECRET_X_ADDR,
    GOTO_SALT_ADDR,
    GOTO_ROOT_SEED_PAIR_ADDR,
    GOTO_ON_THE_FLY_GGM_STORAGE
} main_addr_read_opc_t;

main_addr_read_opc_t main_addr_read_opc, main_addr_read_opc_next;

typedef enum logic [2:0] {
    FREEZE_ADDR_WR,
    INCR_ADDR_WR,
    GOTO_ON_THE_FLY_GGM_ADDR,
    GOTO_COM_BUFF_ADDR,
    GOTO_SIBL_PATH_ADDR,
    GOTO_COMMIT_I_STAR_ADDR
} main_addr_write_opc_t;

main_addr_write_opc_t main_addr_write_opc, main_addr_write_opc_next;

typedef enum logic [1:0] {
    FREEZE_PRG_CTR,
    INCR_PRG_CTR//,
//    INCR_PRG_CTR_4x
} prg_counter_opc_t;

prg_counter_opc_t prg_counter_opc, prg_counter_opc_next;

typedef enum logic [1:0] {
    FREEZE_M_HAT_CTR,
    INCR_M_HAT_CTR_4x,
    INCR_M_HAT_CTR
} m_hat_counter_opc_t;

m_hat_counter_opc_t m_hat_counter_opc, m_hat_counter_opc_next;

typedef enum logic [4:0] {
    S_IDLE,                 // IDLE: waiting or done
    S_EXPAND_EQUATIONS,     // get A_hat and b_hat
    S_EXPAND_MSEED,         // Signing only: get seed_root pairs for all `TAU trees
    S_GGM_TREE_LEVEL_1,     // expand first 2 nodes of correlated GGM tree
    S_GGM_TREE_LEVEL_2,     // expand next 4 nodes of correlated GGM tree
    S_GGM_TREE_LEVEL_3_PLUS,// keep on expanding the full GGM tree until we reach the leaf level
    S_GEN_LEAVES,           // expand the last level of the GGM tree
    S_GEN_2_COMMIT,         // transition state between gen_leaves & commit
    S_COMMIT_LEAVES,        // expand the leaves to get randomness to send to the BLC Compute core
    S_EXPAND_LEAVES,        // generate commits & send them for hashing
    S_EXP_2_COMMIT,         // finish expanding & prep next commit if not in the last iteration
    S_WAIT_POLY_COMP,       // wait for comp_poly_alpha to be ready
    S_WAIT_I_STAR,          // wait for XOF-derived i* set
    S_PACK_SIBL_PATH_0,     // start placing sibl_path[e] in signature
    S_PACK_SIBL_PATH_1,     // finishing sibl_path[e] in signature
    S_PACK_COMMITS_I_STAR,  // pack cmt_i*[e] in signature
    S_GGM_TREE_LEVEL_1_VERIF// start epxanding ggm tree #e (Verifier version) 
} state_enc_fsm_t;

state_enc_fsm_t state_enc_fsm, state_enc_fsm_next;

// State decoding logic
always_comb begin
    add_delta_next = 1'b0;
    load_sibl_leaf_next = 1'b0;
    incr_e_next = 1'b0;
    load_salt_next = 1'b0;
    mem_input_is_enc_out_next = 1'b1;
    incr_N_div_par_enc_counter_next = 1'b0;
    incr_tree_lvl_ctr_j_next = 1'b0; // Only works if state_enc_fsm == S_PACK_SIBL_PATH_1
    start_enc_next = 1'b0;
    shift_tail_next = 1'b0;
    shift_small_next = 1'b0;
    flip_cmt_ctr = 1'b0;
    toggle_on = 1'b0;
    share_valid_next = 1'b0;
    mem_wren_1_next = 1'b0;
    update_enc_state_next = 1'b0;
    enc_mode_next = MODE_PRG;
    seed_regs_load_en_next = 'h0;
    enc_fsm_done_next = enc_fsm_done;
    expand_eq_valid_next = 'h0;
    commit_filled_next = 'h0;
    goto_wait_sibl_path_next = 'h0;
    use_alt_read_addr_next = 'h0;
    rst_mem_input_regs_next = 'h0;
    incr_loading_node_idx_next = 'h0;
    eval_counter_opc_next = FREEZE_EVAL_CTR;
    main_addr_write_opc_next = FREEZE_ADDR_WR;
    main_addr_read_opc_next = FREEZE_ADDR_R;
    prg_counter_opc_next = FREEZE_PRG_CTR;
    m_hat_counter_opc_next = FREEZE_M_HAT_CTR;
    alt_read_addr_opc_next = ALT_ADDR_FREEZE;
    
    case (state_enc_fsm)
        S_IDLE: begin
            if (keygen) begin
                main_addr_read_opc_next = GOTO_SEED_EQ_0_ADDR;
                update_enc_state_next = 1'b1;
            end else if (sign || sibl_path_valid) begin
//                load_salt_next = 1'b1;
                update_enc_state_next = 1'b1;
//                main_addr_read_opc_next = INCR_ADDR_R;
            end
            
            if (sign)
                seed_regs_load_en_next[0] = 1'b1; // load MSEED
            
            if (verify) begin
                main_addr_read_opc_next = GOTO_SALT_ADDR;
                load_salt_next = 1'b1;
            end
        end
        
        S_EXPAND_EQUATIONS: begin
            expand_eq_valid_next = enc_ready;
        
            if (|new_enc_state_train[3:0])
                main_addr_read_opc_next = INCR_ADDR_R;
             
             if (new_enc_state_train[2])
                seed_regs_load_en_next[0] = 1'b1;
                
             if (`NUM_PARALLEL_ENC != 'h1) begin
                 if (new_enc_state_train[3])
                    seed_regs_load_en_next[1] = 1'b1;
             end else begin
                if (new_enc_state_train[3]) begin
                    start_enc_next = 1'b1;
                    prg_counter_opc_next = INCR_PRG_CTR;
                end
             end
             
             if (`NUM_PARALLEL_ENC == 'h4) begin
                 if (new_enc_state_train[4])
                    seed_regs_load_en_next[2] = 1'b1;
                    
                 if (new_enc_state_train[5])
                    seed_regs_load_en_next[3] = 1'b1;
                 
                 if (new_enc_state_train[6]) begin
                    start_enc_next = 1'b1;
                    prg_counter_opc_next = INCR_PRG_CTR;
                 end
             end else begin
                if (new_enc_state_train[4]) begin
                    start_enc_next = 1'b1;
                    prg_counter_opc_next = INCR_PRG_CTR;
                end
             end
             
             if (enc_ready_in_2) begin// Chain expands
                if (prg_counter != `NUM_EXPAND_EQ_ENC_CALLS)
                    start_enc_next = 1'b1;
                else begin
                    m_hat_counter_opc_next = INCR_M_HAT_CTR_4x;
                    update_enc_state_next = 1'b1;
//                    if (last_m_hat) begin
//                        if (keygen)
//                            enc_fsm_done_next = 1'b1;
//                    end //else
                end
                
                prg_counter_opc_next = INCR_PRG_CTR;
             end
             
             if (last_m_hat_4x && enc_ready_in_1 && prg_counter==`NUM_EXPAND_EQ_ENC_CALLS) begin
                if (keygen || verify)
                    enc_fsm_done_next = 1'b1; // Stronger than goto_wait_sibl_path_next
                    
                goto_wait_sibl_path_next = 1'b1;
            end
        end
        
        S_EXPAND_MSEED: begin
            if (new_enc_state_train[0]) begin
                start_enc_next = 1'b1;
                main_addr_read_opc_next = GOTO_SECRET_X_ADDR;
            end
            
            if (new_enc_state_train[3])
                prg_counter_opc_next = INCR_PRG_CTR;
            
            if (enc_ready) begin
                add_delta_next = 1'b1;
            end
            
            if (enc_ready_in_2)
                main_addr_read_opc_next = GOTO_SALT_ADDR;
            
            if (enc_ready || enc_ready_train[0]) begin
                mem_wren_1_next = 1'b1;
                main_addr_write_opc_next = INCR_ADDR_WR;
            end
            
            if (enc_ready_train[0]) begin
                update_enc_state_next = 1'b1;
                
                if (prg_counter == 'h0)
                    load_salt_next = 1'b1;
            end
        end
        
        S_GGM_TREE_LEVEL_1: begin // load rseed[e] and rseed[e]^delta and start building the tree
            enc_mode_next = MODE_GGM;
            shift_tail_next = 1'b1;
            
            if (new_enc_state_train[0])
                main_addr_write_opc_next = GOTO_ON_THE_FLY_GGM_ADDR;
            
            if (new_enc_state_train[0])
                main_addr_read_opc_next = GOTO_ROOT_SEED_PAIR_ADDR;
            else if (new_enc_state_train[1])
                main_addr_read_opc_next = INCR_ADDR_R;
            
            if (new_enc_state_train[3])
                seed_regs_load_en_next[0] = 1'b1;
                
            if (new_enc_state_train[4])
                seed_regs_load_en_next[1] = 1'b1;
            
            if (new_enc_state_train[5])
                start_enc_next = 1'b1;
            
            if ((enc_ready || |enc_ready_train[2:0]) && ~|new_enc_state_train[2:0]) begin
                mem_wren_1_next = 1'b1;
                main_addr_write_opc_next = INCR_ADDR_WR;
            end
            
            if (enc_ready_train[0])
                incr_N_div_par_enc_counter_next = 1'b1;
            
            if (enc_ready_train[1]) begin
                seed_regs_load_en_next[0] = 1'b1;
            end
            
            if (enc_ready_train[2])
                seed_regs_load_en_next[1] = 1'b1;
            if (enc_ready_train[3])
                seed_regs_load_en_next[2] = 1'b1;
            if (enc_ready_train[4])
                seed_regs_load_en_next[3] = 1'b1;
            if (enc_ready_train[5] && !new_enc_state_train[4]) begin
                start_enc_next = 1'b1;
                update_enc_state_next = 1'b1;
            end

        end
        
        S_GGM_TREE_LEVEL_2: begin
            enc_mode_next = MODE_GGM;
            shift_tail_next = 1'b1;
            
//            if ((enc_ready || |enc_ready_train[6:0]) && !new_enc_state_train[0]) begin
//                mem_wren_1_next = 1'b1;
//                main_addr_write_opc_next = INCR_ADDR_WR;
//            end
            
            // Unified verify version of the above
            if (((enc_ready || enc_ready_train[0]) && !`PARENT_HIDDEN(3'h4, sibl_node[3:0]))
            || ((|enc_ready_train[2:1]) && !`PARENT_HIDDEN(3'h5, sibl_node[3:0]))
            || ((|enc_ready_train[4:3]) && !`PARENT_HIDDEN(3'h6, sibl_node[3:0]))
            || ((|enc_ready_train[6:5] && !new_enc_state_train[0]) && !`PARENT_HIDDEN(3'h7, sibl_node[3:0])))
                mem_wren_1_next = 1'b1;
                
//            if ((enc_ready || |enc_ready_train[6:0]) && !new_enc_state_train[0] && !loading_sibl_node)
//                mem_wren_1_next = 1'b1;
                
//            if ((enc_ready || enc_ready_train[0] && (verify && `NODE_HIDDEN(sibl_node_gated[1:0], 2'h4))) // If sibl_node LSBs [1:0] are 5, then 4 is a hidden or "corrupted data" node -> Load parent nodes from sibling path instead
//            || ((|enc_ready_train[2:1]) && (verify && `NODE_HIDDEN(sibl_node_gated[1:0], 2'h5))))
            if ((enc_ready || |enc_ready_train[2:0]) && !new_enc_state_train[0] && loading_sibl_node)
                use_alt_read_addr_next = 'h1;
                
            if ((enc_ready || |enc_ready_train[6:0]) && !new_enc_state_train[0]) // Always increment anyway
                main_addr_write_opc_next = INCR_ADDR_WR;
            
//            if (|new_enc_state_train[1:0])
            if (enc_ready_train[0])
                incr_N_div_par_enc_counter_next = 1'b1;
            
            if (enc_ready_train[2])
                main_addr_read_opc_next = GOTO_ON_THE_FLY_GGM_STORAGE;
                
            if (enc_ready_train[1])
                seed_regs_load_en_next[0] = 1'b1;
            if (enc_ready_train[2])
                seed_regs_load_en_next[1] = 1'b1;
            if (enc_ready_train[3])
                seed_regs_load_en_next[2] = 1'b1;
            if (enc_ready_train[4])
                seed_regs_load_en_next[3] = 1'b1;
            if (enc_ready_train[5])
                start_enc_next = 1'b1;
            if (enc_ready_train[6] && !new_enc_state_train[0])
                update_enc_state_next = 1'b1;
                
            // Verify-only stuff:
            if (enc_ready_in_2 || enc_ready_in_1 || enc_ready || enc_ready_train[0])
                incr_loading_node_idx_next = 1'b1;

            if (use_alt_read_addr)
                alt_read_addr_opc_next = ALT_ADDR_INCR;            
//            if (enc_ready_train[1])
//                alt_read_addr_opc_next = ALT_ADDR_INCR;
        end
        
        S_GGM_TREE_LEVEL_3_PLUS: begin
            enc_mode_next = MODE_GGM;
            shift_tail_next = 1'b1;
            
            if (enc_ready_in_3)
                incr_N_div_par_enc_counter_next = 1'b1;
            
            if ((enc_ready || |enc_ready_train[6:0]) && !new_enc_state_train[0] && !(|new_enc_state_train[12:11] && loading_sibl_node)) begin // For verfication: We can write to the mem anyway (for simplicity), but we should avoid actually reading the corrupt data
                mem_wren_1_next = 1'b1;                                                                                                     // We still need to be careful of the first few cycles data dependency (direct load for next enc round)
//                main_addr_write_opc_next = INCR_ADDR_WR;
            end
            
            if ((enc_ready || |enc_ready_train[6:0]) && !new_enc_state_train[0])
                main_addr_write_opc_next = INCR_ADDR_WR;
            
            if (enc_ready_in_1)
                start_enc_next = 1'b1;
                
            if (|new_enc_state_train[6:5] || enc_ready_in_1 || enc_ready_in_4 || enc_ready_in_3 || enc_ready_in_2)
                main_addr_read_opc_next = INCR_ADDR_R;
            
            // The following should line up with the (exactly 4) available cycles for reading a stored seed:
            // This is the optimal way to introduce only 1 cycle of stalling during GGM tree expansion. Subsequent routines do not have this issue.
            if (new_enc_state_train[7] || enc_ready || new_enc_state_train[13]) // new_enc_state_train[14]: 1st enc_ready_in_1 read reads trash, but data available one cycle later
                seed_regs_load_en_next[0] = 1'b1;
            if (new_enc_state_train[8] || enc_ready_train[0] || new_enc_state_train[14])
                seed_regs_load_en_next[1] = 1'b1;
            if (enc_ready_in_2)
                seed_regs_load_en_next[2] = 1'b1;
            if (enc_ready_in_1)
                seed_regs_load_en_next[3] = 1'b1;
            
            if (enc_ready_train[6] && N_div_par_enc_counter[$clog2(`N/`NUM_PARALLEL_ENC)-1]) begin
                main_addr_write_opc_next = GOTO_ON_THE_FLY_GGM_ADDR;
                update_enc_state_next = 1'b1;
            end
            
            // Verify-only stuff:
            if (|new_enc_state_train[4:3] || enc_ready_in_6 || enc_ready_in_5 || ((enc_ready_in_4 || enc_ready_in_3) && (~|new_enc_state_train[8:7])) || |new_enc_state_train[10:9])
                incr_loading_node_idx_next = 1'b1;
                
//            if (loading_sibl_node && (|new_enc_state_train[6:5] || enc_ready_in_4 || enc_ready_in_3 || ((enc_ready_in_2 || enc_ready_in_1) && (~|new_enc_state_train[6:5])) || |new_enc_state_train[8:7]))
            if (loading_sibl_node && !loading_sibl_node_next) // i.e. @ negedge loading_sibl_node
                use_alt_read_addr_next = 'h1;
            
            if (use_alt_read_addr)
                alt_read_addr_opc_next = ALT_ADDR_INCR;
//            if (enc_ready_train[1])
//                alt_read_addr_opc_next = ALT_ADDR_INCR;
        end
        
        S_GEN_LEAVES: begin
            enc_mode_next = MODE_GGM;
            toggle_on = 1'b1;
            
            if (~|new_enc_state_train[3:0])
                share_valid_next = 1'b1;
            
            if (toggling_counter)
                shift_tail_next = 1'b1;
            else
                shift_small_next = 1'b1;
            
            if (enc_ready_in_3 && ~N_div_par_enc_counter_zero)
                incr_N_div_par_enc_counter_next = 1'b1;

//            if (enc_ready || enc_ready_train[1] || enc_ready_train[3] || enc_ready_train[5] || (enc_ready_train[7] && !new_enc_state_train[0]) || (enc_ready_train[9] && !new_enc_state_train[2]) || (enc_ready_train[11] && !new_enc_state_train[4]) || (enc_ready_train[13] && !new_enc_state_train[6])) begin
            if (!toggling_counter && !new_enc_state_train[0] && !new_enc_state_train[2]) begin
                mem_wren_1_next = 1'b1;
                eval_counter_opc_next = INCR_EVAL_CTR;
                main_addr_write_opc_next = INCR_ADDR_WR;
            end
            
            if (enc_ready_train[2])
                start_enc_next = 1'b1;
            
            if (enc_ready_in_4 || enc_ready_in_2 || enc_ready_train[3] || enc_ready_train[5])
                main_addr_read_opc_next = INCR_ADDR_R;
                
            if (enc_ready_in_3 || new_enc_state_train[2])
                seed_regs_load_en_next[2] = 1'b1;
            if (enc_ready_in_1)
                seed_regs_load_en_next[3] = 1'b1;
            if (enc_ready_train[4])
                seed_regs_load_en_next[0] = 1'b1;
            if (enc_ready_train[6])
                seed_regs_load_en_next[1] = 1'b1;
                
            if (((enc_ready_in_7 || enc_ready_in_5 || enc_ready_train[0] || enc_ready_train[2]) && !loading_node_idx_log2_N_trail_zeros)
            || (N_div_par_enc_counter_zero && (enc_ready_in_1 || enc_ready_in_2)))
                incr_loading_node_idx_next = 1'b1;
            
//            if ((loading_sibl_node && (enc_ready_in_5 || enc_ready_in_3 || enc_ready_train[2] || enc_ready_train[4])) || incr_alt_read_addr_train[2])
            if (loading_sibl_node && !loading_sibl_node_next)// // i.e. @ negedge loading_sibl_node
                use_alt_read_addr_next = 'h1;
                
            if (N_div_par_enc_counter_zero && enc_ready_in_1) begin
                update_enc_state_next = 1'b1;
                main_addr_read_opc_next = GOTO_ON_THE_FLY_GGM_STORAGE;
            end
            
            if (use_alt_read_addr)
                alt_read_addr_opc_next = ALT_ADDR_INCR;
                
            if (verify && toggling_counter && ((i_star_e^1) == (eval_counter+1) || (eval_counter == 'h0 && i_star_e == 'h1)))
                load_sibl_leaf_next = 1'b1;
        end      
        
        S_GEN_2_COMMIT: begin
            enc_mode_next = MODE_CMT;
            
            if (|new_enc_state_train[1:0])
                incr_loading_node_idx_next = 1'b1;
            
            if (|new_enc_state_train[3:0])
                main_addr_read_opc_next = INCR_ADDR_R;
                
            if (new_enc_state_train[2])
                seed_regs_load_en_next[0] = 1'b1;
            if (new_enc_state_train[3])
                seed_regs_load_en_next[1] = 1'b1;
            if (new_enc_state_train[4])
                seed_regs_load_en_next[2] = 1'b1;
            if (new_enc_state_train[5]) begin
                seed_regs_load_en_next[3] = 1'b1;
                start_enc_next = 1'b1;
                update_enc_state_next = 1'b1;
            end
            
            if (loading_sibl_node && (|new_enc_state_train[3:0]))
                use_alt_read_addr_next = 'h1;
                
            if (use_alt_read_addr)
                alt_read_addr_opc_next = ALT_ADDR_INCR;
        end
        
        S_COMMIT_LEAVES: begin
            enc_mode_next = MODE_CMT;
            if (enc_ready_in_2) begin
                if (cmt_ctr) begin
                    enc_mode_next = MODE_PRG;
//                    update_enc_state_next = 1'b1;
                end
                    
                start_enc_next = 1'b1;
                flip_cmt_ctr = 1'b1;
            end
            
            if (enc_ready_in_1)
                main_addr_write_opc_next = GOTO_COM_BUFF_ADDR;
            else
                main_addr_write_opc_next = INCR_ADDR_WR;
            
            if (enc_ready || enc_ready_train[1] || enc_ready_train[3] || (enc_ready_train[5] && !new_enc_state_train[0]))
                mem_wren_1_next = 1'b1;
            
            if (enc_ready_train[1] && !new_enc_state_train[14])
                commit_filled_next = 'h1;
            
//            if (|enc_ready_train[4:0])
                shift_tail_next = 1'b1;
        end
        
        S_EXPAND_LEAVES: begin
            if (enc_ready_in_3)
                prg_counter_opc_next = INCR_PRG_CTR;
            
            if (prg_counter_last_leaf_exp) begin// Note: this needs to be generalized for NUM_EXPANDS != 2
                if (enc_ready_train[3] || enc_ready_in_6 || enc_ready_in_5 || enc_ready_in_4)
                    main_addr_read_opc_next = INCR_ADDR_R;
                    
                if (enc_ready_in_5)
                    seed_regs_load_en_next[0] = 1'b1;
                if (enc_ready_in_4)
                    seed_regs_load_en_next[1] = 1'b1;
                if (enc_ready_in_3)
                    seed_regs_load_en_next[2] = 1'b1;
                if (enc_ready_in_2)
                    seed_regs_load_en_next[3] = 1'b1;
            end
            
            if (enc_ready_in_2) begin // Start next commit
                if (prg_counter_last_leaf_exp)
                    enc_mode_next = MODE_CMT;
            
                if (!prg_counter_last_leaf_exp || (N_div_par_enc_counter != (`N/`NUM_PARALLEL_ENC)-1))
                    start_enc_next = 1'b1;
                
                update_enc_state_next = 1'b1;
            end
            
            if (enc_ready || enc_ready_train[1] || enc_ready_train[3])
                eval_counter_opc_next = INCR_EVAL_CTR;
            else if (enc_ready_train[5])
                eval_counter_opc_next = DECR_EVAL_CTR_x3;
                
            if (new_enc_state_train[1] || new_enc_state_train[3] || new_enc_state_train[5] || new_enc_state_train[7])
                shift_small_next = 1'b1;
                
            if (|new_enc_state_train[8:1]) begin
                share_valid_next = 1'b1;
                shift_tail_next = 1'b1;
            end
            
            if (|enc_ready_train[4:1] && !loading_node_idx_log2_N_trail_zeros)
                incr_loading_node_idx_next = 1'b1;
                
            if (loading_sibl_node && (enc_ready_in_7 || enc_ready_in_6 || enc_ready_in_5 || enc_ready_in_4) && !loading_node_idx_log2_N_trail_zeros)
                use_alt_read_addr_next = 'h1;
                
        end
        
        S_EXP_2_COMMIT: begin
            enc_mode_next = MODE_CMT;
            shift_tail_next = 1'b1;
            
            if (enc_ready || enc_ready_train[1] || enc_ready_train[3] || enc_ready_train[5])
                eval_counter_opc_next = INCR_EVAL_CTR;

//            if (enc_ready)
            if (new_enc_state_train[1])
                incr_N_div_par_enc_counter_next = 1'b1;
            
//            if (enc_ready_in_5 && N_div_par_enc_counter_zero)
            if (new_enc_state_train[7] && N_div_par_enc_counter_zero)
                incr_e_next = 1'b1;
            
            if (new_enc_state_train[7])
                update_enc_state_next = 1'b1;
                
            if (enc_ready || enc_ready_train[1] || enc_ready_train[3] || enc_ready_train[5])
                share_valid_next = 1'b1;
        end
        
        S_WAIT_POLY_COMP: begin
            if (poly_comp_ready) begin
                main_addr_read_opc_next = GOTO_SEED_EQ_0_ADDR;
                update_enc_state_next = 1'b1;
            end
        end
        
        S_WAIT_I_STAR: if (sibl_path_valid) update_enc_state_next = 1'b1;
        
        S_PACK_SIBL_PATH_0: begin
            mem_input_is_enc_out_next = 1'b0; // Store directly from mem
            enc_mode_next = MODE_GGM;
            
            if (new_enc_state_train[3])
                load_salt_next = 1'b1;
            
            if (new_enc_state_train[0]) begin
                main_addr_read_opc_next = GOTO_SALT_ADDR;
                main_addr_write_opc_next = GOTO_SIBL_PATH_ADDR;
            end else if (new_enc_state_train[1])
                main_addr_read_opc_next = GOTO_ROOT_SEED_PAIR_ADDR;
            else if (new_enc_state_train[2])
                main_addr_read_opc_next = INCR_ADDR_R;
                
            if (sibl_node[0]) begin // Expand node 'h02 and store node 'h03
                if (new_enc_state_train[4])
                    seed_regs_load_en_next[0] = 1'b1;
                
                if (new_enc_state_train[5])
                    mem_wren_1_next = 1'b1;
            end else begin // Expand node 'h03 and store node 'h02
                if (new_enc_state_train[4])
                    mem_wren_1_next = 1'b1;
                
                if (new_enc_state_train[5])
                    seed_regs_load_en_next[0] = 1'b1;
            end
            
            if (new_enc_state_train[5])
                main_addr_write_opc_next = INCR_ADDR_WR;
            
            if (new_enc_state_train[5]) begin
                start_enc_next = 1'b1;
                incr_tree_lvl_ctr_j_next = 1'b1;
            end
        end
        
        S_PACK_SIBL_PATH_1: begin
            enc_mode_next = MODE_GGM;
            shift_tail_next = 1'b1; // enc_ready_in_1
            
            if (enc_ready || enc_ready_train[0]) // Write in both cases anyway. Incr wr_addr if we do not wish to overwrite
                mem_wren_1_next = 1'b1;
            
            if (sibl_node[0]) begin
                if (enc_ready_train[0])
                    main_addr_write_opc_next = INCR_ADDR_WR;
                if (enc_ready_train[1])
                    seed_regs_load_en_next[0] = 1'b1;
            end else begin
                if (enc_ready)
                    main_addr_write_opc_next = INCR_ADDR_WR;
                if (enc_ready_train[2])
                    seed_regs_load_en_next[0] = 1'b1;
            end
            
            if (enc_ready_train[2]) begin// The above risks leaking a secret node to the mem. This fixes the issue.
                rst_mem_input_regs_next = 'h1;
                mem_wren_1_next = 1'b1;
            end
                
            
            if (enc_ready_train[2]) begin
                start_enc_next = 1'b1;
                incr_tree_lvl_ctr_j_next = 1'b1;
                
                // Prep next state
                if (tree_lvl_ctr_j == (`MQOM2_PARAM_NB_EVALS_LOG2-1))
                    enc_mode_next = MODE_CMT;
            end
        end
        
        S_PACK_COMMITS_I_STAR: begin
            enc_mode_next = MODE_CMT;
            
            if (!cmt_ctr && enc_ready_in_3)
                main_addr_write_opc_next = GOTO_COMMIT_I_STAR_ADDR;
            
            if (enc_ready_in_2) begin
                flip_cmt_ctr = 1'b1;
                
                if (!cmt_ctr)
                    start_enc_next = 1'b1;
                else
                    incr_e_next = 1'b1;
            end
            
            if (enc_ready && last_mpc_round_pip && cmt_ctr_prev)
                enc_fsm_done_next = 1'b1;
            
            if (enc_ready) begin
                main_addr_write_opc_next = INCR_ADDR_WR;
                mem_wren_1_next = 1'b1;
            end
            
            if (sibl_path_valid)
                update_enc_state_next = 1'b1;
        end
        
        S_GGM_TREE_LEVEL_1_VERIF: begin // use_alt_read_addr_next
            enc_mode_next = MODE_GGM;
            shift_tail_next = 1'b1;
       
            if (|new_enc_state_train[3:0] || enc_ready_in_2 || enc_ready_in_1 || enc_ready || enc_ready_train[0])
                incr_loading_node_idx_next = 1'b1;
            
            if (new_enc_state_train[0])
                main_addr_write_opc_next = GOTO_ON_THE_FLY_GGM_ADDR;                
            
            if (new_enc_state_train[0])
                alt_read_addr_opc_next = ALT_ADDR_GOTO_SIBL_PATH_END;
            else if (new_enc_state_train[1])
                alt_read_addr_opc_next = ALT_ADDR_GOTO_SIBL_PATH_START;
            else if (new_enc_state_train[2] || enc_ready_train[2])
                alt_read_addr_opc_next = ALT_ADDR_INCR;
            
            if (|new_enc_state_train[2:1])
                use_alt_read_addr_next = 'h1;
                
            if (new_enc_state_train[4]) begin// Load both. One is incorrect, but this will be fixed later.
                seed_regs_load_en_next[0] = 1'b1;
                seed_regs_load_en_next[1] = 1'b1;
            end
            
            if (new_enc_state_train[4])
                start_enc_next = 1'b1;
            
            // Wren if input valid, otherwise read from sibling path
//            if (((enc_ready || enc_ready_train[0]) && !sibl_node[0]) || (|enc_ready_train[2:1] && sibl_node[0]))
            if ((enc_ready || |enc_ready_train[2:0]) && !loading_sibl_node)
                mem_wren_1_next = 1'b1;
                
//            if (((enc_ready || enc_ready_train[0]) && sibl_node[0]) || (|enc_ready_train[2:1] && !sibl_node[0]))
            if ((enc_ready || |enc_ready_train[2:0]) && loading_sibl_node)
                use_alt_read_addr_next = 'h1;
                
            if (enc_ready || |enc_ready_train[2:0]) // keep incrementing wr_addr anyway
                main_addr_write_opc_next = INCR_ADDR_WR;
            
            if (enc_ready_train[0])
                incr_N_div_par_enc_counter_next = 1'b1;
            
            if (enc_ready_train[1]) begin
                seed_regs_load_en_next[0] = 1'b1;
            end
            
            if (enc_ready_train[2])
                seed_regs_load_en_next[1] = 1'b1;
            if (enc_ready_train[3])
                seed_regs_load_en_next[2] = 1'b1;
            if (enc_ready_train[4])
                seed_regs_load_en_next[3] = 1'b1;
            if (enc_ready_train[5]) begin
                start_enc_next = 1'b1;
                update_enc_state_next = 1'b1;
            end
        end
    endcase
end

// FSM state transition logic
always_ff @ (posedge clk) state_enc_fsm <= rst ? S_IDLE : state_enc_fsm_next;
always_ff @ (posedge clk) enc_fsm_done <= rst ? 1'b0 : enc_fsm_done_next;

always_comb begin
    state_enc_fsm_next <= state_enc_fsm;
    
    case (state_enc_fsm)
        S_IDLE: begin
            if (enc_fsm_done)
                state_enc_fsm_next <= S_IDLE;
            else if (keygen)
                state_enc_fsm_next <= S_EXPAND_EQUATIONS;
            else if (sign)
                state_enc_fsm_next <= S_EXPAND_MSEED;
            else if (sibl_path_valid)
                state_enc_fsm_next <= S_GGM_TREE_LEVEL_1_VERIF;
        end
        
        S_EXPAND_EQUATIONS: begin
            if (enc_fsm_done)
                state_enc_fsm_next <= S_IDLE;
            else if (goto_wait_sibl_path)
                state_enc_fsm_next <= S_WAIT_I_STAR;
        end
        
        S_EXPAND_MSEED: if ((prg_counter=='h0) && enc_ready_train[0]) state_enc_fsm_next <= S_GGM_TREE_LEVEL_1;
        
        S_GGM_TREE_LEVEL_1: if (enc_ready_train[5] && !new_enc_state_train[4]) state_enc_fsm_next <= S_GGM_TREE_LEVEL_2;
        
        S_GGM_TREE_LEVEL_2: if (enc_ready_train[6] && !new_enc_state_train[0]) state_enc_fsm_next <= S_GGM_TREE_LEVEL_3_PLUS;
        
        S_GGM_TREE_LEVEL_3_PLUS: if (enc_ready_train[6] && N_div_par_enc_counter[$clog2(`N/`NUM_PARALLEL_ENC)-1]) state_enc_fsm_next <= S_GEN_LEAVES;
        
        S_GEN_LEAVES: if (N_div_par_enc_counter_zero && enc_ready_in_1) state_enc_fsm_next <= S_GEN_2_COMMIT;
        
        S_GEN_2_COMMIT: if (new_enc_state_train[5]) state_enc_fsm_next <= S_COMMIT_LEAVES;
        
        S_COMMIT_LEAVES: if (enc_ready_in_4 && cmt_ctr_prev) state_enc_fsm_next <= S_EXPAND_LEAVES;
        
        S_EXPAND_LEAVES: if (enc_ready_in_1 && prg_counter_last_leaf_exp) state_enc_fsm_next <=  S_EXP_2_COMMIT;
        
//        S_EXP_2_COMMIT: if (new_enc_state_train[7]) state_enc_fsm_next <= N_div_par_enc_counter_zero ? S_GGM_TREE_LEVEL_1 : S_COMMIT_LEAVES;
        S_EXP_2_COMMIT: if (new_enc_state_train[7]) begin
            if (N_div_par_enc_counter_zero) begin
                if `LAST_MPC_ROUND
                    state_enc_fsm_next <= S_WAIT_POLY_COMP;
                else if (verify)
                    state_enc_fsm_next <= S_GGM_TREE_LEVEL_1_VERIF;
                else
                    state_enc_fsm_next <= S_GGM_TREE_LEVEL_1;
            end else
                state_enc_fsm_next <= S_COMMIT_LEAVES;
        end
        
        S_WAIT_POLY_COMP:
            if (poly_comp_ready)
                state_enc_fsm_next <= S_EXPAND_EQUATIONS;
        
        S_WAIT_I_STAR: begin
            if (sibl_path_valid) begin
                if (sign)
                    state_enc_fsm_next <= S_PACK_SIBL_PATH_0;
//                else
                    
            end
        end
        
        S_PACK_SIBL_PATH_0: if (new_enc_state_train[5]) state_enc_fsm_next <= S_PACK_SIBL_PATH_1;
        
        S_PACK_SIBL_PATH_1:
            if (enc_ready_train[2] && tree_lvl_ctr_j == (`MQOM2_PARAM_NB_EVALS_LOG2-1))
                state_enc_fsm_next <= S_PACK_COMMITS_I_STAR;
                
        S_PACK_COMMITS_I_STAR:
            if (enc_fsm_done)
                state_enc_fsm_next <= S_IDLE;
            else if (sibl_path_valid)
                state_enc_fsm_next <= S_PACK_SIBL_PATH_0;
                
        S_GGM_TREE_LEVEL_1_VERIF: if (enc_ready_train[5]) state_enc_fsm_next <= S_GGM_TREE_LEVEL_2;
        
//        S_EXPAND_LEAVES: if (something_done) state_enc_fsm_next <= S_GGM_TREE_LEVEL_1;
//                         else if (smth_else) state_enc_fsm_next <= S_EXPAND_EQUATIONS;
//                         else if (smth_else) state_enc_fsm_next <= S_COMMIT_LEAVES;
    endcase
end

// ****************************
// Pipeline signals
always_ff @ (posedge clk) begin
    goto_wait_sibl_path   <= goto_wait_sibl_path_next;
    enc_mode   <= enc_mode_next;
    load_salt   <= load_salt_next;
    start_enc   <= start_enc_next;
    shift_small <= shift_small_next;
    shift_tail      <= shift_tail_next;
    mem_input_is_enc_out <= mem_input_is_enc_out_next;
    rst_mem_input_regs <= rst_mem_input_regs_next;
    rst_salt <= (state_enc_fsm == S_EXPAND_EQUATIONS);
    add_delta <= add_delta_next;
    load_sibl_leaf <= load_sibl_leaf_next;
    pre_load_sibl_leaf <= (state_enc_fsm == S_GGM_TREE_LEVEL_1_VERIF) && new_enc_state_train[3];
    
    seed_regs_load_en <= seed_regs_load_en_next;
    last_m_hat_4x <= (m_hat_counter==(`MQOM2_PARAM_M_HAT-`NUM_PARALLEL_ENC));
    last_m_hat    <= (m_hat_counter==(`MQOM2_PARAM_M_HAT-1));
    e_out <= e;
    incr_tree_lvl_ctr_j <= incr_tree_lvl_ctr_j_next;
    commit_filled <= commit_filled_next;
    N_div_par_enc_counter_zero <= (N_div_par_enc_counter == 'h0);
    
    rst_raw_regs <= !share_valid_next || (verify && eval_counter == i_star_e); // Send zeros instead of whatever is coming out when verify && eval_counter == i_star_e
    
    loading_node_idx_log2_N_trail_zeros <= (loading_node_idx[$clog2(`N)-1:0] == 'h0);
    
    last_mpc_round_pip <= `LAST_MPC_ROUND;
    
     // Ignore if signing
    loading_sibl_node <= verify && loading_sibl_node_next;
    
    sibl_node_pip <= sibl_node;
    
//    if (enc_ready_in_1)
//        sibl_node_gated <= sibl_node;
    
    // Leads as to ibling path without breaking the normal main_mem_read_addr_1 stride
    use_alt_read_addr <= use_alt_read_addr_next;

    alt_read_addr_opc <= alt_read_addr_opc_next;
    
    case (alt_read_addr_opc)
        ALT_ADDR_GOTO_SIBL_PATH_START: main_mem_addr_1_read_alt <=  `ENC_SIDE_ADDR(`SIBL_PATH_ADDR) /*+ tree_lvl_ctr_j*/ + (e << $clog2(`MQOM2_PARAM_NB_EVALS_LOG2));
        
        ALT_ADDR_GOTO_SIBL_PATH_END: main_mem_addr_1_read_alt <=  `ENC_SIDE_ADDR(`SIBL_PATH_ADDR) + ((1 << $clog2(`MQOM2_PARAM_NB_EVALS_LOG2)) -1) + (e << $clog2(`MQOM2_PARAM_NB_EVALS_LOG2));
    
        ALT_ADDR_INCR:  main_mem_addr_1_read_alt <=  main_mem_addr_1_read_alt + 1'b1;
    endcase
    
    prg_counter_last_leaf_exp <= (prg_counter==`NUM_LEAF_EXPANDS-1);
    
    if (enc_ready_in_2) cmt_ctr_prev <= cmt_ctr;
    if (enc_ready_in_2) cmt_ctr_prev_2 <= cmt_ctr_prev;
    
    omega_out <=  (eval_counter ^ (eval_counter >> 1)); // generate gray code
    
    // Trailing 1 counter
    if (~eval_counter[0])
        p_i <= 3'h0;
    else if (~eval_counter[1])
        p_i <= 3'h1;
    else if (~eval_counter[2])
        p_i <= 3'h2;
    else if (~eval_counter[3])
        p_i <= 3'h3;
    else if (~eval_counter[4])
        p_i <= 3'h4;
    else if (~eval_counter[5])
        p_i <= 3'h5;
    else if (~eval_counter[6])
        p_i <= 3'h6;
    else
        p_i <= 3'h7;
    
//    casex (eval_counter)
//       'bxxxxxxx0:  p_i <= 3'h0;
//       'bxxxxxx01:  p_i <= 3'h1;
//       'bxxxxx011:  p_i <= 3'h2;
//       'bxxxx0111:  p_i <= 3'h3;
//       'bxxx01111:  p_i <= 3'h4;
//       'bxx011111:  p_i <= 3'h5;
//       'bx0111111:  p_i <= 3'h6;
//       default:     p_i <= 3'h7;
//    endcase
end

// ***************************************
// Memory input update logic ( & more :) )
always_ff @ (posedge clk) begin
    main_mem_addr_1 <= use_alt_read_addr ? main_mem_addr_1_read_alt :
                       mem_wren_1        ? main_mem_addr_1_write    : main_mem_addr_1_read;
//    new_enc_state_train <= { (update_enc_state_next ? 'h0 : new_enc_state_train), (update_enc_state_next ? 1'b1 : 1'b0) }; // shift up & update LSB
    
    if (rst) begin
        main_mem_wren_1_out <= 1'b0;
        mem_wren_1 <= 1'b0;
        prg_counter <= 'b0;
        cmt_ctr <= 'b0;
        e <= 'b0;
        incr_e <= 'b0;
        m_hat_counter <= 'b0;
        N_div_par_enc_counter <= 'b0;
        incr_N_div_par_enc_counter <= 'b0;
        toggling_counter <= 'b0;
        eval_counter_opc <= FREEZE_EVAL_CTR;
        eval_counter <= 'b0;
        share_valid <= 'b0;
        
        incr_loading_node_idx <= 'b0;
        loading_node_idx <= 'b0;
        
        main_addr_write_opc <= FREEZE_ADDR_WR;
        main_addr_read_opc <= FREEZE_ADDR_R;
        prg_counter_opc <= FREEZE_PRG_CTR;
        m_hat_counter_opc <= FREEZE_M_HAT_CTR;
        
        main_mem_addr_1_write <= `ENC_SIDE_ADDR(`ROOT_SEED_PAIR_0_ADDR);
        main_mem_addr_1_read <= `ENC_SIDE_ADDR(`MSEED_ADDR);
        
        new_enc_state_train <= 'h0;
        enc_ready_train <= 'h0;
        expand_eq_valid <= 1'b0;
//        update_enc_state <= 1'b0;
        
    end else begin
        new_enc_state_train[7:0] <= {new_enc_state_train[6:0], update_enc_state_next}; // shift up & update LSB
        new_enc_state_train[NEW_ENC_STATE_MSB:8] <= new_enc_state_train[NEW_ENC_STATE_MSB-1:7]; // shift up & update LSB
        enc_ready_train <= {enc_ready_train, enc_ready}; // shift up & update LSB
        
        expand_eq_valid <= expand_eq_valid_next;
        main_mem_wren_1_out <= mem_wren_1;
        mem_wren_1 <= mem_wren_1_next;
//        update_enc_state <= update_enc_state_next;
        
        main_addr_write_opc <= main_addr_write_opc_next;
        main_addr_read_opc <= main_addr_read_opc_next;
        prg_counter_opc <= prg_counter_opc_next;
        m_hat_counter_opc <= m_hat_counter_opc_next;
        incr_e <= incr_e_next;
        share_valid <= share_valid_next;
        
        incr_loading_node_idx <= incr_loading_node_idx_next;

//        if (state_enc_fsm == S_EXP_2_COMMIT && N_div_par_enc_counter_zero && new_enc_state_train[7])
//            loading_node_idx <= 'b0;
//        else 
        if (incr_loading_node_idx)
            loading_node_idx <= loading_node_idx + 1'b1;
        
        case (eval_counter_opc)
            INCR_EVAL_CTR:      eval_counter <= eval_counter + 1'b1; // Modulo power-of-2 counter
            DECR_EVAL_CTR_x3:   eval_counter <= eval_counter - 2'h3;
        endcase
        
        eval_counter_opc <= eval_counter_opc_next;
        
        if (toggle_on)
            toggling_counter <= ~toggling_counter;
        
        if (incr_N_div_par_enc_counter)
            N_div_par_enc_counter <= N_div_par_enc_counter + 1'b1;
            
        incr_N_div_par_enc_counter <= incr_N_div_par_enc_counter_next;
                        
        if (incr_e)
            e <= `LAST_MPC_ROUND ? 'h0 : (e+1'b1);
        
        if (flip_cmt_ctr)
            cmt_ctr <= !cmt_ctr;
        
        case (main_addr_write_opc)
            INCR_ADDR_WR: main_mem_addr_1_write <= main_mem_addr_1_write + 1'b1;
            
            GOTO_ON_THE_FLY_GGM_ADDR: main_mem_addr_1_write <= `ENC_SIDE_ADDR(`ON_THE_FLY_GGM_ADDR);
            
            GOTO_COM_BUFF_ADDR: main_mem_addr_1_write <= `ENC_SIDE_ADDR(`COM_BUFF_ADDR) + !cmt_ctr;
            
            GOTO_SIBL_PATH_ADDR: main_mem_addr_1_write <= `ENC_SIDE_ADDR(`SIBL_PATH_ADDR) +/* tree_lvl_ctr_j +*/ (e << $clog2(`MQOM2_PARAM_NB_EVALS_LOG2));
            
            GOTO_COMMIT_I_STAR_ADDR: main_mem_addr_1_write <= `ENC_SIDE_ADDR(`COMMITS_I_STAR_ADDR) + (e << $clog2(`LAMBDA_WORD_RATIO));
        endcase
                
        case (main_addr_read_opc)
            INCR_ADDR_R: main_mem_addr_1_read <= main_mem_addr_1_read + 1'b1;
            
            GOTO_SEED_EQ_0_ADDR: main_mem_addr_1_read <= `ENC_SIDE_ADDR(`SEED_EQ_0_ADDR);
            
            GOTO_SALT_ADDR: main_mem_addr_1_read <= `ENC_SIDE_ADDR(`SALT_ADDR);
            
            GOTO_SECRET_X_ADDR: main_mem_addr_1_read <= `ENC_SIDE_ADDR(`SECRET_X_ADDR);
            
            GOTO_ROOT_SEED_PAIR_ADDR: main_mem_addr_1_read <= `ENC_SIDE_ADDR(`ROOT_SEED_PAIR_0_ADDR) + (e << 1); // Skip 2 seeds for every e already done
            
            GOTO_ON_THE_FLY_GGM_STORAGE: main_mem_addr_1_read <= `ENC_SIDE_ADDR(`ON_THE_FLY_GGM_ADDR) + (N_div_par_enc_counter[$clog2(`N/`NUM_PARALLEL_ENC)-2:0] << $clog2(`NUM_PARALLEL_ENC));
        endcase
                
        case (prg_counter_opc)
            INCR_PRG_CTR: begin
                case (state_enc_fsm)
                    S_EXPAND_EQUATIONS: prg_counter <= (prg_counter==`NUM_EXPAND_EQ_ENC_CALLS) ? 'h0 : (prg_counter+1'b1);
                
//                    S_EXPAND_LEAVES:    prg_counter <= (prg_counter==`NUM_LEAF_EXPANDS-1) ? 'h0 : (prg_counter+1'b1);
                    
                    S_EXPAND_MSEED:     prg_counter <= (prg_counter==`TAU-1) ? 'h0 : (prg_counter+1'b1);
                    
//                    default:            prg_counter <= (prg_counter==`NUM_LEAF_EXPANDS-1) ? 'h0 : (prg_counter+1'b1);
                    default:            prg_counter <= (prg_counter==`NUM_LEAF_EXPANDS-1) ? 'h0 : (prg_counter+1'b1);
                endcase
            end
            
//            INCR_PRG_CTR_4x: prg_counter <= (prg_counter==`MQOM2_PARAM_M_HAT-4) ? 'h0 : (prg_counter+3'h4);
        endcase
        
        case (m_hat_counter_opc)
            INCR_M_HAT_CTR: m_hat_counter <= last_m_hat ? 'h0 : (m_hat_counter+1'b1);
            
            INCR_M_HAT_CTR_4x: m_hat_counter <= last_m_hat_4x ? 'h0 : (m_hat_counter+3'h4);
        endcase
    end
    
    // Get current GGM level from N_div_par_enc_counter
//    if (N_div_par_enc_counter[7])
//        tree_lvl_ctr_j <= 'h8;
//    else if (N_div_par_enc_counter[6])
//        tree_lvl_ctr_j <= 'h7;
//    else
    if (state_enc_fsm == S_PACK_SIBL_PATH_1) begin
        if (incr_tree_lvl_ctr_j)
            tree_lvl_ctr_j <= tree_lvl_ctr_j + 'h1;
    end else if (N_div_par_enc_counter[5])
        tree_lvl_ctr_j <= 'h6;
    else if (N_div_par_enc_counter[4])
        tree_lvl_ctr_j <= 'h5;
    else if (N_div_par_enc_counter[3])
        tree_lvl_ctr_j <= 'h4;
    else if (N_div_par_enc_counter[2])
        tree_lvl_ctr_j <= 'h3;
    else if (N_div_par_enc_counter[1])
        tree_lvl_ctr_j <= 'h2;
    else if (N_div_par_enc_counter[0])
        tree_lvl_ctr_j <= 'h1;
    else
        tree_lvl_ctr_j <= 'h0;
        
    if (rst)
        sibl_path_lvl_ctr <= 'h0;
    else /*if (state_enc_fsm == S_PACK_SIBL_PATH_1) begin*/
        if (incr_tree_lvl_ctr_j)
            sibl_path_lvl_ctr <= sibl_path_lvl_ctr + 'h1;
    /*end*/ else if (incr_loading_node_idx && ( loading_node_idx == 'h3 || loading_node_idx == 'h7 || loading_node_idx == 'he || loading_node_idx == 'h1e || loading_node_idx == 'h3e || loading_node_idx == 'h7e || loading_node_idx == 'hfe || loading_node_idx == 'h1fe ))
        sibl_path_lvl_ctr <= sibl_path_lvl_ctr + 'h1;
        
//    else if (loading_node_idx[8])
//        sibl_path_lvl_ctr <= 'h7;
//    else if (loading_node_idx[7])
//        sibl_path_lvl_ctr <= 'h6;
//    else if (loading_node_idx[6])
//        sibl_path_lvl_ctr <= 'h5;
//    else if (loading_node_idx[5])
//        sibl_path_lvl_ctr <= 'h4;
//    else if (loading_node_idx[4])
//        sibl_path_lvl_ctr <= 'h3;
//    else if (loading_node_idx[3])
//        sibl_path_lvl_ctr <= 'h2;
//    else if (loading_node_idx[2])
//        sibl_path_lvl_ctr <= 'h1;
//    else
//        sibl_path_lvl_ctr <= 'h0;
end

endmodule

`default_nettype wire
