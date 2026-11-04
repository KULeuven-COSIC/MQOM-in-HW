/*
 * This testbench runs a single deterministic MQOM KeyGen, Sign, and Verify
 * sequence, checking the results against known reference outputs.
 * Verification is repeated to ensure that the first verification does not
 * alter the signature data stored in memory.
 *
 * Golden reference outputs are derived from the MQOM v2.1 software
 * implementation.
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
    reg          err;
    
    wire debug_wire = dut.enc_prg_wrapper_inst.enc_fsm_inst.tree_lvl_ctr_j != dut.enc_prg_wrapper_inst.enc_fsm_inst.sibl_path_lvl_ctr;
    
//    wire debug_wire_keccaks = (dut.keccak_inst.shake.state_regs != dut.keccak_inst.keccak_inst.data_path_instance.state_regs);

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
        err        = 1'b0;
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
        
        err |= dut.main_mem.mem[`Y_ADDR+0] != 'h7953a9eefa30a9a5;
        err |= dut.main_mem.mem[`Y_ADDR+1] != 'hcb1c4cb317bbd048;
        err |= dut.main_mem.mem[`Y_ADDR+2] != 'h12bc8a2290595e38;
        err |= dut.main_mem.mem[`Y_ADDR+3] != 'h00000000e20888a8;
        
        if (!err)
            $display("Keygen output correct!");
        else begin
            $display("Keygen failed!");
            $finish;
        end
//        $display("Keygen done!");
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
        if ( dut.main_mem.mem[`COMMITS_I_STAR_ADDR+`HASH_WORDS*`TAU-1]=='hd5dfa8df3696f13c // Last cmt_i*['h10] word correct
          &&
             dut.main_mem.mem[`GRINDING_NONCE_ADDR]=='h0000000000000066)// grinding nonce correct
            $display("Sign output correct!");
        else begin
            $display("Sign failed!");
            $finish;
        end
//        $display("Sign done!");
        $display("");
        #10;
        
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
//        #42000;
//        #892000;
        
        wait(done);
        #100
        
        if (bad_sig) begin
            $display("Verifier rejects signature!");
            $finish;
        end else
            $display("Verifier accepts signature!");
            
        $display("");
        
        rst = 1'b1;
        #10;
        rst = 1'b0;
        #50;

        $display("Starting Verify #2:");
        start_comm = `START_VERIFY;
        #10;
        start_comm = 2'b0;
//        #42000;
//        #892000;
        
        wait(done);
        #100
        
        if (bad_sig) begin
            $display("Verifier destroys signature!");
            $finish;
        end else
            $display("Verifier doesn't destroy signature!");
            
        $display("");
        $finish;
        
    end
    
endmodule
