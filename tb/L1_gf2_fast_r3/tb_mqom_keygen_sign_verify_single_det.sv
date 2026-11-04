/*
 * tb_mqom_keygen_sign_verify_single_det.sv
 * ----------------------------------------
 * This testbench runs a single deterministic MQOM KeyGen, Sign, and Verify
 * sequence, checking the results against known reference outputs.
 * Verification is repeated to ensure that the first verification does not
 * alter the signature data stored in memory.
 *
 * Golden reference outputs are derived from the MQOM v2.1 software
 * implementation.
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

`timescale 1ns/1ps

`include "mqom2_main_header.vh"

module tb_mqom_keygen_sign_verify_single_det;

    // Testbench signals
    reg        rst        = 1'b0;
    reg        clk        = 1'b0;
    reg [1:0]  start_comm = 2'b00;

    wire         done;
    wire         bad_sig;
    
    // DUT instantiation
    mqom_wrapper dut (
        .rst        (rst),
        .clk        (clk),
        .start_comm (start_comm),
        .done       (done),
        .bad_sig    (bad_sig)
    );
    
     task clear_seed_eq_mem_to_x;
        begin
          for (int j = `SEED_EQ_0_ADDR; j < (`SEED_EQ_0_ADDR+`SEEDS_EQ_WORDS_TOTAL); j = j + 1)
            dut.main_mem.mem[j] = 'x;
        end
      endtask
      
     task clean_root_seed_pairs_from_main_mem;
        begin
          for (int j = `ROOT_SEED_PAIR_0_ADDR; j < (`ROOT_SEED_PAIR_0_ADDR+`ROOT_SEED_PAIRS_WORDS); j = j + 1)
            dut.main_mem.mem[j] = 'x;
        end
      endtask
      
    
    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    // Basic stimulus template
    initial begin
        // Initial values
        rst        = 1'b0;
        start_comm = 2'b0;

        @(negedge clk);
        #10;
        rst = 1'b1;
        #10;
        rst = 1'b0;

        #10;
        $display("");
        $display("Starting Keygen:");
        start_comm = `START_KEYGEN;

//        #10;
//        start_comm = `START_SIGN;
        #10;
        start_comm = 2'b0;

        
        wait(done);
        if (dut.main_mem.mem['d11]=='h954a60314040c3fa &&  dut.main_mem.mem['d12]=='h275bd75bcca65531 && dut.main_mem.mem['d13]=='h00000000e9b374e0)
            $display("Keygen output correct!");
        else begin
            $display("Keygen failed!");
            $finish;
        end
        $display("");
        #10;
        clear_seed_eq_mem_to_x();
        rst = 1'b1;
        #10;
        rst = 1'b0;
//        #10;
        $display("Starting Sign:");
        start_comm = `START_SIGN;
        #10;
        start_comm = 2'b0;
        
//        #45000;
//        #1200000;
//        #1400000;
        wait(done);
        if ( dut.main_mem.mem[`COMMITS_I_STAR_ADDR+`HASH_WORDS*`TAU-1]=='hcaa8f193c4663595 // Last cmt_i*['h10] word correct
          &&
             dut.main_mem.mem[`GRINDING_NONCE_ADDR]=='h00000000000001a0)// grinding nonce correct
            $display("Sign output correct!");
        else begin
            $display("Sign failed!");
            $finish;
        end
        $display("");
        #10;
        
        clean_root_seed_pairs_from_main_mem();
        clear_seed_eq_mem_to_x();
        dut.enc_prg_wrapper_inst.salt_reg = 'x; // Clear salt_reg
        
        rst = 1'b1;
        #10;
        rst = 1'b0;
        #10;

        $display("Starting Verify:");
        start_comm = `START_VERIFY;
        #10;
        start_comm = 2'b0;
//        #42000;
//        #892000;
        
        wait(done);
        
        if (bad_sig)
            $display("Verifier rejects signature!");
        else
            $display("Verifier accepts signature!");
        
        $display("");
        #10
        
        clean_root_seed_pairs_from_main_mem();
        clear_seed_eq_mem_to_x();
        dut.enc_prg_wrapper_inst.salt_reg = 'x; // Clear salt_reg
        
        rst = 1'b1;
        #10;
        rst = 1'b0;
        #50;

        $display("Starting Verify:");
        start_comm = `START_VERIFY;
        #10;
        start_comm = 2'b0;
        
        wait(done);
        if (bad_sig)
            $display("Verification destroys signature!");
        else
            $display("Verification leaves signature intact!");
        
        $finish;
        
        $display("");
        #10;
    end
    
endmodule
