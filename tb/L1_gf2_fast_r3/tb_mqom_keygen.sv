`timescale 1ns/1ps

`include "mqom2_main_header.vh"

module tb_mqom_keygen;

    // Testbench signals
    reg        rst        = 1'b0;
    reg        clk        = 1'b0;
    reg [1:0]  start_comm = 2'b00;

    wire         done;
    wire         bad_sig;
    reg          err;

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
        if (dut.main_mem.mem['d11]=='h954a60314040c3fa &&  dut.main_mem.mem['d12]=='h275bd75bcca65531 && dut.main_mem.mem['d13]=='h00000000e9b374e0)
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
        if ( dut.main_mem.mem[`COMMITS_I_STAR_ADDR+`HASH_WORDS*`TAU-1]=='hcaa8f193c4663595 // Last cmt_i*['h10] word correct
          &&
             dut.main_mem.mem[`GRINDING_NONCE_ADDR]=='h00000000000001a0)// grinding nonce correct
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
        
                #10;
        $display("");
        $display("========== Vector 1 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hce474c027910dff3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h88edffd52b62ad8b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8cc28f544d0ce027;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3e1a12446a189518;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5550d34790758229;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h99e39faf5d138e50;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h88f01ed7f491d985;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h562763da4a59ef18;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h5fb6037b6bd9e01a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3286f4ba653fee00;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd503fc5ca4f1e335;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4f41b605c06f9219;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e1;
    
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
        if (dut.main_mem.mem[`Y_ADDR+0]=='h6361fe8c463ae143 &&  dut.main_mem.mem[`Y_ADDR+1]=='hbabfb5f1e5146db2 && dut.main_mem.mem[`Y_ADDR+2]=='h000000006d319bc4)
            $display("Keygen output correct!");
        else begin
            $display("Keygen failed!");
            $finish;
        end
        $display("");
        
        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);

        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000b32);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7c7d14f09723665d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb76b31d70c9151c1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2c6c9556d4a15a00);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3454f29cc18eec22);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd0d38f1192378c78);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h25127f8c28374d79);
        err |= | (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he821711af15df85d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h537b44079dbe6613);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb3bae264aa23c44f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h51bdaec7e25441fb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hccaef317b28c06e5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hbb9881d104afb766);
        if (err) begin
            $display("Vector 1: Sign failed!");
            $finish;
        end else begin
            $display("Vector 1: Sign output correct!");
        end
        
        clean_root_seed_pairs_from_main_mem();
        clear_seed_eq_mem_to_x();
        dut.enc_prg_wrapper_inst.salt_reg = 'x;
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Verify:");
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);

        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd0d38f1192378c78);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h25127f8c28374d79);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he821711af15df85d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h537b44079dbe6613);
        if (bad_sig) begin
            $display("Vector 1: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 1: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 1: Verifier accepts signature!");
        end
        
        // ---------------- Vector 14 ----------------
        $display("");
        $display("========== Vector 14 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hed11d3c11c8fea4d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2fcacb7655c3d99f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1fbb3d87285688c6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h94fdb361d6cdc093;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hec97710f3486c50f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h691979f5595f2510;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf7e6adf9ead56d9d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hea3107417b2f715e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1952a1ff5eac5d1f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h53cc0c3d3729f2be;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h646be2a3a3df24a0;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfff9d8f5a63fece1;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000005b;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        err = 1'b0;
        err = err | (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h30e9e030af4822c3);
        err = err | (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h15f7f9c9816408fb);
        err = err | (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000fed37457);
        err = err | (dut.main_mem.mem[`Y_ADDR+0] != 64'h820452c97c29ca82);
        err = err | (dut.main_mem.mem[`Y_ADDR+1] != 64'h5e06eb421cec13b6);
        err = err | (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000f660affd);
        if (err) begin
            $display("Vector 14: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 14: Keygen output correct.");
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        err = 1'b0;
        err = err | (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000156);
        err = err | (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h96a2eb1c01f02ab7);
        err = err | (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0e39f1a747b961df);
        err = err | (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h12981d8403993695);
        err = err | (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd0c0ecd812794114);
        err = err | (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf9ccd16260619195);
        err = err | (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5887053b5b2528df);
        err = err | (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha46cbd3058cfda9d);
        err = err | (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h762fff6052a0e627);
        err = err | (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc69c55b0edf87765);
        err = err | (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h558609d8820a52a9);
        err = err | (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h458a94267dd648f7);
        err = err | (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5288a346fdd85da0);
        if (err) begin
            $display("Vector 14: Sign failed!");
            $finish;
        end else begin
            $display("Vector 14: Sign output correct.");
        end

        clean_root_seed_pairs_from_main_mem();
        clear_seed_eq_mem_to_x();
        dut.enc_prg_wrapper_inst.salt_reg = 'x;
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Verify:");
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        err = 1'b0;
        err = err | (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf9ccd16260619195);
        err = err | (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5887053b5b2528df);
        err = err | (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha46cbd3058cfda9d);
        err = err | (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h762fff6052a0e627);
        if (bad_sig) begin
            $display("Vector 14: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 14: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 14: Verifier accepts signature.");
        end
        
        @(negedge clk);
        
        $finish;
    end
    
endmodule
