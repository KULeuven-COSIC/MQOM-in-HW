/*
 * This Python-generated testbench runs 100 deterministic KeyGen, Sign, and
 * Verify test vectors, checking the results and measuring execution cycles.
 *
 * Golden reference outputs are derived from the MQOM v2.1 software
 * implementation.
 *
 * File not meant to be edited manually.
 *
 */

`timescale 1ns/1ps

`include "mqom2_main_header.vh"

module tb_mqom_keygen_sign_verify_multiple_det;

    // Testbench signals
    reg        rst        = 1'b0;
    reg        clk        = 1'b0;
    reg [1:0]  start_comm = 2'b00;

    wire       done;
    wire       bad_sig;

    reg        err;
    localparam integer CLK_PERIOD = 10;
    time       start_time;
    time       end_time;
    integer    sign_sum;
    integer    median_sum;
    integer    sorted_count;
    integer    sorted_sign [0:99];
    integer    keygen_cycles_0;
    integer    sign_cycles_0;
    integer    verify_cycles_0;
    integer    keygen_cycles_1;
    integer    sign_cycles_1;
    integer    verify_cycles_1;
    integer    keygen_cycles_2;
    integer    sign_cycles_2;
    integer    verify_cycles_2;
    integer    keygen_cycles_3;
    integer    sign_cycles_3;
    integer    verify_cycles_3;
    integer    keygen_cycles_4;
    integer    sign_cycles_4;
    integer    verify_cycles_4;
    integer    keygen_cycles_5;
    integer    sign_cycles_5;
    integer    verify_cycles_5;
    integer    keygen_cycles_6;
    integer    sign_cycles_6;
    integer    verify_cycles_6;
    integer    keygen_cycles_7;
    integer    sign_cycles_7;
    integer    verify_cycles_7;
    integer    keygen_cycles_8;
    integer    sign_cycles_8;
    integer    verify_cycles_8;
    integer    keygen_cycles_9;
    integer    sign_cycles_9;
    integer    verify_cycles_9;
    integer    keygen_cycles_10;
    integer    sign_cycles_10;
    integer    verify_cycles_10;
    integer    keygen_cycles_11;
    integer    sign_cycles_11;
    integer    verify_cycles_11;
    integer    keygen_cycles_12;
    integer    sign_cycles_12;
    integer    verify_cycles_12;
    integer    keygen_cycles_13;
    integer    sign_cycles_13;
    integer    verify_cycles_13;
    integer    keygen_cycles_14;
    integer    sign_cycles_14;
    integer    verify_cycles_14;
    integer    keygen_cycles_15;
    integer    sign_cycles_15;
    integer    verify_cycles_15;
    integer    keygen_cycles_16;
    integer    sign_cycles_16;
    integer    verify_cycles_16;
    integer    keygen_cycles_17;
    integer    sign_cycles_17;
    integer    verify_cycles_17;
    integer    keygen_cycles_18;
    integer    sign_cycles_18;
    integer    verify_cycles_18;
    integer    keygen_cycles_19;
    integer    sign_cycles_19;
    integer    verify_cycles_19;
    integer    keygen_cycles_20;
    integer    sign_cycles_20;
    integer    verify_cycles_20;
    integer    keygen_cycles_21;
    integer    sign_cycles_21;
    integer    verify_cycles_21;
    integer    keygen_cycles_22;
    integer    sign_cycles_22;
    integer    verify_cycles_22;
    integer    keygen_cycles_23;
    integer    sign_cycles_23;
    integer    verify_cycles_23;
    integer    keygen_cycles_24;
    integer    sign_cycles_24;
    integer    verify_cycles_24;
    integer    keygen_cycles_25;
    integer    sign_cycles_25;
    integer    verify_cycles_25;
    integer    keygen_cycles_26;
    integer    sign_cycles_26;
    integer    verify_cycles_26;
    integer    keygen_cycles_27;
    integer    sign_cycles_27;
    integer    verify_cycles_27;
    integer    keygen_cycles_28;
    integer    sign_cycles_28;
    integer    verify_cycles_28;
    integer    keygen_cycles_29;
    integer    sign_cycles_29;
    integer    verify_cycles_29;
    integer    keygen_cycles_30;
    integer    sign_cycles_30;
    integer    verify_cycles_30;
    integer    keygen_cycles_31;
    integer    sign_cycles_31;
    integer    verify_cycles_31;
    integer    keygen_cycles_32;
    integer    sign_cycles_32;
    integer    verify_cycles_32;
    integer    keygen_cycles_33;
    integer    sign_cycles_33;
    integer    verify_cycles_33;
    integer    keygen_cycles_34;
    integer    sign_cycles_34;
    integer    verify_cycles_34;
    integer    keygen_cycles_35;
    integer    sign_cycles_35;
    integer    verify_cycles_35;
    integer    keygen_cycles_36;
    integer    sign_cycles_36;
    integer    verify_cycles_36;
    integer    keygen_cycles_37;
    integer    sign_cycles_37;
    integer    verify_cycles_37;
    integer    keygen_cycles_38;
    integer    sign_cycles_38;
    integer    verify_cycles_38;
    integer    keygen_cycles_39;
    integer    sign_cycles_39;
    integer    verify_cycles_39;
    integer    keygen_cycles_40;
    integer    sign_cycles_40;
    integer    verify_cycles_40;
    integer    keygen_cycles_41;
    integer    sign_cycles_41;
    integer    verify_cycles_41;
    integer    keygen_cycles_42;
    integer    sign_cycles_42;
    integer    verify_cycles_42;
    integer    keygen_cycles_43;
    integer    sign_cycles_43;
    integer    verify_cycles_43;
    integer    keygen_cycles_44;
    integer    sign_cycles_44;
    integer    verify_cycles_44;
    integer    keygen_cycles_45;
    integer    sign_cycles_45;
    integer    verify_cycles_45;
    integer    keygen_cycles_46;
    integer    sign_cycles_46;
    integer    verify_cycles_46;
    integer    keygen_cycles_47;
    integer    sign_cycles_47;
    integer    verify_cycles_47;
    integer    keygen_cycles_48;
    integer    sign_cycles_48;
    integer    verify_cycles_48;
    integer    keygen_cycles_49;
    integer    sign_cycles_49;
    integer    verify_cycles_49;
    integer    keygen_cycles_50;
    integer    sign_cycles_50;
    integer    verify_cycles_50;
    integer    keygen_cycles_51;
    integer    sign_cycles_51;
    integer    verify_cycles_51;
    integer    keygen_cycles_52;
    integer    sign_cycles_52;
    integer    verify_cycles_52;
    integer    keygen_cycles_53;
    integer    sign_cycles_53;
    integer    verify_cycles_53;
    integer    keygen_cycles_54;
    integer    sign_cycles_54;
    integer    verify_cycles_54;
    integer    keygen_cycles_55;
    integer    sign_cycles_55;
    integer    verify_cycles_55;
    integer    keygen_cycles_56;
    integer    sign_cycles_56;
    integer    verify_cycles_56;
    integer    keygen_cycles_57;
    integer    sign_cycles_57;
    integer    verify_cycles_57;
    integer    keygen_cycles_58;
    integer    sign_cycles_58;
    integer    verify_cycles_58;
    integer    keygen_cycles_59;
    integer    sign_cycles_59;
    integer    verify_cycles_59;
    integer    keygen_cycles_60;
    integer    sign_cycles_60;
    integer    verify_cycles_60;
    integer    keygen_cycles_61;
    integer    sign_cycles_61;
    integer    verify_cycles_61;
    integer    keygen_cycles_62;
    integer    sign_cycles_62;
    integer    verify_cycles_62;
    integer    keygen_cycles_63;
    integer    sign_cycles_63;
    integer    verify_cycles_63;
    integer    keygen_cycles_64;
    integer    sign_cycles_64;
    integer    verify_cycles_64;
    integer    keygen_cycles_65;
    integer    sign_cycles_65;
    integer    verify_cycles_65;
    integer    keygen_cycles_66;
    integer    sign_cycles_66;
    integer    verify_cycles_66;
    integer    keygen_cycles_67;
    integer    sign_cycles_67;
    integer    verify_cycles_67;
    integer    keygen_cycles_68;
    integer    sign_cycles_68;
    integer    verify_cycles_68;
    integer    keygen_cycles_69;
    integer    sign_cycles_69;
    integer    verify_cycles_69;
    integer    keygen_cycles_70;
    integer    sign_cycles_70;
    integer    verify_cycles_70;
    integer    keygen_cycles_71;
    integer    sign_cycles_71;
    integer    verify_cycles_71;
    integer    keygen_cycles_72;
    integer    sign_cycles_72;
    integer    verify_cycles_72;
    integer    keygen_cycles_73;
    integer    sign_cycles_73;
    integer    verify_cycles_73;
    integer    keygen_cycles_74;
    integer    sign_cycles_74;
    integer    verify_cycles_74;
    integer    keygen_cycles_75;
    integer    sign_cycles_75;
    integer    verify_cycles_75;
    integer    keygen_cycles_76;
    integer    sign_cycles_76;
    integer    verify_cycles_76;
    integer    keygen_cycles_77;
    integer    sign_cycles_77;
    integer    verify_cycles_77;
    integer    keygen_cycles_78;
    integer    sign_cycles_78;
    integer    verify_cycles_78;
    integer    keygen_cycles_79;
    integer    sign_cycles_79;
    integer    verify_cycles_79;
    integer    keygen_cycles_80;
    integer    sign_cycles_80;
    integer    verify_cycles_80;
    integer    keygen_cycles_81;
    integer    sign_cycles_81;
    integer    verify_cycles_81;
    integer    keygen_cycles_82;
    integer    sign_cycles_82;
    integer    verify_cycles_82;
    integer    keygen_cycles_83;
    integer    sign_cycles_83;
    integer    verify_cycles_83;
    integer    keygen_cycles_84;
    integer    sign_cycles_84;
    integer    verify_cycles_84;
    integer    keygen_cycles_85;
    integer    sign_cycles_85;
    integer    verify_cycles_85;
    integer    keygen_cycles_86;
    integer    sign_cycles_86;
    integer    verify_cycles_86;
    integer    keygen_cycles_87;
    integer    sign_cycles_87;
    integer    verify_cycles_87;
    integer    keygen_cycles_88;
    integer    sign_cycles_88;
    integer    verify_cycles_88;
    integer    keygen_cycles_89;
    integer    sign_cycles_89;
    integer    verify_cycles_89;
    integer    keygen_cycles_90;
    integer    sign_cycles_90;
    integer    verify_cycles_90;
    integer    keygen_cycles_91;
    integer    sign_cycles_91;
    integer    verify_cycles_91;
    integer    keygen_cycles_92;
    integer    sign_cycles_92;
    integer    verify_cycles_92;
    integer    keygen_cycles_93;
    integer    sign_cycles_93;
    integer    verify_cycles_93;
    integer    keygen_cycles_94;
    integer    sign_cycles_94;
    integer    verify_cycles_94;
    integer    keygen_cycles_95;
    integer    sign_cycles_95;
    integer    verify_cycles_95;
    integer    keygen_cycles_96;
    integer    sign_cycles_96;
    integer    verify_cycles_96;
    integer    keygen_cycles_97;
    integer    sign_cycles_97;
    integer    verify_cycles_97;
    integer    keygen_cycles_98;
    integer    sign_cycles_98;
    integer    verify_cycles_98;
    integer    keygen_cycles_99;
    integer    sign_cycles_99;
    integer    verify_cycles_99;

    // DUT instantiation
    mqom_wrapper dut (
        .rst        (rst),
        .clk        (clk),
        .start_comm (start_comm),
        .done       (done),
        .bad_sig    (bad_sig)
    );

    task clear_seed_eq_mem_to_x;
        integer j;
        begin
            for (j = `SEED_EQ_0_ADDR; j < (`SEED_EQ_0_ADDR+`SEEDS_EQ_WORDS_TOTAL); j = j + 1)
                dut.main_mem.mem[j] = 'x;
        end
    endtask

    task clean_root_seed_pairs_from_main_mem;
        integer j;
        begin
            for (j = `ROOT_SEED_PAIR_0_ADDR; j < (`ROOT_SEED_PAIR_0_ADDR+`ROOT_SEED_PAIRS_WORDS); j = j + 1)
                dut.main_mem.mem[j] = 'x;
        end
    endtask

    task insert_sign_cycle;
        input integer value;
        integer pos;
        begin
            pos = sorted_count;
            while ((pos > 0) && (sorted_sign[pos-1] > value)) begin
                sorted_sign[pos] = sorted_sign[pos-1];
                pos = pos - 1;
            end
            sorted_sign[pos] = value;
            sorted_count = sorted_count + 1;
        end
    endtask

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        rst        = 1'b0;
        start_comm = 2'b0;
        sorted_count = 0;
        $display("Running generated MQOM keygen/sign/verify testbench with 100 vectors");

        // ---------------- Vector 0 ----------------
        $display("");
        $display("========== Vector 0 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'haa9476b0a035997c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hdd1a6bdbe4106d0c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h0348b1cc251ad82f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2d7f73369973cd2d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h081451d479ed2686;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h21f856b9593be000;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc8f2bca24db2b3ef;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1b1c5aef8015ff43;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfbcb4f738d4d1cd8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'haa9f038a3f3ddeea;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h55ad35e857992c2a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6a55bb57bf752eb2;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c8;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_0 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h03e28e8bec63a035);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h6674f2a57177a2fb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h2e02b3d5baa0eaa4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000056931e80);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7953a9eefa30a9a5);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hcb1c4cb317bbd048);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h12bc8a2290595e38);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e20888a8);
        if (err) begin
            $display("Vector 0: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 0: Keygen output correct. cycles=%0d", keygen_cycles_0);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_0 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_0);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000139);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6c96c0888d320712);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he156cf036c980574);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h482f5b3ca6492ed0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3e2774860d071634);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf2a0f220b655498c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4e49d66f8e75cbc8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h55fc2ba0c0efe2c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h51da11869c0fe4d4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha2aab7f8d3dbec7c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h16b6a7cdcc5581bc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h97856f8ee7abe129);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h44c4bd4a16a2c564);
        if (err) begin
            $display("Vector 0: Sign failed!");
            $finish;
        end else begin
            $display("Vector 0: Sign output correct. cycles=%0d", sign_cycles_0);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_0 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf2a0f220b655498c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4e49d66f8e75cbc8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h55fc2ba0c0efe2c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h51da11869c0fe4d4);
        if (bad_sig) begin
            $display("Vector 0: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 0: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 0: Verifier accepts signature. cycles=%0d", verify_cycles_0);
        end

        // ---------------- Vector 1 ----------------
        $display("");
        $display("========== Vector 1 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0a7ad3e1a6066e1d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb33bb26d479b3496;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h875717f28e01f52b;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h146a95a2112d5d29;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb7176bb95bf7d94d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd0c7c80a92fededc;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9884f46ffff9e6a8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8b1f1b60988696ac;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h34d692fe52c00584;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h59a7a718b572f78e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8f812adabee4d6ca;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfaf099b50fa78e0f;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000006f;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_1 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd0ae2769e6dff8bb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb068418726a6930b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h2b8f3a7ad2bb9157);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b894869e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha4e91ae647224ea7);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9bd37677f7dd7ff0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h8621e44bba509a14);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000050a03326);
        if (err) begin
            $display("Vector 1: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 1: Keygen output correct. cycles=%0d", keygen_cycles_1);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_1 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_1);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000001e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h8f4622dffce97edf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2465982b2bfc1fd1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'heeb71f80bf141534);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf614156a66260cc9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7764400cab679abb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6536db76c7244aff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd6277544a88a5acf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7f3a385d6c0583f1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha1f765436ebdeeef);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf20ecc2b6be7645a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9f681f393e0de4e1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5f36568dbfc0bb7e);
        if (err) begin
            $display("Vector 1: Sign failed!");
            $finish;
        end else begin
            $display("Vector 1: Sign output correct. cycles=%0d", sign_cycles_1);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_1 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7764400cab679abb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6536db76c7244aff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd6277544a88a5acf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7f3a385d6c0583f1);
        if (bad_sig) begin
            $display("Vector 1: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 1: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 1: Verifier accepts signature. cycles=%0d", verify_cycles_1);
        end

        // ---------------- Vector 2 ----------------
        $display("");
        $display("========== Vector 2 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb723c8c983182123;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h003df062745f2770;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'haf80ae433b0e7e81;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4d777a7932906abb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h94b7d9a39ab58569;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd78a510fdf4fca91;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h98cff61f21af9d72;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hdca9e1cf841d343c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfbf72ddb77e009ed;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9e3668603001d0fd;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb7e2f363606683c1;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h5511a5bbde393f57;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f3;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_2 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hdea9ba516279fee7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hce121c38f065c41a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd6f2508cb040fdfc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000028d41df4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h67927bd66ced24a5);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5f103aad23da3ffd);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd6707b247cfbdec2);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000d8f5bd65);
        if (err) begin
            $display("Vector 2: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 2: Keygen output correct. cycles=%0d", keygen_cycles_2);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_2 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_2);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000003e7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4db57ebf33f413ea);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3d82de53ba9fe7e9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8f93dbd173176e67);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hbb607041bf38576f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h63f2cea7b9dec1ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6ce037fd33de8f98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8dd85816a333b2f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf0bc46affc976ba0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h11dcfffea29e9385);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h685c2fb14465bc20);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc8ea6eee2a202345);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6d11b5cde0edfbbf);
        if (err) begin
            $display("Vector 2: Sign failed!");
            $finish;
        end else begin
            $display("Vector 2: Sign output correct. cycles=%0d", sign_cycles_2);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_2 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h63f2cea7b9dec1ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6ce037fd33de8f98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8dd85816a333b2f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf0bc46affc976ba0);
        if (bad_sig) begin
            $display("Vector 2: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 2: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 2: Verifier accepts signature. cycles=%0d", verify_cycles_2);
        end

        // ---------------- Vector 3 ----------------
        $display("");
        $display("========== Vector 3 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0525ce1741be66f4;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7c64a811a1f721bb;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4ec98760eff75165;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h982e1f84ef6f9dd5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7e45d0eab08ee0da;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h03deefefaed4369a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h52c80bf179317856;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h78da1b96a893492f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hbad55996fafd877c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h4fefc6d9bc0ba4fc;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3a31eba585d81d59;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h206c5ee14252716f;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000018;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_3 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd69196b2e56a9fac);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb5ff0806b0ead8f6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hde43f0c51de383f1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000005364f1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hadb85ccff5c4fd36);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf8d2108aa023510a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h10f20c2a6212c44f);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000169a77da);
        if (err) begin
            $display("Vector 3: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 3: Keygen output correct. cycles=%0d", keygen_cycles_3);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_3 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_3);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000044e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h33f82fafa2be407e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hee64a44388a398de);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h99dda85edb3e3258);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7ef9651ac1960386);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd6321f1d03e4b946);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdcc57d0fd78be674);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9b7167201616a227);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2b9d76c52eaa1ef6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha0e93ef569e19081);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h766431cf0e1d3d69);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4c17fb1b7d05f35f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hda023f3ffc617a23);
        if (err) begin
            $display("Vector 3: Sign failed!");
            $finish;
        end else begin
            $display("Vector 3: Sign output correct. cycles=%0d", sign_cycles_3);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_3 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd6321f1d03e4b946);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdcc57d0fd78be674);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9b7167201616a227);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2b9d76c52eaa1ef6);
        if (bad_sig) begin
            $display("Vector 3: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 3: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 3: Verifier accepts signature. cycles=%0d", verify_cycles_3);
        end

        // ---------------- Vector 4 ----------------
        $display("");
        $display("========== Vector 4 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h151dc60063393232;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h38e1f9c819a2e919;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h6c4e6a40b68074e5;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd99edf20f4828821;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h89e94735dc5ba64c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3cdef0653189bd4d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h45ccc194ec948bcd;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd9663435973715ec;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0203d8d438e05b10;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h062ba66e61a3a68e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2d9f9bd57180844f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hafb1028f99498d07;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000064;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_4 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2583b7cdd69e5065);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8d6096cd03002113);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1b45e049cd7d9ab2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000000a683366);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'heff4a80fdf0c1050);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hee29ea1308be7fe0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h8e2491750638dc88);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000091359402);
        if (err) begin
            $display("Vector 4: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 4: Keygen output correct. cycles=%0d", keygen_cycles_4);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_4 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_4);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000098);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2197c8ac2f5f800a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc6a31710880bbecc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h40a5da79aaa2348c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h24690aedc032a6fa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc4997d0b03ddca31);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8c5a5707aa73144a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h92c9423ce6bd1065);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h67d977a51de25bb0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h52613c19dd7a8e3f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3e183c4eec9e0748);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h11b65a8b03ef5695);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h58f7650bc3d3fecc);
        if (err) begin
            $display("Vector 4: Sign failed!");
            $finish;
        end else begin
            $display("Vector 4: Sign output correct. cycles=%0d", sign_cycles_4);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_4 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc4997d0b03ddca31);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8c5a5707aa73144a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h92c9423ce6bd1065);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h67d977a51de25bb0);
        if (bad_sig) begin
            $display("Vector 4: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 4: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 4: Verifier accepts signature. cycles=%0d", verify_cycles_4);
        end

        // ---------------- Vector 5 ----------------
        $display("");
        $display("========== Vector 5 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf0d970edfe9902ea;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h6ed87822c24d8a8f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5a9c203069e63f15;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h55ce4766c914d062;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4307ee053af1fd54;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9fc84a2817064960;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h49be14ae96ecc857;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h54b63802c83dd333;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h575cea167a4ac5a9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h646f053846629778;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h526846a5d5a505fc;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h21bfae472e81c837;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000bd;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_5 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he1c760cb61e32b50);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1cd3752e99e6ed0d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd248274d021b0c0a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ab85355b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7dd13be3616d18ea);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf2e3e1f995a27110);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hf090255ad964d2df);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000006e9676d1);
        if (err) begin
            $display("Vector 5: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 5: Keygen output correct. cycles=%0d", keygen_cycles_5);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_5 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_5);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000010f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0598e8b4fc308f04);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h69a2dd62172d069c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h79247866be4d5ceb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h08d2675de5c97d88);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha1abd30c213966b7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h91e03827555102bc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbac96e3b32572ac7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0408c78957b74f57);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h95331014eae6d76f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h65f5edf560ab8d42);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he172d30d8712647c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h3d28ec09425fe310);
        if (err) begin
            $display("Vector 5: Sign failed!");
            $finish;
        end else begin
            $display("Vector 5: Sign output correct. cycles=%0d", sign_cycles_5);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_5 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha1abd30c213966b7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h91e03827555102bc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbac96e3b32572ac7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0408c78957b74f57);
        if (bad_sig) begin
            $display("Vector 5: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 5: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 5: Verifier accepts signature. cycles=%0d", verify_cycles_5);
        end

        // ---------------- Vector 6 ----------------
        $display("");
        $display("========== Vector 6 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6a29211037e6470f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hff0fa05d1944a789;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha6f626f25ac1779a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7b5df95ccb3d9628;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h192a057e70fb03be;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h5882de6f01909975;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9d7cb02a4455e6af;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h27e7ea1665f5d800;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h92add87e541be3ce;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h386f058c40f49e59;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h75dcc5f054272594;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h92090b3739300316;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000b3;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_6 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf84fd5999f96a17e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1fa2c8f697ca8c96);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd908ee1b42360cb8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fb5f0908);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hac7e52117568941a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h7e85f3544d1d1359);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hce59b1712dce58d9);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000007ae279d0);
        if (err) begin
            $display("Vector 6: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 6: Keygen output correct. cycles=%0d", keygen_cycles_6);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_6 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_6);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000cb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hde1a611f8baf53f6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h833024673d1232c5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8709d36008058ee1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h59376c457cdc49aa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h507a0d1216439fca);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb212fb1311b98c69);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h59f8ea54505a9679);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcaf4c2f24f388a5c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4e4be405c32d837d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6045d8c2c7ef7b90);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc3624969383c23b0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h867e8c75c0f5a8b8);
        if (err) begin
            $display("Vector 6: Sign failed!");
            $finish;
        end else begin
            $display("Vector 6: Sign output correct. cycles=%0d", sign_cycles_6);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_6 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h507a0d1216439fca);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb212fb1311b98c69);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h59f8ea54505a9679);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcaf4c2f24f388a5c);
        if (bad_sig) begin
            $display("Vector 6: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 6: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 6: Verifier accepts signature. cycles=%0d", verify_cycles_6);
        end

        // ---------------- Vector 7 ----------------
        $display("");
        $display("========== Vector 7 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdd09bbbeabf88d50;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3b5dc70c5e2546bf;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hbc1fb9992704f575;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h64005b7dc2ce86b8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc9eaeab7acc00d5f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h52d98ea7a00a1daf;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h815b8eeb1ff38b1d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h52f1fed7db2b858a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he03db65299ec104e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h49832b25975aa91e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd3b48d7de448b4d4;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcd7dc883ff94a57d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000009f;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_7 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he8e5e43a5acbc677);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h826ae1858fb30afb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd69165129a12b849);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000009043c18e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2ef9e82e6fd3cc0b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h346b7b9f7ea927d0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h2d023023b30741d9);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000008d864cc2);
        if (err) begin
            $display("Vector 7: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 7: Keygen output correct. cycles=%0d", keygen_cycles_7);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_7 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_7);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000044b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7d0b988da4772733);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha51839e2d23ef7f5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hef7c2091fa73d461);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h59ff988c390d366d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7ac321ad50f4921e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7a5ac84448224962);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7ed664ccf129e14c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'heed491c78fe31731);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha2ecba1eb24d5b1c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h19a0e66fb8b7c9b7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8275683ceba78f6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha0a98f0554938b92);
        if (err) begin
            $display("Vector 7: Sign failed!");
            $finish;
        end else begin
            $display("Vector 7: Sign output correct. cycles=%0d", sign_cycles_7);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_7 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7ac321ad50f4921e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7a5ac84448224962);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7ed664ccf129e14c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'heed491c78fe31731);
        if (bad_sig) begin
            $display("Vector 7: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 7: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 7: Verifier accepts signature. cycles=%0d", verify_cycles_7);
        end

        // ---------------- Vector 8 ----------------
        $display("");
        $display("========== Vector 8 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hfabdcd3f23e35bef;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha440c9aadf09b150;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1832c62823de7055;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7d82e7eef6379e06;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hced62e03774a8e82;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hcc98ec6f3dfbaa72;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h330608e86282bba6;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hce91e6fd4be03347;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0fad2d0bde19ad89;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8955d92f8f5939c6;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha6290ab8632fe433;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h5f8ba24bd4c807b3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000009;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_8 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h38531f6a75ee54f2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h163df2fbc14008ed);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha9a9817829df8bbe);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000081120c1b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hcc856d3125ac3aaa);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3ee86e35418812b1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h2f195983ea68b66b);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000c968e8d4);
        if (err) begin
            $display("Vector 8: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 8: Keygen output correct. cycles=%0d", keygen_cycles_8);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_8 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_8);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000190);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6a27f2d7a5795329);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h086b51570708a591);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h614e11959b8379bd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h8e6f72db9ebbf27e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0983a8f7a3530993);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4b5b138ccd1e949e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1b24611f6b8938e7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc7fa6f6f78b6ff9f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h25be4ee3b89ea152);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h7e77f2b3d1c2b23c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf33513e9205d1a1c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h91ce826e6576d463);
        if (err) begin
            $display("Vector 8: Sign failed!");
            $finish;
        end else begin
            $display("Vector 8: Sign output correct. cycles=%0d", sign_cycles_8);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_8 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0983a8f7a3530993);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4b5b138ccd1e949e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1b24611f6b8938e7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc7fa6f6f78b6ff9f);
        if (bad_sig) begin
            $display("Vector 8: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 8: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 8: Verifier accepts signature. cycles=%0d", verify_cycles_8);
        end

        // ---------------- Vector 9 ----------------
        $display("");
        $display("========== Vector 9 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h957d839cda7de4e1;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd24c451d766b998a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf2a00335dfe57944;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc863e0475abf24e5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h0fd499749a85c14b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc2da01c17984ce62;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h35cdbcf9ee7e93c1;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hbdb25ac223e314e5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hdaa7930a1a88615c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h0448220cb454ef7a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he515a0aa1de4bd3e;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb73a30dcd7219251;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ca;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_9 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5a6c9da2cd1dd772);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2699c77cbb5f44bc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h5c1c62b13f9e7731);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000af7855ab);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he79fd31baff45207);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hfbfa5d4462f395b9);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h403cacd990805145);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000008316e466);
        if (err) begin
            $display("Vector 9: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 9: Keygen output correct. cycles=%0d", keygen_cycles_9);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_9 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_9);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000006db);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7d2f1f8f3b6512da);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hed5efe05b2577f5e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9d96e53f8df4230d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3d874ec564cd9db4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h35a8f6225f7400d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h56dc1d9e1ec6f307);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd4de50ec3a778636);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb6103cc9266d48c3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc87a85eb68158cce);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h72b35e00060ee72f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbb463fd5d03b9c6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h53ffdc54e8853b35);
        if (err) begin
            $display("Vector 9: Sign failed!");
            $finish;
        end else begin
            $display("Vector 9: Sign output correct. cycles=%0d", sign_cycles_9);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_9 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h35a8f6225f7400d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h56dc1d9e1ec6f307);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd4de50ec3a778636);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb6103cc9266d48c3);
        if (bad_sig) begin
            $display("Vector 9: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 9: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 9: Verifier accepts signature. cycles=%0d", verify_cycles_9);
        end

        // ---------------- Vector 10 ----------------
        $display("");
        $display("========== Vector 10 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf30be206dcdb600b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd8a0332667ef5c4b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hbc80982caeae06e4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb9c0f878a3e6b1a9;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha62d62d77c4b93f4;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hfd03e5b9dbe07987;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0f2e05fde81ec2af;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h149156177f53db17;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hc0d69d71ff2febeb;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdff62bb89b9237c5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hdc7b0c8428fc7a75;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h929a656e374b3083;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000008b;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_10 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc5203eaa0b3a0b3b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h218380bbe450ebf6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h98178df6870a0b87);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b62ddffc);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h087ce14590058ba3);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3ad67d7bbeb11d81);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h8f2e540741b8a4ec);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005bd4e805);
        if (err) begin
            $display("Vector 10: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 10: Keygen output correct. cycles=%0d", keygen_cycles_10);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_10 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_10);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3e3247844042b154);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h005a3b5139d940fc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h61130391dd315189);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3db2e26b32d797f8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hac0740cfa04acfcc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc6870338b91182bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd0f6c7e64aab5f41);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcdbfd12a361dc3a5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h724f8df1ecd4362e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h835893e71b601842);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'haf0bf2c66130c51a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2fea9bed322140bc);
        if (err) begin
            $display("Vector 10: Sign failed!");
            $finish;
        end else begin
            $display("Vector 10: Sign output correct. cycles=%0d", sign_cycles_10);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_10 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hac0740cfa04acfcc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc6870338b91182bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd0f6c7e64aab5f41);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcdbfd12a361dc3a5);
        if (bad_sig) begin
            $display("Vector 10: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 10: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 10: Verifier accepts signature. cycles=%0d", verify_cycles_10);
        end

        // ---------------- Vector 11 ----------------
        $display("");
        $display("========== Vector 11 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h90ec3958c9f44c56;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hac97dfa87beb5a7b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4b11584fba463679;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc84771e2f629b742;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h19d24dd4d3773430;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha24de83d6b8f4027;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h93aca9ee819001f9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h08b4bfd3eae5c6fd;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h52a7cdd65a9c53ad;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdf08881aee2e8e99;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3709b12d7020b80d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfe29b5ca976d352d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000006f;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_11 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hadc14cac6516e712);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf79dffe039d2ca5b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h4d60a9f68ebcb978);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001afc7efe);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hed2599305781a91a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3a33cad78ff0bd7e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5bc8334d53ecd5bd);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000f51944b8);
        if (err) begin
            $display("Vector 11: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 11: Keygen output correct. cycles=%0d", keygen_cycles_11);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_11 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_11);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000022);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1a1c5f60dff26809);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h23d6757fc61d6571);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hedc7b58f806a82d2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h8295416469a3fdd9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h95552d68c4298cdf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h89cf0c2fe942b48e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h23fa21415ca1dbfb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8479d0f8aa86e5a7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8e1e60a46c91a377);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h60f7ba9153b7311d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h352c2baffafb477d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he8281ac218e69ded);
        if (err) begin
            $display("Vector 11: Sign failed!");
            $finish;
        end else begin
            $display("Vector 11: Sign output correct. cycles=%0d", sign_cycles_11);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_11 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h95552d68c4298cdf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h89cf0c2fe942b48e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h23fa21415ca1dbfb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8479d0f8aa86e5a7);
        if (bad_sig) begin
            $display("Vector 11: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 11: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 11: Verifier accepts signature. cycles=%0d", verify_cycles_11);
        end

        // ---------------- Vector 12 ----------------
        $display("");
        $display("========== Vector 12 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1727c1014e97cb5f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha955f234d1cb5910;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h161073f4341d041c;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0726f555515df30d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha9af09e788544347;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h7f57c5c3d3f99d72;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2dd215e7782b685f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6095a4ecc6200743;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb0e317ad6ec44db8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd3ce6a5eecc5e869;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h66f7e5b395d122b8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc9ebeebe902bdf23;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000009c;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_12 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hae39f99f0ab42c6b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5402f1285511de21);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf41913b1bac3ca51);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000008136455f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hea0b1caf32d3450f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h377e7031346b409f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h89367027a2df06d9);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000004d0e33fd);
        if (err) begin
            $display("Vector 12: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 12: Keygen output correct. cycles=%0d", keygen_cycles_12);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_12 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_12);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000239);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc93e06c1244a2617);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf373e6121faedec8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h623b9db8da2d8a7b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6918de55ee4d47ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0fa1bfc4b2db8026);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h02f1dcb745bb2b7c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h664e7972640ffae8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd4228b0b0832a5f6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcd2411bfb0524179);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he3b97863e5753460);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h52a5f1e86563b251);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1467d85fb2ed4678);
        if (err) begin
            $display("Vector 12: Sign failed!");
            $finish;
        end else begin
            $display("Vector 12: Sign output correct. cycles=%0d", sign_cycles_12);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_12 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0fa1bfc4b2db8026);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h02f1dcb745bb2b7c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h664e7972640ffae8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd4228b0b0832a5f6);
        if (bad_sig) begin
            $display("Vector 12: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 12: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 12: Verifier accepts signature. cycles=%0d", verify_cycles_12);
        end

        // ---------------- Vector 13 ----------------
        $display("");
        $display("========== Vector 13 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hecdb399d73501b1c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf7f1b277d536cc4f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8d0bc6c619eba33d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9bb8b4fbfc570a13;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hcc5a4b523220b1e9;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3c53a0f4f051c252;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd4157a98da5c738a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h725de65a995ed477;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfffe304cc40fdf63;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h4cbc3a0738288a0b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h34ad1ea45efbdd4b;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1c0e5ea5ce3f4f96;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c4;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_13 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2a8350aeca728b9d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h30ebedbe0424496b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd683953f0dd42e73);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e10f88b1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9b81056ff4b2f50e);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3b933c20ff4ba520);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hdec4825ff2d4376c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000098070a44);
        if (err) begin
            $display("Vector 13: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 13: Keygen output correct. cycles=%0d", keygen_cycles_13);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_13 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_13);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000d7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4c823a3e157fd397);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9b1565cb3df17642);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hb1d0e8d16ef14b39);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0599ef5a20cf15ba);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h664a1df7e3ca2cf8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2f68655bf0799ea7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd1d98f65db23b00a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h717b2e50f239ea40);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h05cd97740d2358b6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha514385b7443947b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h987e6b8cdbafb8e1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h46f7aa79d56db846);
        if (err) begin
            $display("Vector 13: Sign failed!");
            $finish;
        end else begin
            $display("Vector 13: Sign output correct. cycles=%0d", sign_cycles_13);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_13 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h664a1df7e3ca2cf8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2f68655bf0799ea7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd1d98f65db23b00a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h717b2e50f239ea40);
        if (bad_sig) begin
            $display("Vector 13: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 13: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 13: Verifier accepts signature. cycles=%0d", verify_cycles_13);
        end

        // ---------------- Vector 14 ----------------
        $display("");
        $display("========== Vector 14 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf889dde5f62bca29;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h97b8b0fba659945d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h44baefb9042eef90;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha8f610bce0036bf5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1ee1b005afc2592c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'heb4ea0c7a4e7cd44;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3e8147233ae1bd5d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h62f6226cf8539318;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h32f3a7e54c2bad89;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1449758a7c686402;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hff5b532a06329107;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbdc7c5a398498a52;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f7;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_14 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hed4b4c714b71c12e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h0fd1fcf3cfce3503);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h8494ba465555561f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000818fb94d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he6f98c84991fd127);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd2ef9104b301290a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h615b2db6fdbdb193);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000001b40a327);
        if (err) begin
            $display("Vector 14: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 14: Keygen output correct. cycles=%0d", keygen_cycles_14);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_14 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_14);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000007a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3f35ecaef7785db5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h48e1ae0952ea8a8c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8447b1e5a537ae2b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd574aa02fdba52e9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9ff52f9db579e381);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7a368dafb251a41a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h557ea591cd0c91e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hafbfae4385f48c36);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h64232ccd4343877e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3a00fa24e918d428);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hdbca15e81c6d1160);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5b883e2b7e6daa6e);
        if (err) begin
            $display("Vector 14: Sign failed!");
            $finish;
        end else begin
            $display("Vector 14: Sign output correct. cycles=%0d", sign_cycles_14);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_14 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9ff52f9db579e381);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7a368dafb251a41a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h557ea591cd0c91e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hafbfae4385f48c36);
        if (bad_sig) begin
            $display("Vector 14: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 14: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 14: Verifier accepts signature. cycles=%0d", verify_cycles_14);
        end

        // ---------------- Vector 15 ----------------
        $display("");
        $display("========== Vector 15 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h7a45f3a33b4f6719;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd27d29fe6333988b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h00c7f08758a7a605;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf898634b7ae818ec;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1ed5fdd8c4998980;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h31d848111c33b305;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd96902085dd52a13;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h69cf67135eff715a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2e5b63d8c94f5942;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h435aa3dcf2ceb252;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6ffbc0239ca8a925;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf849445b4a5c8a65;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000047;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_15 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf114b9eb5f66a8bd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h3d98e429157c852c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hfca261d165f2c1fa);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000039724328);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4308e58352d5607b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hac6a232a7f43b969);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hf7065208a9351a47);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000af41e69f);
        if (err) begin
            $display("Vector 15: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 15: Keygen output correct. cycles=%0d", keygen_cycles_15);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_15 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_15);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000083);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hcd167235fd8f8f1c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h06da4533eb52e248);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha3c2c50cd282ac90);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h47178163c2b6791b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1f271cff968165d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2724c131528b12c7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfe41dde4a45e273b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h339741e8696ec104);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h6baf677df86c8d2c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h83de01b4e6685d99);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he314b2532173cd52);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc3e03d159de40fa4);
        if (err) begin
            $display("Vector 15: Sign failed!");
            $finish;
        end else begin
            $display("Vector 15: Sign output correct. cycles=%0d", sign_cycles_15);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_15 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1f271cff968165d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2724c131528b12c7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfe41dde4a45e273b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h339741e8696ec104);
        if (bad_sig) begin
            $display("Vector 15: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 15: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 15: Verifier accepts signature. cycles=%0d", verify_cycles_15);
        end

        // ---------------- Vector 16 ----------------
        $display("");
        $display("========== Vector 16 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9eb715cbc4788a7c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h50594d17a42a02ea;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd2b177825c720438;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he3999ad5eab0d52e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7d8885151a6777d5;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hda037dcecbf458a5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h753a815e1c98e17d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hdbae91fb4f228e86;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h31fc012e7965d6a7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hff483ac8b99bc7d9;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h426e31c47eeff8cf;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc14a51bf9a86f95d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000fb;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_16 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5bb65090cb24bbaa);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hef99897f7b0a4d2f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h75ac6b97370e3457);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000003d3ec898);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h22b6e79ad93b28a6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3464bf94c6948d7f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he94ff0d2fb6b5caf);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000072bc54e9);
        if (err) begin
            $display("Vector 16: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 16: Keygen output correct. cycles=%0d", keygen_cycles_16);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_16 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_16);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7fe738e49646adf2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2d802a6191a06ca5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h50c0b5afbb6e8032);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6a53de8161eaf60f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he0e49af66d55db45);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3a416014bb4413f1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h48e0630b380c2e9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he5dc7be56870815d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h213d58c2dd5ca91c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h132326ca5c8a6e21);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h982b6a0a97f67c5e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8df953edd8db7076);
        if (err) begin
            $display("Vector 16: Sign failed!");
            $finish;
        end else begin
            $display("Vector 16: Sign output correct. cycles=%0d", sign_cycles_16);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_16 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he0e49af66d55db45);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3a416014bb4413f1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h48e0630b380c2e9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he5dc7be56870815d);
        if (bad_sig) begin
            $display("Vector 16: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 16: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 16: Verifier accepts signature. cycles=%0d", verify_cycles_16);
        end

        // ---------------- Vector 17 ----------------
        $display("");
        $display("========== Vector 17 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2a99a4944770ca49;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha88ba811d73dce69;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf5aaf020adbca06a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h139629a6113b0ce2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h11a131c2c09a0237;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2b158ab1c7502665;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h73d2a98c59c26251;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h509ef89372badfb2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he922005ab141d3bb;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc61f73c64e8baa70;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hafafffbd88f59013;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h27d7be3c6561f608;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c8;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_17 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h27a890355f0499b0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hffac7a3a36053287);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hc34dbf153b247544);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007a3a9299);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1a383e7e32200d81);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha1670dd5222fa5c5);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h59f7d19e7239256a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e365a254);
        if (err) begin
            $display("Vector 17: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 17: Keygen output correct. cycles=%0d", keygen_cycles_17);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_17 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_17);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000cf4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h04444001c2ada16d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9b5b363158d65bab);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h020aa6045e317bcd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h47525bf7b6bc217c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1748bb1a88e421d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h98dea6d7c009640d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hec2334ce2a82bcd5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3ee0b6733b8c53da);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf4162d841a15b518);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h8951a533c25deed6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h82040863439863db);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hdf1ba0a513345f7e);
        if (err) begin
            $display("Vector 17: Sign failed!");
            $finish;
        end else begin
            $display("Vector 17: Sign output correct. cycles=%0d", sign_cycles_17);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_17 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1748bb1a88e421d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h98dea6d7c009640d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hec2334ce2a82bcd5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3ee0b6733b8c53da);
        if (bad_sig) begin
            $display("Vector 17: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 17: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 17: Verifier accepts signature. cycles=%0d", verify_cycles_17);
        end

        // ---------------- Vector 18 ----------------
        $display("");
        $display("========== Vector 18 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8662250e7710a738;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8ef1e854e3837b89;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h52e7de1876c3c700;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb9b1947e92b83bf2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h45d4117deb146275;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc37049e4a0f2f531;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h55aead40f8fa3d9a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1498ac2c992740e0;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd3d60bcc8e7ee3c5;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7e935cf93cdc8651;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h43a0229622d6e4ae;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0182b173851db7f3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000071;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_18 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h518fb84b14d690f9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5cc69537ed5d689f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h4c1ecbbb798dfab9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000008630b5be);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6750f768d1f988c9);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h85fc6cae8dc9bd0b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hcb856351577f4b35);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000006d59a7d5);
        if (err) begin
            $display("Vector 18: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 18: Keygen output correct. cycles=%0d", keygen_cycles_18);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_18 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_18);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000649);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h8b8c45befb4df424);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h401ee7d0310d551a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h303e816717b22a05);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h8b1712aec48ce59a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h71641893f3b50c4b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf9f7eb1fc880239);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7021bb06bb1a01b5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h770881dac925e5dc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9acf3c2a5b17ea55);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4a278f401c23f57a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h26a555fc9dab53f6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf116022260752650);
        if (err) begin
            $display("Vector 18: Sign failed!");
            $finish;
        end else begin
            $display("Vector 18: Sign output correct. cycles=%0d", sign_cycles_18);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_18 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h71641893f3b50c4b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf9f7eb1fc880239);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7021bb06bb1a01b5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h770881dac925e5dc);
        if (bad_sig) begin
            $display("Vector 18: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 18: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 18: Verifier accepts signature. cycles=%0d", verify_cycles_18);
        end

        // ---------------- Vector 19 ----------------
        $display("");
        $display("========== Vector 19 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h30ae78748d5beded;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8ac9b9d30a0adb95;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h61ec7001296aa647;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6b4b2a7d5d9723d6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hecfac94e5419034c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf1c266e163d9280c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8754dfde56471505;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h070a50604511d791;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8f7d3902036610bf;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd4cd33c873bdb626;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2af5f9984a576515;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h490eaeb1d6520839;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000d;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_19 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hbca9be733952b03e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'heb32ce1decf23182);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h8dfbefc9bfaaaf61);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a00ac4b2);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha3fb1539f4e95b6e);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h076e140130b6f762);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbb19afdc2b031901);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000dcf81317);
        if (err) begin
            $display("Vector 19: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 19: Keygen output correct. cycles=%0d", keygen_cycles_19);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_19 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_19);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000092);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf59bce5a98b28a2e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h58072655056cb0f9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha281925c0e67ee90);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h675d8e66d7875040);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha24b4e095a7d6aa1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he99cb37d9b92d3ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha2ddd08d477145ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbc988f8bc421c8db);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4ef126d3260d901d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0686fb55b43e0356);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc1d815c5c08b685d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6ea68f708b823014);
        if (err) begin
            $display("Vector 19: Sign failed!");
            $finish;
        end else begin
            $display("Vector 19: Sign output correct. cycles=%0d", sign_cycles_19);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_19 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha24b4e095a7d6aa1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he99cb37d9b92d3ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha2ddd08d477145ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbc988f8bc421c8db);
        if (bad_sig) begin
            $display("Vector 19: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 19: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 19: Verifier accepts signature. cycles=%0d", verify_cycles_19);
        end

        // ---------------- Vector 20 ----------------
        $display("");
        $display("========== Vector 20 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h82c3481bc4fa6a9e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h55cdd3eca8bb8c85;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8a8dddd084b8d6ff;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7bba7d7440d3b452;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc25774d762221bab;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6c4de1269c5cf7e3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hde10f77696f3f28a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8f28c0afc5d1803c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hbe229799eaddccc3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hbe76dbbefc7b8fc1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h23760f6e08474c1f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h26d433ad510c05e6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000068;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_20 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc09b95200bb3a067);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5c401e150f34d424);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h12f143117fc484c7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000098e50c9c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h13d065da7ca92d81);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5fded034d5784ff2);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbe01c67905da23f3);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000d77c4925);
        if (err) begin
            $display("Vector 20: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 20: Keygen output correct. cycles=%0d", keygen_cycles_20);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_20 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_20);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000007cb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hafb562a2a66cc18f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd2d7e193f4e5a1b7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hff701624260e14cf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h2523017ee7d6641a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8ba4cdb183c535ac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5eb5c04f44c4a0f6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hce241931dd606392);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha238c8bcd1f0f7c0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8abe77a2eda75f40);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h38b5eb7b86062ebe);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'heb0bec5206841c06);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h99be05cbf1e1a410);
        if (err) begin
            $display("Vector 20: Sign failed!");
            $finish;
        end else begin
            $display("Vector 20: Sign output correct. cycles=%0d", sign_cycles_20);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_20 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8ba4cdb183c535ac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5eb5c04f44c4a0f6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hce241931dd606392);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha238c8bcd1f0f7c0);
        if (bad_sig) begin
            $display("Vector 20: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 20: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 20: Verifier accepts signature. cycles=%0d", verify_cycles_20);
        end

        // ---------------- Vector 21 ----------------
        $display("");
        $display("========== Vector 21 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hef3b82388b4ee816;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1f7b835a9bb1d243;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf9a954a79fbc3742;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7fb54b47f1fc8da6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h533e1465012230ad;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h31639645e33d419b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h85bf3c2295709303;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6929d335dcb8394e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h128eabea2547dd2e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h04cfbd9ef0af7512;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hcc1e009ae48b7ba2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb5cbf163057a57ac;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000008;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_21 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h196edfc5b19ea971);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7326cbb72b4930c2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf42c1433977c9f03);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f9e9f688);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb11abf38d7d2ea9f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h801e98c2d2a2de27);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h69b6f2446ab49b22);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000069d2ae33);
        if (err) begin
            $display("Vector 21: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 21: Keygen output correct. cycles=%0d", keygen_cycles_21);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_21 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_21);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000006a9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2d16dd982fc01611);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf43a9b1d6f75bce5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7060ed505de545f0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'heab96d5dc48d5983);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf23dcb0db7366fcc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc4028ba26831c8b1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h675f83323246dbdc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfa9e21109d34ece9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h750472a2c0134d56);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h22e64bcc3442e4f3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h559107505ecab775);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h078d253a920acb6b);
        if (err) begin
            $display("Vector 21: Sign failed!");
            $finish;
        end else begin
            $display("Vector 21: Sign output correct. cycles=%0d", sign_cycles_21);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_21 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf23dcb0db7366fcc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc4028ba26831c8b1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h675f83323246dbdc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfa9e21109d34ece9);
        if (bad_sig) begin
            $display("Vector 21: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 21: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 21: Verifier accepts signature. cycles=%0d", verify_cycles_21);
        end

        // ---------------- Vector 22 ----------------
        $display("");
        $display("========== Vector 22 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hcec2dc57e1fe7ee4;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hccda1a3e7ce9c346;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc7acb43297283ef0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0c0ffa54932e063f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7d55305c03c89a1d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2f85791a5b5c5c21;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6a4951b43b918094;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hee67121da38b6371;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7dd33846809e2573;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h32de4fab32e5941a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h5f64a6aaccd0076a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb9ee0f4a07a50fdc;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000000;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_22 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd377e3d0d239e6f0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc3cdabbfda27402f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf163fce37f029194);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fd8f459a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6fcc3275aebe795a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h6647671b1c8ff893);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h9a9d54a7db599902);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000058e6ee69);
        if (err) begin
            $display("Vector 22: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 22: Keygen output correct. cycles=%0d", keygen_cycles_22);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_22 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_22);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000019);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h39b38846bb05cc2c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he3ee3dbfc7bf4aaa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h67dfa00e43d37cbd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc97aa3fdfad8632b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5bd1fb497a4c2e83);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9356ca53783a3f7e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6e0f3442d20a7150);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3ad15dba617ac845);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1ffd80e6ede08b62);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h8b07fc88541d7d34);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf740bc5674e44ea1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6b68e3f42f1337c5);
        if (err) begin
            $display("Vector 22: Sign failed!");
            $finish;
        end else begin
            $display("Vector 22: Sign output correct. cycles=%0d", sign_cycles_22);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_22 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5bd1fb497a4c2e83);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9356ca53783a3f7e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6e0f3442d20a7150);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3ad15dba617ac845);
        if (bad_sig) begin
            $display("Vector 22: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 22: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 22: Verifier accepts signature. cycles=%0d", verify_cycles_22);
        end

        // ---------------- Vector 23 ----------------
        $display("");
        $display("========== Vector 23 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h20884623204ea819;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha4511921b854ad97;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h81ee2e3ef9d903e1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9f6ad1f53634e716;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7cbbf8c5772c4e50;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8c36d48a1b05f39b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h87734bd98e85e79b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h06e94f02a08684b1;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h90814e5cf5f15824;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h394e2e1e9d12e1a0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0787948881a0dca2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc932e49f99c76dd5;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c9;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_23 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hbef7cc28626da005);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7fbc89db721614ff);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hc8afa367dd2ee905);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007d95ccea);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0820d37b8e799c3b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h661cfad0fa045704);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd1b6f3d9f812d9fa);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000095f40fd3);
        if (err) begin
            $display("Vector 23: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 23: Keygen output correct. cycles=%0d", keygen_cycles_23);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_23 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_23);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000161);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h75dd41ac3bb6f8f2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h88e9236494b6df3a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h11b3a0f8732fe3d0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h8c55f1f65266a19b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h84dde99cedf8d1da);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h486562d3f31d5689);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h516969d073835aa7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2b694cadfd07ac82);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha5bde837dee912f7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h42a51ad246eed457);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he48da3ae9ffc8305);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4b7302e7748ff618);
        if (err) begin
            $display("Vector 23: Sign failed!");
            $finish;
        end else begin
            $display("Vector 23: Sign output correct. cycles=%0d", sign_cycles_23);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_23 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h84dde99cedf8d1da);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h486562d3f31d5689);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h516969d073835aa7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2b694cadfd07ac82);
        if (bad_sig) begin
            $display("Vector 23: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 23: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 23: Verifier accepts signature. cycles=%0d", verify_cycles_23);
        end

        // ---------------- Vector 24 ----------------
        $display("");
        $display("========== Vector 24 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h97d40247a9511197;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h02af7096fae54f56;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd89ddf6591cf7936;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8b2c9ba64354012e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha3500ab14428dcc3;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hdd4305cf5f2c421f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h11d6f21712b58a62;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7ca1ac0b9b9bf470;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h56130312850ded20;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha55c783b6eb4a54b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hcf25ed5f0f815b4e;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h21f1a8e60dae6c8b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000059;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_24 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1428f353f946bdbf);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha6c320df0f591791);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1b091c28dc54d194);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000117717dd);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h76dd2611c4600b07);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc5c652363cf2cbd5);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h7c23e87121632ad9);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000022869a45);
        if (err) begin
            $display("Vector 24: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 24: Keygen output correct. cycles=%0d", keygen_cycles_24);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_24 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_24);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000019b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h354ab9335268b3bf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hac4c5ec8c4435203);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'heff0625281160762);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hcb407dc2f69d9435);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h64745d0a4181bb1e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2e3261cac3e587a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf08422c876ca3653);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h126b4fbda2a4e916);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hbb3362f4ffdfc2cf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1c48f74b9ff9ce01);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd278ac06aa111abb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h9a1660b3598ffd38);
        if (err) begin
            $display("Vector 24: Sign failed!");
            $finish;
        end else begin
            $display("Vector 24: Sign output correct. cycles=%0d", sign_cycles_24);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_24 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h64745d0a4181bb1e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2e3261cac3e587a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf08422c876ca3653);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h126b4fbda2a4e916);
        if (bad_sig) begin
            $display("Vector 24: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 24: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 24: Verifier accepts signature. cycles=%0d", verify_cycles_24);
        end

        // ---------------- Vector 25 ----------------
        $display("");
        $display("========== Vector 25 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf834d3b1b58562fb;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h33ab55682a118260;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc617414ca8372b51;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7ce7da4214feba78;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h628f573ec7cfac03;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2aee6ca4c27eacf3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'haee54bde40ec36ed;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h61bdb98a09fee180;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'ha2e68371a136aae3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7431fe82a56e023c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h63e6c7ed36ce864f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf0e06a2199fc725b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000009c;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_25 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h707132c9a3efd20c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h22f79843e0f333b5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hfe1c8a0b48745d02);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000089a5f21b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h677ad7041a325448);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'haf2ff907dbf0a1a6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5f855ade573ba4d0);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005b6e3883);
        if (err) begin
            $display("Vector 25: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 25: Keygen output correct. cycles=%0d", keygen_cycles_25);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_25 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_25);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000068);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2978f567229c127b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha30ff3250375ac6c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2378653b8979c125);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h352423c0db452f6b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha78b9eeab179d2aa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc47010c720a30653);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7cb588e1812a4b00);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf9d35cd4d53a3400);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc443d9a98576869e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he8f947a02806d3a0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he12b98c85a3250cb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he68b4a19e75a4e0a);
        if (err) begin
            $display("Vector 25: Sign failed!");
            $finish;
        end else begin
            $display("Vector 25: Sign output correct. cycles=%0d", sign_cycles_25);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_25 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha78b9eeab179d2aa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc47010c720a30653);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7cb588e1812a4b00);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf9d35cd4d53a3400);
        if (bad_sig) begin
            $display("Vector 25: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 25: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 25: Verifier accepts signature. cycles=%0d", verify_cycles_25);
        end

        // ---------------- Vector 26 ----------------
        $display("");
        $display("========== Vector 26 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf4c082cf65b29818;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0130374aaafd591a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha01baf9176b4ac0d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h16c9f6566fdc44a6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4adc56802f29f33e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h26419d478e7843af;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h07a076dacddfe07f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h38a7cc17366c6667;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfbe5ed55aff7c48a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb631088bc13190c6;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd92a802b51e6924c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h144a88a656ab7c5b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000095;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_26 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h266239ca738149db);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h402ff37e270761f1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf204017df789c6b1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b63f9b1f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h71200e15533b71eb);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h19e527edc88afe62);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hec2bcc6397bdf0f6);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000060ff7ca2);
        if (err) begin
            $display("Vector 26: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 26: Keygen output correct. cycles=%0d", keygen_cycles_26);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_26 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_26);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000dd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h097dd21626adaf1e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hea591afc84d90c70);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h5b2003fa6e787010);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd5e1b0b88f7bab6f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfe20246a29066c8c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdc3984c1fcd5fdaa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h78ba2887de61895d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdcff742f791137db);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h474bcc541d7ca977);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hebc0d6c24fe24929);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc000004ab8f017bc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hcb11e37ff2da6d2d);
        if (err) begin
            $display("Vector 26: Sign failed!");
            $finish;
        end else begin
            $display("Vector 26: Sign output correct. cycles=%0d", sign_cycles_26);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_26 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfe20246a29066c8c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdc3984c1fcd5fdaa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h78ba2887de61895d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdcff742f791137db);
        if (bad_sig) begin
            $display("Vector 26: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 26: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 26: Verifier accepts signature. cycles=%0d", verify_cycles_26);
        end

        // ---------------- Vector 27 ----------------
        $display("");
        $display("========== Vector 27 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha4545b47b6b6205b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h243f247ae389150c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8cc7082b573cd48c;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'haca1a4ae8edbacb1;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha4a6849d9d7acb4c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha9e0dd3c90a69a78;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h570ce79e11babd35;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1d2315b1d18ee47c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h431353fade9c2e31;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8eb745577e7dc3b1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he2e5b6d12ed8fbd6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1fa86c88db618e39;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000fe;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_27 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4e08f442f37824fe);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h13002af5c31eb065);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6a061977188f8eab);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f68845ae);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'haa4845bc2ffecf64);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc5f872c8d02531fc);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0114461e41d11d99);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000f7ac299f);
        if (err) begin
            $display("Vector 27: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 27: Keygen output correct. cycles=%0d", keygen_cycles_27);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_27 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_27);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000068c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he06784d17c50e59d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3d80084eb7e4ff10);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha57e503bfa623422);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha68b6ff76c528a9d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h293d43645c188a3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h705464d0585d9aed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h955ea76540a0394c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h320867f804239cf7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h85972ea2bbcd8d65);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9a10476ae7f402bd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h71f1359473d6e8f1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hed46082c6c29f8d2);
        if (err) begin
            $display("Vector 27: Sign failed!");
            $finish;
        end else begin
            $display("Vector 27: Sign output correct. cycles=%0d", sign_cycles_27);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_27 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h293d43645c188a3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h705464d0585d9aed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h955ea76540a0394c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h320867f804239cf7);
        if (bad_sig) begin
            $display("Vector 27: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 27: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 27: Verifier accepts signature. cycles=%0d", verify_cycles_27);
        end

        // ---------------- Vector 28 ----------------
        $display("");
        $display("========== Vector 28 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h72fa0b85d273fff8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he2be56b0694672d0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h20ea3d45f72b95de;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he8016706616f5235;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h56b3b927cc960d89;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb85d00c998285533;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h676a336f9f7be522;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6907e137336b53ea;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1ce71ac993333641;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1eae7d1e0941a989;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h73aceddbb9d59ad0;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h66af12dfb4746d14;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c3;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_28 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h20ba996bd3de54eb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd9ebba8c200beb84);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd1e2108afd3952de);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ea7c6945);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h30063395e7e29f51);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1d9e0a3195ffbcb0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h47910bfce2b1a5a3);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000030437a87);
        if (err) begin
            $display("Vector 28: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 28: Keygen output correct. cycles=%0d", keygen_cycles_28);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_28 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_28);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000025d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he1d48f51d5e716d6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h98176ae2ec6ab216);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6b7f17f6259fc373);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h21d1e67ded980624);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha38562e2297764d2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hae61e5f00d578259);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h720d5d94b6a94ecf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5df99377a5612a5d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha6f6fc3d7961c560);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'head57faa94e5f3d9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbde856bd2a81a9eb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he191dea06e8a7dcb);
        if (err) begin
            $display("Vector 28: Sign failed!");
            $finish;
        end else begin
            $display("Vector 28: Sign output correct. cycles=%0d", sign_cycles_28);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_28 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha38562e2297764d2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hae61e5f00d578259);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h720d5d94b6a94ecf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5df99377a5612a5d);
        if (bad_sig) begin
            $display("Vector 28: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 28: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 28: Verifier accepts signature. cycles=%0d", verify_cycles_28);
        end

        // ---------------- Vector 29 ----------------
        $display("");
        $display("========== Vector 29 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2984c0f22d0756c2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb3576f62d2b1425f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3fc991ff2686dfcc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7a1e59a3b3ba8a0d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hadfa03b325ef1abf;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h353414f9a3c3abbe;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hddd1864a2bf28202;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h28a0c4748eb540bd;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h626c8b4fc98a7ca2;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd9c5ec7d3e9526ad;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h969f5ba79b8ee1cf;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h04e65f63ac0ba0f6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000004f;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_29 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h57ecdc2ecc245b6a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h833a5c7b7827361e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h176f5b0af6b9b6c5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000026671c59);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'heb7faae72e5f7afc);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9b445efcbb9d9900);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h81d652802030e3b4);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e163225d);
        if (err) begin
            $display("Vector 29: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 29: Keygen output correct. cycles=%0d", keygen_cycles_29);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_29 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_29);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000010e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9c5d842afb82fe59);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h41870704bc2fd287);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6444c9fe7dee567b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h58df14be73c7553e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h85ebe520fb25e34d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd837754166186e02);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h314620eace4c1466);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd4a76d90364ab69d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8aa5ce6e7395216c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h27a3debeeffe4beb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h829ee3c7acfdd466);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hd8923464f73b0c8b);
        if (err) begin
            $display("Vector 29: Sign failed!");
            $finish;
        end else begin
            $display("Vector 29: Sign output correct. cycles=%0d", sign_cycles_29);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_29 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h85ebe520fb25e34d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd837754166186e02);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h314620eace4c1466);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd4a76d90364ab69d);
        if (bad_sig) begin
            $display("Vector 29: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 29: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 29: Verifier accepts signature. cycles=%0d", verify_cycles_29);
        end

        // ---------------- Vector 30 ----------------
        $display("");
        $display("========== Vector 30 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he9a9ebe2cebd7a01;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h186738795335e845;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4207aeaf330cd312;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8dee79aa73142c5a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h9cca376798c649da;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h74817dec82057faa;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb176d30dcab9c6d3;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hc5e29d6411ec9fda;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0a3fb522b8801525;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h92ed0218f44b78ae;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h056499f4c5a5e31b;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hdf617200f9b6fd61;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000005f;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_30 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'haca0e5963ecb07d8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc390d2e97e195c1b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h76804c9ab7a479d8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000061047e79);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3c507939a6bb2338);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he5bffbb22fd9c85f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5809292231cb96a0);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000577ee5dc);
        if (err) begin
            $display("Vector 30: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 30: Keygen output correct. cycles=%0d", keygen_cycles_30);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_30 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_30);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000024);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hde7e88e229cf6487);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf8b81d250e454aa7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0eb88cb6e44c6023);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf3bc0a7e5ad017f3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6660cea4fc46eaea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3f115e1a630d8e4b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9b5436251023e312);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb5e0bee478616ccb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hef7900b7d0d142d6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1a36f13dec95040b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8be96bd0445bc80a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h60d8f7885b190b1f);
        if (err) begin
            $display("Vector 30: Sign failed!");
            $finish;
        end else begin
            $display("Vector 30: Sign output correct. cycles=%0d", sign_cycles_30);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_30 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6660cea4fc46eaea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3f115e1a630d8e4b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9b5436251023e312);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb5e0bee478616ccb);
        if (bad_sig) begin
            $display("Vector 30: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 30: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 30: Verifier accepts signature. cycles=%0d", verify_cycles_30);
        end

        // ---------------- Vector 31 ----------------
        $display("");
        $display("========== Vector 31 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb6fa14c830b74463;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb06b8d9689e933cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h63250a9fe124cf44;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2ec8fd8da2b15143;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h56bc1dcd462d5ea5;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf74fe81383245361;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1137971f636b117a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6023fa404fe53b8c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he2e1493a4a117bfb;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5e5f26cf7f9c60a5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h73c6d49585444d27;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h05714f58078a273a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c9;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_31 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hadf22095096459ba);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd859334726989069);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h02da0e4e8fd16184);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007af19284);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0d1bd77fbf45a0b1);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h65cf129c223fd856);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h818319fe55f81ac6);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e09c050c);
        if (err) begin
            $display("Vector 31: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 31: Keygen output correct. cycles=%0d", keygen_cycles_31);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_31 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_31);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000525);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he4705ef0260a9e2c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha5f902023c5d00eb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6ce492aea1c1fcc8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hcb046d4fe11a39bc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0de58d42d47772e4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3aa46968fa88e01c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h49bb90927db92fd8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6457e75ba8475990);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb193dd09d3f5775d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0d581d63f1a72eca);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfcbd743741e589fd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hff626d8e84229255);
        if (err) begin
            $display("Vector 31: Sign failed!");
            $finish;
        end else begin
            $display("Vector 31: Sign output correct. cycles=%0d", sign_cycles_31);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_31 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0de58d42d47772e4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3aa46968fa88e01c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h49bb90927db92fd8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6457e75ba8475990);
        if (bad_sig) begin
            $display("Vector 31: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 31: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 31: Verifier accepts signature. cycles=%0d", verify_cycles_31);
        end

        // ---------------- Vector 32 ----------------
        $display("");
        $display("========== Vector 32 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he7eb6c47018d0ee0;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0fe7806f650d7eb8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfe821b05ed4e67f6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd5a4ef1a5d878177;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hde1c06a97dcf03c6;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hcf5b2576b5a76159;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc0737b6ced22196c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5aa0cb2c2c48fa8d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h893fb4a3c8672da3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h85d406c7c2553c4e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc0435a9099a50d02;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hde5beadf7a0c2fad;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000d;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_32 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'heed3ef2efdd6564a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he6947172f05194a2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hb98c9efccce6fc8a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000009f473c69);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hdf817b6e0942fcca);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h92f726e807b1f630);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h051e05ff87450109);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000020337c70);
        if (err) begin
            $display("Vector 32: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 32: Keygen output correct. cycles=%0d", keygen_cycles_32);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_32 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_32);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000003a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1fb877c47d187062);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h333e383cb3406788);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9ec8aa897853f5f0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h474d3239a715f482);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha4ca6a7142c668e3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9b4185f688d493fd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he4163bb6eb6813ae);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4b15f6a2f80eb113);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h265ac2aeda20cbb3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h957bcf4b2e885f2f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3b769a6c7b8f5627);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hadb322f5cb69877a);
        if (err) begin
            $display("Vector 32: Sign failed!");
            $finish;
        end else begin
            $display("Vector 32: Sign output correct. cycles=%0d", sign_cycles_32);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_32 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha4ca6a7142c668e3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9b4185f688d493fd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he4163bb6eb6813ae);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4b15f6a2f80eb113);
        if (bad_sig) begin
            $display("Vector 32: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 32: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 32: Verifier accepts signature. cycles=%0d", verify_cycles_32);
        end

        // ---------------- Vector 33 ----------------
        $display("");
        $display("========== Vector 33 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8dd6fd2b208c66b9;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hdc9c633fca16039d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4d0e7e81b4d46a40;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6da46f2f471e41ce;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h9b88a40f51ae0005;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h437a095c70e6312f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0b629383c2de4dc9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h14ae90e9aa823782;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd7bb6cb7373dabbe;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3528e569e1a9ef9c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb3a0f29f6b51cd04;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hced7c0baa528b051;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000016;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_33 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb796bfc26986e8df);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h98209527f1bb5a5d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf8e6e201fd650ac8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007dbb49ec);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb8f7385d2162b7ff);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1b15787c39f3bb47);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h57527b35f1678cf4);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000cbbfc07a);
        if (err) begin
            $display("Vector 33: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 33: Keygen output correct. cycles=%0d", keygen_cycles_33);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_33 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_33);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000003fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf5fe881b0e3691af);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h13088b0647db6e96);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf11a8343928ffcfb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hddb5e759be166dfa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h84fcca3a9c919248);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h751a7c9ef51a5c96);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0223f62344a71d17);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4d3655877940f4b7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hdd7fe5804bb3cda2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h22965af83d078e59);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h75a8aca48a4d560f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h440e12897631223b);
        if (err) begin
            $display("Vector 33: Sign failed!");
            $finish;
        end else begin
            $display("Vector 33: Sign output correct. cycles=%0d", sign_cycles_33);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_33 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h84fcca3a9c919248);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h751a7c9ef51a5c96);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0223f62344a71d17);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4d3655877940f4b7);
        if (bad_sig) begin
            $display("Vector 33: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 33: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 33: Verifier accepts signature. cycles=%0d", verify_cycles_33);
        end

        // ---------------- Vector 34 ----------------
        $display("");
        $display("========== Vector 34 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h83dc613d584ab59e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h54dbc348d7d28b06;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h42db71dba4698930;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hef041680d3bdca3b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he736b23c89ed1ab8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h942653e343857c22;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h63a876be4549f1bf;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h82dbe65380949519;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8f55184be9927dd4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h44ef43762f16c760;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h63437ec0b4af506d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3e84e9e57074684a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d6;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_34 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h24187536c1387df0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h76eef4012e88c9ab);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h44e59feafa662b0b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000006e68ceda);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4861effc40323362);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc1661ecdb6318f63);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'ha8fff2c160dccdf6);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000c9d27822);
        if (err) begin
            $display("Vector 34: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 34: Keygen output correct. cycles=%0d", keygen_cycles_34);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_34 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_34);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000022b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h91329cf48a14254f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6f91bcd088da39bf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2cf3a57d36a56c34);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3342637781059d03);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h36212712e03eafc0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5f9e3fd2c0cc52ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1f6b529f094c9900);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9d37932a724b59d7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5f310b4f7f090ee8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h684408b246acf008);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0d1d310c00e12bc5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc8d4c735d4241ed5);
        if (err) begin
            $display("Vector 34: Sign failed!");
            $finish;
        end else begin
            $display("Vector 34: Sign output correct. cycles=%0d", sign_cycles_34);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_34 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h36212712e03eafc0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5f9e3fd2c0cc52ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1f6b529f094c9900);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9d37932a724b59d7);
        if (bad_sig) begin
            $display("Vector 34: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 34: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 34: Verifier accepts signature. cycles=%0d", verify_cycles_34);
        end

        // ---------------- Vector 35 ----------------
        $display("");
        $display("========== Vector 35 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hbd902242e0f945d7;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h418b0d2f090e5512;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9550729f7ac21013;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4917f750cc27cf6e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd38924d30181ea31;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6651c2be29e997e3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hfaab1b5fe6f7fe37;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h9d5ef470796c6a63;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hda6984ceb0d214f3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9bea8761dd2e3016;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf67b110b16e638d6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'ha11cdf2e2baaf0f8;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000076;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_35 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h12706ce8ad6a54a5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8bdbc90701cd48e8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf036a9044174cdd0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ec578ab5);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h52f31dd04e12b4fd);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hbfe8cfd76ffedd22);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hfdf2b205625a104f);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003d38855c);
        if (err) begin
            $display("Vector 35: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 35: Keygen output correct. cycles=%0d", keygen_cycles_35);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_35 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_35);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000123);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf6ac563c1d60a12d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hbaf4bac8e2983691);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h517e08bb29acebf0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5e4b6b8ca28ca88c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8ca80d2f5db630c0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h294c98165605cdd4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h22a15499c932699e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0c3aee4fb6f80d47);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h29a169f6d5eb96aa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha8971204f031def2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h028e5a1091dc5e44);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h811efa9c7ca75253);
        if (err) begin
            $display("Vector 35: Sign failed!");
            $finish;
        end else begin
            $display("Vector 35: Sign output correct. cycles=%0d", sign_cycles_35);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_35 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8ca80d2f5db630c0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h294c98165605cdd4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h22a15499c932699e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0c3aee4fb6f80d47);
        if (bad_sig) begin
            $display("Vector 35: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 35: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 35: Verifier accepts signature. cycles=%0d", verify_cycles_35);
        end

        // ---------------- Vector 36 ----------------
        $display("");
        $display("========== Vector 36 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6ef6cbacec60e946;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h32b5e29a51275e6a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5a245248b2a6ec8e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0b6a9e3a82e5f377;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h31973de6c34c5948;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h5ed7f83e66512df7;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3ab1602fc6ad721f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'ha2e9636ac727f08d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h15d7bd65e051a5c9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6dbd2605ad07b06c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2c3e39c6fc6fab4d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8ed27501e7951c48;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000014;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_36 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hea83c55e11df1914);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf44ea0c494d3f3b3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h43c6ac58f6524d0b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e6b44e3f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd6ebb99cf17da2cd);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1f8bd3c5a0686c8b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'ha3dd7c5d0ba82ead);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000021b3bc80);
        if (err) begin
            $display("Vector 36: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 36: Keygen output correct. cycles=%0d", keygen_cycles_36);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_36 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_36);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000249);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he123bcb3014d6d80);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6fff91cbc66bbd45);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hb2c7f8f2b748baac);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h66fe8d0fce190292);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb889910f072b81c2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hca85beadbc8a8b44);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h71bf77a8061b652b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9225cc78df052bf5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h41aac5013407b984);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0a870940ef11e7aa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9d836b19e383b4f7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h932b2e6cab579bda);
        if (err) begin
            $display("Vector 36: Sign failed!");
            $finish;
        end else begin
            $display("Vector 36: Sign output correct. cycles=%0d", sign_cycles_36);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_36 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb889910f072b81c2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hca85beadbc8a8b44);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h71bf77a8061b652b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9225cc78df052bf5);
        if (bad_sig) begin
            $display("Vector 36: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 36: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 36: Verifier accepts signature. cycles=%0d", verify_cycles_36);
        end

        // ---------------- Vector 37 ----------------
        $display("");
        $display("========== Vector 37 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h711f4d55a3a5d10f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he6e17a9dfe226e67;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'heba4f8502cee9bb1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h940bfc248da42596;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h84467f8e90995ac2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he3273ea1bf0c9857;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hfca4d464517428ec;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h81a1ff2bab7fa85b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h60a2b005ab3518ca;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h844b6960f4816ab8;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hdf1d05796cd20f90;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfc3c48660a7c388d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000db;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_37 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha82b4e0b42eff488);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h99f6cc047fc8181b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6e4c684d2436c8fc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001e1f91ee);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1fafc066b7811b10);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8aea6df6a6655584);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd3bb2ec290558373);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000006b141e8f);
        if (err) begin
            $display("Vector 37: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 37: Keygen output correct. cycles=%0d", keygen_cycles_37);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_37 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_37);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000338);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc1cd4e74814f3d3f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he626ce25536350fe);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hcd2b872580aee006);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf01b62dc09be0aa3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'haf2c45cecd0bb55c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haa44f95d31d8f712);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdb2ac97f581cbb24);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9a866a3cb59cec6b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd15b821c26257298);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hb67248bd11f1e040);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0708d0b8b496f05c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8fdf22d044d7b068);
        if (err) begin
            $display("Vector 37: Sign failed!");
            $finish;
        end else begin
            $display("Vector 37: Sign output correct. cycles=%0d", sign_cycles_37);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_37 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'haf2c45cecd0bb55c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haa44f95d31d8f712);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdb2ac97f581cbb24);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9a866a3cb59cec6b);
        if (bad_sig) begin
            $display("Vector 37: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 37: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 37: Verifier accepts signature. cycles=%0d", verify_cycles_37);
        end

        // ---------------- Vector 38 ----------------
        $display("");
        $display("========== Vector 38 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h141fa7e780572ac4;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd383da380d65097f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'haa594b605fafdbc6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h52b7e7fb6a085dcb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h31ccac686339fafc;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6e72411e6a029cc4;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hef0ddd92cb218562;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h893a1d264f662c60;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h51a9a96d1c09d2a6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hbbf43e13f24238d2;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7cfb5ec4b4c0fbb2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1f2fe4c734793c1d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000013;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_38 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha0f08c705086ebd6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'had0f5b7b6073d14d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6b192347c9198d3c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000004c331d93);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5094ade848f68cc7);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb1bfc600015dc9da);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he051ba271c6bda9a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005eb8083a);
        if (err) begin
            $display("Vector 38: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 38: Keygen output correct. cycles=%0d", keygen_cycles_38);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_38 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_38);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000046b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2671587afe6b35de);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc86fe55090245787);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf6a3393a808d623f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h646aedd689880e2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h416e2e034b4fd72b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hca9b846d282595b8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h578de2bfa8945c98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1783443cdc3b07c0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h882dbe5eb636fc8e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h201e1f1dfefc9a60);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h27eeae4248ed81db);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'heb949e1ca4246285);
        if (err) begin
            $display("Vector 38: Sign failed!");
            $finish;
        end else begin
            $display("Vector 38: Sign output correct. cycles=%0d", sign_cycles_38);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_38 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h416e2e034b4fd72b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hca9b846d282595b8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h578de2bfa8945c98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1783443cdc3b07c0);
        if (bad_sig) begin
            $display("Vector 38: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 38: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 38: Verifier accepts signature. cycles=%0d", verify_cycles_38);
        end

        // ---------------- Vector 39 ----------------
        $display("");
        $display("========== Vector 39 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h110a36d71b4df80a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h09c3bb68648fc80c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h54bf1714ec7b38ce;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h24536fa8a9b6d317;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h798d3c0f3a8cb779;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h5c56616a8d13c70e;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9c72ce7961011e02;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1e7cf9061d92182a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0edd4635032126ac;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2bd8c3aa042d271a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8971089abdc08416;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbcef45343e355365;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a9;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_39 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h6e2b3cfaccebefec);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9643ce61499acfc7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hdad02cf021115e1a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f47ae61a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h65f9925d47a4830f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h4f0ae3191841354e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h9c46faf25aeefe4d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003b0e3a24);
        if (err) begin
            $display("Vector 39: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 39: Keygen output correct. cycles=%0d", keygen_cycles_39);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_39 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_39);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'haa940b711ecc74c3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he07eebe6e01c7cbd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7209153f91934b9d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h67cc99140706b586);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7986f8a2927ec650);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf88d574974fe579d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h78a4bbd7c49fb8e0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4be96b2961117bc5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'haeabd776157ec6cc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h45e8d5a6c2c30455);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he74cd759c06a4d5b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h46b1fd92f87eaa83);
        if (err) begin
            $display("Vector 39: Sign failed!");
            $finish;
        end else begin
            $display("Vector 39: Sign output correct. cycles=%0d", sign_cycles_39);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_39 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7986f8a2927ec650);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf88d574974fe579d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h78a4bbd7c49fb8e0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4be96b2961117bc5);
        if (bad_sig) begin
            $display("Vector 39: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 39: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 39: Verifier accepts signature. cycles=%0d", verify_cycles_39);
        end

        // ---------------- Vector 40 ----------------
        $display("");
        $display("========== Vector 40 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h5317f4e3d237d73d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0c942382a32c6bda;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2806439a35f9358f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8cf0622b0ea6393c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf6934153c922d102;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h810a06ec3b815d47;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h78ca5be1e76cf37a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hba411eea89bd4b47;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h657726f6b1c2005e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he56b4122e4d70072;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd31a7105366ecef1;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h84cbbd289443c6b3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000007d;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_40 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb515cf245a96f8d5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h72560f2223f0c890);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1f335847cae2432c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d0728467);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5f2ffbb609c89cef);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h510e3e1a30789451);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h06e3ee8b4245aacf);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000058613234);
        if (err) begin
            $display("Vector 40: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 40: Keygen output correct. cycles=%0d", keygen_cycles_40);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_40 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_40);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001f4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h335f2606637c87a6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd5fb1e4ded40c3b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h24bbe05b6c4054ce);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'haae4c0aa8beacce2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8b84f163b901630d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7d08e8641c89fbd5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0bef98ca320af6f0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfbac217fcf8db285);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8cf2b1e7b5d697ae);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h607f6b63cd00fd7d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd228cc3d5deea174);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4519ded01e8bb73e);
        if (err) begin
            $display("Vector 40: Sign failed!");
            $finish;
        end else begin
            $display("Vector 40: Sign output correct. cycles=%0d", sign_cycles_40);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_40 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8b84f163b901630d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7d08e8641c89fbd5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0bef98ca320af6f0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfbac217fcf8db285);
        if (bad_sig) begin
            $display("Vector 40: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 40: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 40: Verifier accepts signature. cycles=%0d", verify_cycles_40);
        end

        // ---------------- Vector 41 ----------------
        $display("");
        $display("========== Vector 41 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9a62486292d532df;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfac2c0998e1c602a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb066759f51d2c166;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4693e8e949599287;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h05152b054c3faa3d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hdee1c0c7c2d35e57;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha41b967f175b2c9d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb7ea6e12f220c940;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h557f4982894f4c60;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd20ca6f37c0847a8;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hda371a41b876ceb9;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h2d19a7f60b44e4e0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000030;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_41 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3866a4613a4925be);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h01841bda956135c4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha2cd19c737f90683);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000aaf22564);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha40597726e55a5f9);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h84c3c75fabdf3c32);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h7954187cc5eb6257);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000700a0cf9);
        if (err) begin
            $display("Vector 41: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 41: Keygen output correct. cycles=%0d", keygen_cycles_41);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_41 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_41);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002b5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf5ac756aaf26c5a6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd7b443785ae61969);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h81c253503cb1866d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hffae49fc61838cb0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0236d027fc9f530e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he7c1d29003461c2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1837b62fb8f3dcab);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8221275ac4cc1b80);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h804d096516c62ec1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h34707ed842e47a34);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'haebe77ac41539cb2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc7e2fc220cd053f0);
        if (err) begin
            $display("Vector 41: Sign failed!");
            $finish;
        end else begin
            $display("Vector 41: Sign output correct. cycles=%0d", sign_cycles_41);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_41 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0236d027fc9f530e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he7c1d29003461c2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1837b62fb8f3dcab);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8221275ac4cc1b80);
        if (bad_sig) begin
            $display("Vector 41: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 41: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 41: Verifier accepts signature. cycles=%0d", verify_cycles_41);
        end

        // ---------------- Vector 42 ----------------
        $display("");
        $display("========== Vector 42 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb7c9c89fd2bc0362;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc057c1298a08bfcb;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha669ca88aea28f9e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4df19f796b1d43da;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h35401a45055ad8f1;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h128228a42dfca7d3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h83983e9476164311;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6ccf24bba6263cea;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h154e897a79856d9f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1933e27fa533e434;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4a0467aec961e730;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h10740a8f093c6872;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000002f;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_42 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9c19d20439b307ca);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h844c9c97bdf45a4e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h9e2fa87129ac3d73);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001fc642ac);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc023f7742d5e209a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h96013023bf3c84f6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0f36673df7c6c7ce);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000040a71890);
        if (err) begin
            $display("Vector 42: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 42: Keygen output correct. cycles=%0d", keygen_cycles_42);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_42 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_42);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000039f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc447821d16a60b82);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h98817f62310477d7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd706b17adbfc4eda);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb1f221998a6eef71);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h91c48c10a51c3c65);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0a641cab50072787);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3b7169fb2d2cf2f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf97cafded07e5d7e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb552a4a012be2bd6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hdbed9fb320cbb793);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf40f0f40b2b604ca);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2766c76836f22efb);
        if (err) begin
            $display("Vector 42: Sign failed!");
            $finish;
        end else begin
            $display("Vector 42: Sign output correct. cycles=%0d", sign_cycles_42);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_42 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h91c48c10a51c3c65);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0a641cab50072787);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3b7169fb2d2cf2f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf97cafded07e5d7e);
        if (bad_sig) begin
            $display("Vector 42: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 42: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 42: Verifier accepts signature. cycles=%0d", verify_cycles_42);
        end

        // ---------------- Vector 43 ----------------
        $display("");
        $display("========== Vector 43 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h04a3d59ad7ce16f0;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hbe6e11c703a0c4ba;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h64ba1550ed3addf2;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'had8df5fa29a706d8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd933a24dedf49b34;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3c8df083249c98ab;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h470f880f2e6e50b0;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h781697360d6226e8;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd25f64911a60917a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2f24ae981b85bd2b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h9181b75c5a5400b6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb6ea82af4cb841ce;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000018;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_43 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb82341284d672e2f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h37171e54e1b9e883);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1486e22b30a8b367);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007b28b845);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h88ecdb2d67bf714c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hef5dd3a4189e5d7e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h12c88c02da82be06);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000008f673949);
        if (err) begin
            $display("Vector 43: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 43: Keygen output correct. cycles=%0d", keygen_cycles_43);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_43 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_43);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000454);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h18b883b2238373b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hef63d9820d0b0e8b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8713e5f95ba1558f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h12dc81f60751ef00);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3579f69e1216fdf3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hebcbba9e9bc7e3a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'heda42a0016e817ab);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3529c94dc7824adb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7653ecb7d8f36ef3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he85c009f50ab5402);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3b2a89dfffe42018);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h61a7fc40cdb2a0aa);
        if (err) begin
            $display("Vector 43: Sign failed!");
            $finish;
        end else begin
            $display("Vector 43: Sign output correct. cycles=%0d", sign_cycles_43);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_43 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3579f69e1216fdf3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hebcbba9e9bc7e3a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'heda42a0016e817ab);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3529c94dc7824adb);
        if (bad_sig) begin
            $display("Vector 43: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 43: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 43: Verifier accepts signature. cycles=%0d", verify_cycles_43);
        end

        // ---------------- Vector 44 ----------------
        $display("");
        $display("========== Vector 44 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h64a06b5a676e02d3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1424422688f066a9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h361b07de4d4064df;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9ba2c483674037e8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4599b71bed0afdc8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha10033b2b5d52596;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9cfec7f329b980d6;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5e30ca509003c78f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0915199880525d3b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h476ba28ad1957ecf;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc9d4fecde9aaf565;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0749b4ef682303a8;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ec;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_44 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2c7b38c3eb93e2c3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h266ad1e041dc6081);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h84d37cd3c878f78c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000031fcb579);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb616ddcc42701114);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf9ec462d3420e25f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h040fc7f6945a61fc);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a83d9460);
        if (err) begin
            $display("Vector 44: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 44: Keygen output correct. cycles=%0d", keygen_cycles_44);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_44 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_44);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000478);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdfa0237885127386);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hce1ca7ee6d4602f6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha24cfda190e564f3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h74ccd7d3349e66ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2b54a126a2957ff4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha9aa339bb7972c91);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd2fea73a23a8265c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2e1b89114868feaa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h0d2ef8e52b5e5e32);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd2ca010f3e6bd512);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd6d95a582479c1ff);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb4f3c3cb066df686);
        if (err) begin
            $display("Vector 44: Sign failed!");
            $finish;
        end else begin
            $display("Vector 44: Sign output correct. cycles=%0d", sign_cycles_44);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_44 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2b54a126a2957ff4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha9aa339bb7972c91);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd2fea73a23a8265c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2e1b89114868feaa);
        if (bad_sig) begin
            $display("Vector 44: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 44: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 44: Verifier accepts signature. cycles=%0d", verify_cycles_44);
        end

        // ---------------- Vector 45 ----------------
        $display("");
        $display("========== Vector 45 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hd97e60ed01251e17;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9a0358ad651ceceb;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2ccfcfb5ff7daf3f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h02208c804aa19adf;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hde71e90060e600e0;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h570381393cded006;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0be733170f85ad48;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2707c8266c2addfe;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf84253a83fb6ce26;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha3aa6b1fd4f2becf;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hab044233cd5a9fbf;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6a9071e3383e1fe3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c0;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_45 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hee8afdc11a260ecd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2fe2980200274492);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h7f015077fcd28c7a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000118164ef);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5ad414bd038f508d);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h363f12a27bec18d8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5a0a780528b4aebb);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000004897e3ae);
        if (err) begin
            $display("Vector 45: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 45: Keygen output correct. cycles=%0d", keygen_cycles_45);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_45 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_45);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000ca);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h877ad06a0dc86709);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he3f2f35272380164);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha50757737ae4b720);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h06a5107f7788b5c8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h859d2b3371128a04);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc7ffe1dd918c0bb3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8dfe0a13f015ba3a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb50365ab0f20b897);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h718569db58c79e8a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd0992a7ccceba39e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1014d1d64b5d597d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h53d09ccd6933ec55);
        if (err) begin
            $display("Vector 45: Sign failed!");
            $finish;
        end else begin
            $display("Vector 45: Sign output correct. cycles=%0d", sign_cycles_45);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_45 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h859d2b3371128a04);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc7ffe1dd918c0bb3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8dfe0a13f015ba3a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb50365ab0f20b897);
        if (bad_sig) begin
            $display("Vector 45: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 45: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 45: Verifier accepts signature. cycles=%0d", verify_cycles_45);
        end

        // ---------------- Vector 46 ----------------
        $display("");
        $display("========== Vector 46 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h5b577468891415c3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfbedc192939baff6;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h55761e428e7f1069;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h65ad9cfa73fadae6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hba0d1c80fc87b193;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4f0117b9e25357ef;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd5ec2b909b3f9b9d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1f5dc37f882dfd6c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h90b8cb49f9b1100e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h4cef937a9c33549c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc24fa555e0b2b005;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h79507ebaef03b258;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000008a;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_46 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h40c8d865e21462a8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h481eb8e6d6110964);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha814fa9157e5f73a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f56fc603);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h950acf3080c52427);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h582fd9439327fcc6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd5d91ddd86b044dd);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000089e1590a);
        if (err) begin
            $display("Vector 46: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 46: Keygen output correct. cycles=%0d", keygen_cycles_46);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_46 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_46);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000f4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6eb2bf7459882519);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h4cec0c37748e7a82);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he9920bc21711b423);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h23462f6aee83ea83);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h098fbfd1d95fe31d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h52f285afe0984534);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha4e80728465ef5df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h707d0473bca24d28);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1c3418e21db2f455);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h947fcdd8af0ee72e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0e82adb30cce6294);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h680d4e7309600904);
        if (err) begin
            $display("Vector 46: Sign failed!");
            $finish;
        end else begin
            $display("Vector 46: Sign output correct. cycles=%0d", sign_cycles_46);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_46 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h098fbfd1d95fe31d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h52f285afe0984534);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha4e80728465ef5df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h707d0473bca24d28);
        if (bad_sig) begin
            $display("Vector 46: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 46: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 46: Verifier accepts signature. cycles=%0d", verify_cycles_46);
        end

        // ---------------- Vector 47 ----------------
        $display("");
        $display("========== Vector 47 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha0bad98baf541e10;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h25a044e2453c8620;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfa9958d478a52b49;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h149e2d18d2d23a90;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h445bbaf236027a28;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h1e9b29d0afea95e5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hce283722de2f72e2;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3648883484181c0c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1d04407801176923;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h4d2e30a5abbddb14;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6b0c6046255a0701;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h61138867624e01fa;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000099;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_47 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc3237a623094c080);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hde75c70529060bc4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h4f6e51f8ef9e00b2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000423fd56a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2af20c9d44bc285b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h651f63afd8da9992);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1596cb76c8e0c651);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000449c60ba);
        if (err) begin
            $display("Vector 47: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 47: Keygen output correct. cycles=%0d", keygen_cycles_47);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_47 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_47);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000004a1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4b398e4b5d20d43d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h4024f14bd1e467e7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h26fd0657f3a14a8b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb5a207e281cd8893);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1828a50f21e3a831);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9c12cc73419745b5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7ca7074c138e378e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h49b22ae232796c55);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc3cf3136e59ba711);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3a1ad582ab61a674);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1d35f8eaea598452);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc2273d5b0692d14c);
        if (err) begin
            $display("Vector 47: Sign failed!");
            $finish;
        end else begin
            $display("Vector 47: Sign output correct. cycles=%0d", sign_cycles_47);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_47 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1828a50f21e3a831);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9c12cc73419745b5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7ca7074c138e378e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h49b22ae232796c55);
        if (bad_sig) begin
            $display("Vector 47: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 47: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 47: Verifier accepts signature. cycles=%0d", verify_cycles_47);
        end

        // ---------------- Vector 48 ----------------
        $display("");
        $display("========== Vector 48 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h21e9a13bd6010d32;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfd654505c3ee8033;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h247d412ac9f56315;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1ca73a2472b784c2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc00974d6f04d6d6e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h49c3ea20571b5232;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h82da7546aaa8de05;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h914580d29871d19c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h76d01500e44093b7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h36a21cafc1e0b3c1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7895a0b889578934;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4f30f3310041c337;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000da;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_48 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4969bee14230bde5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h86cd86a9cb194dc5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hbb04f6b9e70dafad);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a0be914d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h8d049d426b415612);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb181ae66f78fad69);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h94bc7413c3a213a2);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000004a417fee);
        if (err) begin
            $display("Vector 48: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 48: Keygen output correct. cycles=%0d", keygen_cycles_48);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_48 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_48);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001b2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he83b0623fa18e516);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hcdf0f12b5021dfef);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h035ce831a8342bcc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h4c1164803ad8507a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb7114b2febf96f62);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3f8e1d1c86564fd2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbb527f1a61e4340f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha8ea0b1f5ead597b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf66e4fe7e861f039);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h424c752bbf1c63ae);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd8f901547c14df6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4d693219e4f795bc);
        if (err) begin
            $display("Vector 48: Sign failed!");
            $finish;
        end else begin
            $display("Vector 48: Sign output correct. cycles=%0d", sign_cycles_48);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_48 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb7114b2febf96f62);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3f8e1d1c86564fd2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbb527f1a61e4340f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha8ea0b1f5ead597b);
        if (bad_sig) begin
            $display("Vector 48: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 48: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 48: Verifier accepts signature. cycles=%0d", verify_cycles_48);
        end

        // ---------------- Vector 49 ----------------
        $display("");
        $display("========== Vector 49 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha8e0dfe6661553e3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf47026e7e4c98fa4;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf38888940043a840;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf8d64c07f57f8bf5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf060a554f7effdaa;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8947fe135088244d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb6f010671a314a1e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5cf163b5d3d90e3d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfec46e1b7c27f870;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hbdadf9607be2758c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6e83039e912ac6f5;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h480691e8536f079e;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000011;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_49 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hec3e630c0575e225);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hfd5a40fe4b4efdbe);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h757c06f3f6a28437);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d2b7832e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2f1dd8886c9c3af0);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he63e4ecacc1981be);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'ha94ee9b5d4f5f1bd);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003e28f8a6);
        if (err) begin
            $display("Vector 49: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 49: Keygen output correct. cycles=%0d", keygen_cycles_49);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_49 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_49);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001c8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0b6733ee4a78ff55);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he66b17e2f9360c08);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2e0e9cbacd62f00e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h91ad6312f3b255b3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5b0598774a9dedf5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h40f5cf07b8dca11c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc09b69ca0326380a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd7d3887a77ef6024);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb3c0624097e8080e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h606731627d2d430a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he99c0941fdebcf2c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb3584a295e560ef1);
        if (err) begin
            $display("Vector 49: Sign failed!");
            $finish;
        end else begin
            $display("Vector 49: Sign output correct. cycles=%0d", sign_cycles_49);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_49 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5b0598774a9dedf5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h40f5cf07b8dca11c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc09b69ca0326380a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd7d3887a77ef6024);
        if (bad_sig) begin
            $display("Vector 49: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 49: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 49: Verifier accepts signature. cycles=%0d", verify_cycles_49);
        end

        // ---------------- Vector 50 ----------------
        $display("");
        $display("========== Vector 50 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha06cbd69be1975a9;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7ef95ee859db1cae;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hbff5517615c90519;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb85c340ee3a7dd4d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h98e3002b7f7fbd73;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc0b2ae247888815f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2733fd2310666535;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1ca6111832d5d814;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h258efd998058c650;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1a865853ecec180d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h9d0a273acc8eed57;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h787413ec96d9967a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000023;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_50 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h42fb211dde1ca39a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h119e0dee17da5c91);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hcbf171ca82483e1e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000c34adc9b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9ed811c040ee1bce);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1ab3d2438bd3262b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hb02fc7d0dcc87c27);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000006099efaf);
        if (err) begin
            $display("Vector 50: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 50: Keygen output correct. cycles=%0d", keygen_cycles_50);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_50 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_50);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001e3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7dc13b8c9c50545c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2a04a9050922be1b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf54a6563cfe60744);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7ea06d286507a175);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5192b904fd46ca40);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3a2bec653f477795);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hea4f64db95770cf9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h10aab8c1f776ecab);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf073086afe3b4675);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h25b5777dce3d8fb9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf13f7321837c750a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hee718a1e74b7ddda);
        if (err) begin
            $display("Vector 50: Sign failed!");
            $finish;
        end else begin
            $display("Vector 50: Sign output correct. cycles=%0d", sign_cycles_50);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_50 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5192b904fd46ca40);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3a2bec653f477795);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hea4f64db95770cf9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h10aab8c1f776ecab);
        if (bad_sig) begin
            $display("Vector 50: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 50: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 50: Verifier accepts signature. cycles=%0d", verify_cycles_50);
        end

        // ---------------- Vector 51 ----------------
        $display("");
        $display("========== Vector 51 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hbec6656fdd87df1f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hdd77b1ba2813120f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hda1580878e8403b1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h829a3b47e8580fd8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc8657c79c0a2fea6;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf249c363ab924312;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'haf821ea08125a42f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h41ed4855833ccff4;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8ff7742adffa1420;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he80891763f042153;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8733daf15e922f9d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcaaa2fb8e58e9ac6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000cc;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_51 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha4f38d7d4e93d792);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbce0a451cc6d4293);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hcb25f5808b55d668);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b16f171e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc0215024a7b827d8);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8dd9d6a4d2fc5582);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h85d82c13f12f903e);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000001504b6ee);
        if (err) begin
            $display("Vector 51: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 51: Keygen output correct. cycles=%0d", keygen_cycles_51);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_51 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_51);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000004a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h814f0515f192e9b2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2e5874bdf2ca6aa6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd907c4f840fe8718);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf5f948ee40dd2342);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h110ead7d4adc8930);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h81d5c7d40627d16c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he3bf9f5421d0f6f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'haa8d3a3ed5d60dbc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h64fa130d86481ca0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2ce89cbab2acfb6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h7953bf499097fb41);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h57a9749c3a4f75bf);
        if (err) begin
            $display("Vector 51: Sign failed!");
            $finish;
        end else begin
            $display("Vector 51: Sign output correct. cycles=%0d", sign_cycles_51);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_51 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h110ead7d4adc8930);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h81d5c7d40627d16c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he3bf9f5421d0f6f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'haa8d3a3ed5d60dbc);
        if (bad_sig) begin
            $display("Vector 51: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 51: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 51: Verifier accepts signature. cycles=%0d", verify_cycles_51);
        end

        // ---------------- Vector 52 ----------------
        $display("");
        $display("========== Vector 52 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h7751e26b8eebf4c3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h63a83f770e06255a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h735d414a008e9dca;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h67a3e334a041ca55;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h2a568be645c1f703;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hde24b21086f98296;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd5c360ed1c950136;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h60101de8cfef2db5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h25ef7a12da5c2048;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h20bd564517a58f18;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2651f51d0feae018;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he7c07508a916e356;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f0;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_52 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h10725247e891840d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc797d888f4a6f8d6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h5a76acb62e6e246a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000004effd06b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h26fe034fd1403694);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h58c72ef81cacb4fe);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'haf5b11e2f3661f67);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005d8c4b3c);
        if (err) begin
            $display("Vector 52: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 52: Keygen output correct. cycles=%0d", keygen_cycles_52);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_52 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_52);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000d0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h23c2fd1318dbf92d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc8e496c7dc8104d5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf7cb4a0a6d848d0f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h26c53cab33de5640);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h49d0aafcb81f3d96);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8af0fa2294127922);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf4e039adf14a1a2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5ad865c4f0a5db83);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb62b99d36252c384);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9ebeb23f9d1af54d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbbad3522f4ff7d87);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0f1d7f9194af8344);
        if (err) begin
            $display("Vector 52: Sign failed!");
            $finish;
        end else begin
            $display("Vector 52: Sign output correct. cycles=%0d", sign_cycles_52);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_52 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h49d0aafcb81f3d96);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8af0fa2294127922);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf4e039adf14a1a2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5ad865c4f0a5db83);
        if (bad_sig) begin
            $display("Vector 52: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 52: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 52: Verifier accepts signature. cycles=%0d", verify_cycles_52);
        end

        // ---------------- Vector 53 ----------------
        $display("");
        $display("========== Vector 53 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1273447ce95953cf;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd385736513a12f05;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8517cf54e654d252;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h98e9c8315f7db621;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hbfb887408b762290;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h26d77c4d3379f641;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2d020d33e7688540;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf0c182a178d738d7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7b998b0f58ec5a85;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h46cf0dd2be4330a5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6f40207aa33aef59;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h12e308a46d574728;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000074;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_53 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h42d68e36127cdc19);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h478385b0e59ec6c0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6f4bb57f681159c5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000005ebc2aa2);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0850d84bec79b772);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf6d9ccf8598708bd);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h524720e48001ae36);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005992c775);
        if (err) begin
            $display("Vector 53: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 53: Keygen output correct. cycles=%0d", keygen_cycles_53);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_53 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_53);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002c2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h43cfdf03596b978b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hcd0f435689c8d863);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hfdbd998efcc0654e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h1c705dccd9676a3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2b4e1ab8b5b2a4b2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h775d33c0d75da013);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9db315dfab947b04);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h782eca3d5c7daefd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc56ce76269952f79);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h518ded9bfb51fb8e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4ff874f60bf861d7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hceda39bac7beb0c5);
        if (err) begin
            $display("Vector 53: Sign failed!");
            $finish;
        end else begin
            $display("Vector 53: Sign output correct. cycles=%0d", sign_cycles_53);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_53 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2b4e1ab8b5b2a4b2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h775d33c0d75da013);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9db315dfab947b04);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h782eca3d5c7daefd);
        if (bad_sig) begin
            $display("Vector 53: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 53: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 53: Verifier accepts signature. cycles=%0d", verify_cycles_53);
        end

        // ---------------- Vector 54 ----------------
        $display("");
        $display("========== Vector 54 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0707d17e776bed39;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h660455a33fd74df8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3a75ff3310ccd1d6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6b74a5b69cdce351;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf2ab5dec9ffce247;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h74a0f4836e938234;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h60b990ea258363f2;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he9da1787df8b3380;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h61e9e7570c7166d3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he702867af69a8827;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha0617d716ed9e668;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h472971fcbb651623;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000092;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_54 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hcd9afd5e3759221e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h124c888c0048ea93);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h7daab605c8d27ab6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000000d00e95f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf2f9b9fa3c0f4a18);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h893b0092da081dd6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h55d30651dc84caae);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000ddd7db5d);
        if (err) begin
            $display("Vector 54: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 54: Keygen output correct. cycles=%0d", keygen_cycles_54);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_54 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_54);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000365);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h98fb3cd8a5e8636d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h343f6d175051201e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hb5f7c4bb44612e1d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc2e7e93fab818b93);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h89e108dc3c832f76);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h70ffbf67e5aa2cd6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7d383bcf5002d439);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc84042bb2e2be776);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha1a2847d153a8435);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbde173c3636138f3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hce07b3f138c24d0e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5e84b31a4ff3f235);
        if (err) begin
            $display("Vector 54: Sign failed!");
            $finish;
        end else begin
            $display("Vector 54: Sign output correct. cycles=%0d", sign_cycles_54);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_54 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h89e108dc3c832f76);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h70ffbf67e5aa2cd6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7d383bcf5002d439);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc84042bb2e2be776);
        if (bad_sig) begin
            $display("Vector 54: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 54: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 54: Verifier accepts signature. cycles=%0d", verify_cycles_54);
        end

        // ---------------- Vector 55 ----------------
        $display("");
        $display("========== Vector 55 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6b6e413f35f58cdb;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd714eeb89afd4614;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hffa95b185587ce7a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hef0dbbe0583948b2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h2bc0f3d1e347e13a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h66fadeacd3ce8139;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha7f631d6165b54c0;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hea35d931bbabdf73;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h89ada0b48d37fec6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5e3ff9ae1a4f2c41;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hdd73a200350edc8c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h631c242445c02803;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000003f;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_55 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h0e36566c32cada90);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he00d05c021e5a0de);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h71b65259c245c764);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000000a94cc85);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h228912082841d1c0);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hac3cd964aeec6e93);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'had49d19d2d5f9186);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000b4e9de48);
        if (err) begin
            $display("Vector 55: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 55: Keygen output correct. cycles=%0d", keygen_cycles_55);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_55 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_55);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000003c8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h74a1ebc84442cc78);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9dd791c11785193d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'habe1bad0c21c34c1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h368dc8e9256abf1a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5e3683543dc76e0f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h27918ad94e68d736);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h05f69838ab0e4858);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb7941b9134381a00);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he2fcf39c0de6f341);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h97f70afe0a516c54);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h46ad3329c5f5e4b0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5df528b209ce0bbc);
        if (err) begin
            $display("Vector 55: Sign failed!");
            $finish;
        end else begin
            $display("Vector 55: Sign output correct. cycles=%0d", sign_cycles_55);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_55 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5e3683543dc76e0f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h27918ad94e68d736);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h05f69838ab0e4858);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb7941b9134381a00);
        if (bad_sig) begin
            $display("Vector 55: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 55: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 55: Verifier accepts signature. cycles=%0d", verify_cycles_55);
        end

        // ---------------- Vector 56 ----------------
        $display("");
        $display("========== Vector 56 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h58343a65e85a13d9;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4c41ed929a6a9609;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hca983e0a7ca617c6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h41fd524d1af0c54b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h293ceb5fb3b1838c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf4841cdd4cff769a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h88ac673cfc545f6f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h22f4ad1418338558;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h14c8907451e766d6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h83cb86910119b256;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4523157b1b6c0d2c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h471e3807e9c585dc;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000028;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_56 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb7a08efb9a85385f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2871745e63f57f82);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h931d2e261dae6dd1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000289ed251);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd4bf412e5e7dd5cc);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9b826e80b1e13bd1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hf101e7f505946a00);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000004d995992);
        if (err) begin
            $display("Vector 56: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 56: Keygen output correct. cycles=%0d", keygen_cycles_56);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_56 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_56);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000a7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha63599d9faf1a693);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h574fefe6123fec12);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h800a725024482371);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf55f933ff30758f8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f995b9536ef3723);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf14345480809a896);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf259b33b9dfc054e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h742815ec0258d416);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h49e03bc08d2df7bc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h339e520c05a0eaa2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h01e6b06eb1eb9d4a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he76c05028028d21b);
        if (err) begin
            $display("Vector 56: Sign failed!");
            $finish;
        end else begin
            $display("Vector 56: Sign output correct. cycles=%0d", sign_cycles_56);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_56 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f995b9536ef3723);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf14345480809a896);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf259b33b9dfc054e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h742815ec0258d416);
        if (bad_sig) begin
            $display("Vector 56: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 56: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 56: Verifier accepts signature. cycles=%0d", verify_cycles_56);
        end

        // ---------------- Vector 57 ----------------
        $display("");
        $display("========== Vector 57 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'heb90915cfbeadc82;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd75f14e16b55b8ad;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb8c840675117e21e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h374fd6fdd9cee673;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h45892d3516bef269;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h40688cbfa6f5380a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd94d9dcc4dcf6b89;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5e7b4da67c3878b2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hecaf3e104399dcf8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h575d25ab03fc29df;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf49c27acdde469de;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h40d2e8dc3a283e79;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000070;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_57 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf24abd579f807c43);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hca9f31100a8cc09f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h54e33938cc668e6b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b6a5ca20);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h59c9bc5ad2151967);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h821b9be4b1710fa4);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbc891a4d5079c0c4);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000007b5cd025);
        if (err) begin
            $display("Vector 57: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 57: Keygen output correct. cycles=%0d", keygen_cycles_57);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_57 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_57);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000002a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h32e79b2b485edb06);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h49389c40fcba3fa7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6b157501a980c79d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h66dc987140376218);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf3a46452ee6d93be);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hef3bf3f7d5afedbd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb47259296b7b8b11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd5e2cdde80f792f0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5ab789672276350b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hcc939f9ef41e508e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3ec76957d4a30db3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h195853305c41ece9);
        if (err) begin
            $display("Vector 57: Sign failed!");
            $finish;
        end else begin
            $display("Vector 57: Sign output correct. cycles=%0d", sign_cycles_57);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_57 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf3a46452ee6d93be);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hef3bf3f7d5afedbd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb47259296b7b8b11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd5e2cdde80f792f0);
        if (bad_sig) begin
            $display("Vector 57: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 57: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 57: Verifier accepts signature. cycles=%0d", verify_cycles_57);
        end

        // ---------------- Vector 58 ----------------
        $display("");
        $display("========== Vector 58 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h117a3cec54e38d8f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h95e9455a90d33a4c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h38089a806d2e3e66;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h13644601d6b1b32e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h80a4a1367ef78d83;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h82a2a31fb8d20ec3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4162adbd4e5af4fd;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd8d71b8e291ad224;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb66f23d39f0c0d4d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h84a8f1c71f924ea4;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3de1092e28e40180;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6a6c207875610b06;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000054;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_58 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he6215be4bfbfb15f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8d23220b35da32e9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h631efeb7554f3f95);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001c95c6de);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h79cc171fbe922c77);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1803f9a0f14a0183);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h549dafee0f5f473b);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e4da44a7);
        if (err) begin
            $display("Vector 58: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 58: Keygen output correct. cycles=%0d", keygen_cycles_58);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_58 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_58);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000201);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6e40eb0184f624b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb01507acfbf28f86);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hae47238886ad065e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h28681a372acc5a55);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h75cacde25ad8b7fe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h012800f54efbb5f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbb9c422051d4c456);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'haaa2d133537da3af);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'haf9270a09b292199);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h79ffc2fd656415a3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h99a60d40dcc9bd13);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h3200244e7fae1e4a);
        if (err) begin
            $display("Vector 58: Sign failed!");
            $finish;
        end else begin
            $display("Vector 58: Sign output correct. cycles=%0d", sign_cycles_58);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_58 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h75cacde25ad8b7fe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h012800f54efbb5f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbb9c422051d4c456);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'haaa2d133537da3af);
        if (bad_sig) begin
            $display("Vector 58: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 58: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 58: Verifier accepts signature. cycles=%0d", verify_cycles_58);
        end

        // ---------------- Vector 59 ----------------
        $display("");
        $display("========== Vector 59 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h673905cca63eef6d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h023f29a5f72be2af;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h0a49ec305f749077;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8f5afd34ee3ab1f4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hbf24c46376a69516;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf997c6282bedd39f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h36adbe2bb012fa33;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6280df1f7b9688b3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h74d8f5c93c10153f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h72fdad35ceeafbb0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4c8d377ac5ac5621;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6a27b87f50daecf9;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d4;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_59 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2f3785162deadc9c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h92a2860410a2730f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf3de7d235f412c18);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000006bdb0007);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9852141d584a7eb5);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0c3634d92836bca8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hdc6584a1d2f24f27);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000cb420573);
        if (err) begin
            $display("Vector 59: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 59: Keygen output correct. cycles=%0d", keygen_cycles_59);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_59 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_59);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000e2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4fd02b171a7acafb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h37188c6c7ee1df98);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h95ff4c954a94e0d0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hff79fba239c09f23);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h68df56c44d7166d8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd2cb51cac628733c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf00a88d7b43cf331);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h11df48633483d6c3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7e6f092c62652272);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9354162241aa4022);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf1f5e904c00bc738);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h13f804b047dcc648);
        if (err) begin
            $display("Vector 59: Sign failed!");
            $finish;
        end else begin
            $display("Vector 59: Sign output correct. cycles=%0d", sign_cycles_59);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_59 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h68df56c44d7166d8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd2cb51cac628733c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf00a88d7b43cf331);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h11df48633483d6c3);
        if (bad_sig) begin
            $display("Vector 59: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 59: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 59: Verifier accepts signature. cycles=%0d", verify_cycles_59);
        end

        // ---------------- Vector 60 ----------------
        $display("");
        $display("========== Vector 60 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h207b8e575a74c3ee;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4f1ba113331a1c01;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha4af4e5caaad7a03;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h5e7b918959b9faf3;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h3e3d74813f3cfc6b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6d5232475de29946;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9aca9fc26757e013;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2712c3af82cdb7d7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h43efa2e98de37522;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h79e36e2a4c3845c1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h9a9c185e03cd4832;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4d5a96883d439ee6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000013;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_60 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h459e9c7219670fe0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hac01d6a0ade995c0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hfac5f43beeab331f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fe9ba3df);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5413d0f4266741c3);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8286c84495849a99);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h60711f69724bac5c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003f4e465b);
        if (err) begin
            $display("Vector 60: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 60: Keygen output correct. cycles=%0d", keygen_cycles_60);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_60 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_60);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000105);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hbe878e338ccbceda);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hed957abae5a452a1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd14385e102ccc7b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h43292249ee39569d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h640442e3479eeaed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h476c0f7b996b2190);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'had1738b39d0f7caf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h255767341020716a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9a5c33400d6a31d7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0b12978b47af4191);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf0d6e6409c9f8559);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4e6961f805a8de0a);
        if (err) begin
            $display("Vector 60: Sign failed!");
            $finish;
        end else begin
            $display("Vector 60: Sign output correct. cycles=%0d", sign_cycles_60);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_60 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h640442e3479eeaed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h476c0f7b996b2190);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'had1738b39d0f7caf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h255767341020716a);
        if (bad_sig) begin
            $display("Vector 60: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 60: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 60: Verifier accepts signature. cycles=%0d", verify_cycles_60);
        end

        // ---------------- Vector 61 ----------------
        $display("");
        $display("========== Vector 61 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h3df6dbc06afbd04f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7b75ba84b8dfad58;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5aae790b68a56396;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8097f91c92ac65cb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha7dc674bdfb72456;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h211310c17442a3c2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hbe5399a3e6ff97e9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h365fc8cad176627a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd39d98f46b961078;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h395c3e94a799ff70;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he189021dfd54ae78;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h34bcc530a471f6cd;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000008;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_61 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9637908c46a1fb90);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd77084bfeb3c5b10);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h496625dbef232224);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fc343fbf);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h91254edf4c3f9b92);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb7a5e9e4586acb7a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h12ccd55f382ab1b7);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000092529f4d);
        if (err) begin
            $display("Vector 61: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 61: Keygen output correct. cycles=%0d", keygen_cycles_61);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_61 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_61);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000009d6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6a987345a24b12b6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h8c8667f544d685d4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9bb8107ab6f089c4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf41350034e15fe2c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h04c8c01ba6315268);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc65ad5eaaef80a75);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h397e7083d21a567c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcfbdcb743d208463);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5957ae9244b20aa0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h97aeb87ee3488423);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h54122e0dc188a66b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha519314c2ce14435);
        if (err) begin
            $display("Vector 61: Sign failed!");
            $finish;
        end else begin
            $display("Vector 61: Sign output correct. cycles=%0d", sign_cycles_61);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_61 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h04c8c01ba6315268);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc65ad5eaaef80a75);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h397e7083d21a567c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcfbdcb743d208463);
        if (bad_sig) begin
            $display("Vector 61: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 61: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 61: Verifier accepts signature. cycles=%0d", verify_cycles_61);
        end

        // ---------------- Vector 62 ----------------
        $display("");
        $display("========== Vector 62 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha96055e49c307516;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8b47d45ffa9d51f8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4c8ac046b582bbe8;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hbe65ce59382b2b4b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hcde058cacb6caaca;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hcd5efeafe2c93fb1;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hbeb674a342a9f7be;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4a6c87965437025a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd6b8175fe0c17626;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h54d9b377e64b79f1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf045407fbdcf70fa;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd1c103106c2fc9fb;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000048;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_62 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h10029c03396fa24f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb4b9d76c67879fc5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h5376b0cbae8a7796);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fcb6db53);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h28cce60507fbb513);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h626fa2aa1daeb6bc);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hc233bc8ebb5518f1);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000bb4a74d2);
        if (err) begin
            $display("Vector 62: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 62: Keygen output correct. cycles=%0d", keygen_cycles_62);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_62 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_62);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000005f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2c2e83d1eb178c30);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3fe85d7f1198fd76);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3b1382811bf2893e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'heb68631945831ca0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha100bd4ec137c856);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb633f20cbc1af8ff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hadf1acdf94a1eeae);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb55ded549d578e80);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h32b21918076b7594);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6a37f058cab53034);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h7ff5d31ef8d292b3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h97fbe7df31155b21);
        if (err) begin
            $display("Vector 62: Sign failed!");
            $finish;
        end else begin
            $display("Vector 62: Sign output correct. cycles=%0d", sign_cycles_62);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_62 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha100bd4ec137c856);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb633f20cbc1af8ff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hadf1acdf94a1eeae);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb55ded549d578e80);
        if (bad_sig) begin
            $display("Vector 62: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 62: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 62: Verifier accepts signature. cycles=%0d", verify_cycles_62);
        end

        // ---------------- Vector 63 ----------------
        $display("");
        $display("========== Vector 63 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h150b8db9d7181478;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h65ea3cb6643481e6;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd1ebe219e28286b4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h633cd8b0cbd11df8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha64d4abcc9f4d4a7;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hff50161a69046cd6;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3881e3e93cb847e3;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hab2a55c4a1842319;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2e8b46d6f5319196;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hac148a4669008189;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf319e9b0c6e76c56;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hccba75402cc1724d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000008a;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_63 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb8cf531bc9d9aac8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hddcb06d8d7f52fc6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h282cbf142cd0e422);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000004f4796c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4340eeb94ffea735);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h831806f7e075897c);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h55574e831760f247);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000fb5d8e0);
        if (err) begin
            $display("Vector 63: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 63: Keygen output correct. cycles=%0d", keygen_cycles_63);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_63 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_63);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000004d5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hcb704fb9fa7e6b56);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf56b792a68447602);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4a0ab74f36b37e00);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h56e764225871478c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h091f7c4b670158c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3369a650c9f3cba9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h25713a5eb5528c66);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd24208c28f64d8f5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9ef49cbf57c3dea3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1f156fec428e94a4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hce4a7cf439522740);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc4316d024e85d80f);
        if (err) begin
            $display("Vector 63: Sign failed!");
            $finish;
        end else begin
            $display("Vector 63: Sign output correct. cycles=%0d", sign_cycles_63);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_63 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h091f7c4b670158c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3369a650c9f3cba9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h25713a5eb5528c66);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd24208c28f64d8f5);
        if (bad_sig) begin
            $display("Vector 63: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 63: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 63: Verifier accepts signature. cycles=%0d", verify_cycles_63);
        end

        // ---------------- Vector 64 ----------------
        $display("");
        $display("========== Vector 64 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1ab166eee53e2f82;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hba5c005f04cbdbe5;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hbf647ced0c87dac7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h644192f4a127a691;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4bbb000f07bc11a6;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h82de33d016d7cfd7;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8aa702d3f279458d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6e03304b2547cb60;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h64c4ed52dcbdcd0b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h28a0d97500a37036;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf4d17f8798c5e919;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h25ac35c79646a251;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000003e;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_64 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h743d019ead47a4cf);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5e8fb0d032a56550);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h757cc9292795e975);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000057532f06);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h348d8c75ab9eabf0);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h60a00409819381b9);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he894ca8a4bb41147);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a021c75f);
        if (err) begin
            $display("Vector 64: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 64: Keygen output correct. cycles=%0d", keygen_cycles_64);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_64 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_64);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000b6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h597f57f5a0b8ebd4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h811e2083b4db1b53);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6dbdb9803a6d6656);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he17b3e2c3f865d1a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha7264e12f8523e96);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9347572b57a33b16);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8990c5cf2c54c01d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h72973771cf428fe6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he9b0fe79b521185b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6f4e24c7fa5f0a1f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3ec88ef0e7938001);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha39504bebc07ab21);
        if (err) begin
            $display("Vector 64: Sign failed!");
            $finish;
        end else begin
            $display("Vector 64: Sign output correct. cycles=%0d", sign_cycles_64);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_64 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha7264e12f8523e96);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9347572b57a33b16);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8990c5cf2c54c01d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h72973771cf428fe6);
        if (bad_sig) begin
            $display("Vector 64: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 64: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 64: Verifier accepts signature. cycles=%0d", verify_cycles_64);
        end

        // ---------------- Vector 65 ----------------
        $display("");
        $display("========== Vector 65 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h82ea1e01a32344b9;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7e203a81410064b4;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he9064129553e3f19;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd3dad4656c9577c0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7c19192b877a4ee7;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb63f0c50793e7a4e;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he4b83b2e5d0f6749;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6928b31a8e03cceb;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'had831c35790ba850;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h89d3ecc3d3f37b85;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3b9ed4f6dfdbf535;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd35b6e0d4b29ecce;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000057;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_65 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h03fa2182d44ebcc3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb0fe1cc3a6be11dd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h57ea02d1d306c92b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ddb48f97);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha669ab25feab0159);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h6c862695d6725a0b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hfc55f52bd7893fc2);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000066e08606);
        if (err) begin
            $display("Vector 65: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 65: Keygen output correct. cycles=%0d", keygen_cycles_65);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_65 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_65);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000299);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc5dda3cf3fceee73);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6edd205324f7749f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6dada0215affde20);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h89a92b0a116ddc36);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0d257fbb06175533);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd53e7c3ffa8b9cce);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5ecfddf2054ce171);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h893f7dd3448300ec);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h3496fc558fcb307f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h90f32aafd4a145ff);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9429f03603e88868);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hd00ed9267760ebec);
        if (err) begin
            $display("Vector 65: Sign failed!");
            $finish;
        end else begin
            $display("Vector 65: Sign output correct. cycles=%0d", sign_cycles_65);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_65 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0d257fbb06175533);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd53e7c3ffa8b9cce);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5ecfddf2054ce171);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h893f7dd3448300ec);
        if (bad_sig) begin
            $display("Vector 65: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 65: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 65: Verifier accepts signature. cycles=%0d", verify_cycles_65);
        end

        // ---------------- Vector 66 ----------------
        $display("");
        $display("========== Vector 66 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h162a28967541786b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h81f7d0c381923c18;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9cb720de586dd557;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h973aa5f81a4f141a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha290f1d5f26ab79f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hdc682e6622344392;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc970be2d9780b30f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h28c23fb0a98d60a7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h625c8309f87f053b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h18388079095729b4;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd22d0ccf04408ad7;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb82145fefc17c084;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000037;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_66 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hdb349fd68beb3e9b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8d6cfbcf4559a146);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h7ea1e96c71b6654c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000765de23f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h86988a8d72d0aca8);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha2b291113ed68d42);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd0e7d83bf1c6d61d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000055141b8c);
        if (err) begin
            $display("Vector 66: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 66: Keygen output correct. cycles=%0d", keygen_cycles_66);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_66 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_66);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000046);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hfa950c7c6243d811);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3415e474f02067e9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0fa198e196963cc8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h130117d152b332b4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he26e2ac3d3a588f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1d94c1dd2169ee65);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h22ee6a0412925cfd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h361bc97636604669);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h07f272e270f1e55e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc3b327b041b453c1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4e148f3d846d9b53);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha8921e32e265b1c8);
        if (err) begin
            $display("Vector 66: Sign failed!");
            $finish;
        end else begin
            $display("Vector 66: Sign output correct. cycles=%0d", sign_cycles_66);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_66 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he26e2ac3d3a588f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1d94c1dd2169ee65);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h22ee6a0412925cfd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h361bc97636604669);
        if (bad_sig) begin
            $display("Vector 66: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 66: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 66: Verifier accepts signature. cycles=%0d", verify_cycles_66);
        end

        // ---------------- Vector 67 ----------------
        $display("");
        $display("========== Vector 67 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h7f74a2744850706f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h769469fc6ed44351;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7188c77a50a6c2bb;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h569fa378e21c2991;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h916d1cb23b6058f1;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h04c31a28e35e0937;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h7bdb64cb225bdaa5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4978b851e0cccc45;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7da2b559a69e767f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hcea7c5e6b91ebd66;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha36d3d773ee910a4;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd24a7820d5dd4783;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000057;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_67 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hdf7ad2fad3a07879);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd7da60313684ff87);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h215c078a77f4038f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ae31ea1c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h48ce78a75cd82238);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hca61c549dcb14f59);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hc58da3f0b06c6f5c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000007bf40a2c);
        if (err) begin
            $display("Vector 67: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 67: Keygen output correct. cycles=%0d", keygen_cycles_67);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_67 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_67);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000021f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'had546ad8b300a71a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h245004e99226b3fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd626d12e8d165879);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h2aac4a690b8950c2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h53e1cf9848af734f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0199f3e375ad0167);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h68f2d637f915ad86);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h22c9f235e6c6f3ed);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcd2b70d15c4e49e2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h60d300d2b9435dcc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h37a80c007803d019);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h17494308aad6ad81);
        if (err) begin
            $display("Vector 67: Sign failed!");
            $finish;
        end else begin
            $display("Vector 67: Sign output correct. cycles=%0d", sign_cycles_67);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_67 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h53e1cf9848af734f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0199f3e375ad0167);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h68f2d637f915ad86);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h22c9f235e6c6f3ed);
        if (bad_sig) begin
            $display("Vector 67: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 67: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 67: Verifier accepts signature. cycles=%0d", verify_cycles_67);
        end

        // ---------------- Vector 68 ----------------
        $display("");
        $display("========== Vector 68 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h5ca3496abb4d01b8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hcdc1b2c255eafa84;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h95c5fb93519ea50a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h553af8348ed9e8a1;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he6d33ebd6203a24f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h300850e6c2b2ac57;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he658134643f10f49;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd64bf59a8c0f013a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1dd0264d56ea2f4d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7f3caef93d9126ad;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6ffd4bbf7ff1dfef;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4f633b64a61f01bf;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000025;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_68 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h229e81fae82ac11b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hdd87295037958740);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha3602d62ef972356);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b48c0ac6);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h29ade7c9fefa4113);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha4ccdf12c2354fd8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h28a472cb538a2cc5);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000883b5564);
        if (err) begin
            $display("Vector 68: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 68: Keygen output correct. cycles=%0d", keygen_cycles_68);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_68 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_68);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000b0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha888de0b1a182988);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2fa556284c00e067);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hac208e3c1df39a98);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h925a12b89f13e7ca);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h20faa0532e3eeb90);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h96fc2908e2ccec2b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2f615b9adbe9c6d8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc4d3a55093f5a9db);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1a3c03b69499ac21);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc4073e444938ba4e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h02b2c8a33e7bae3b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h69b7ef98a0eeed3d);
        if (err) begin
            $display("Vector 68: Sign failed!");
            $finish;
        end else begin
            $display("Vector 68: Sign output correct. cycles=%0d", sign_cycles_68);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_68 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h20faa0532e3eeb90);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h96fc2908e2ccec2b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2f615b9adbe9c6d8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc4d3a55093f5a9db);
        if (bad_sig) begin
            $display("Vector 68: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 68: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 68: Verifier accepts signature. cycles=%0d", verify_cycles_68);
        end

        // ---------------- Vector 69 ----------------
        $display("");
        $display("========== Vector 69 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h13eda9276eb8a077;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h6516912384851ddb;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3ed8b2ed1be8f2e1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hada75a6d6f961df5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h70cf839cf0a73ab6;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6dcf315c9bc9f792;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hff411cd571a4139b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8ea6fe44445c9d53;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4b2c5499dbdd4561;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2ab9f3b0ee2ef7c0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd3ce60f32d34a57c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbe45a2be1a4e7ef0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000076;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_69 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd546fe4b9d546aee);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hcf887505d4bbb664);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h825da969393913b2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000cee301f4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h06fa32be5929d0e7);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h12f8f83bfd7e860f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1b2242a91ac0d46c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003a0bd886);
        if (err) begin
            $display("Vector 69: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 69: Keygen output correct. cycles=%0d", keygen_cycles_69);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_69 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_69);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000033f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he2373b3e41072ca8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0fe97bd443b77a16);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h02f667a7531bf2e9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6dcaf4f889ba505b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2e4d4754f30f7cb4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h12660a5ebdb771e6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he3d7e020561d863a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4649cfe7c0fc68f1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7a4cfd2f2e80adae);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h7ba46130a5a87cc9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h04e8236882348a01);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb66e72c263c6350a);
        if (err) begin
            $display("Vector 69: Sign failed!");
            $finish;
        end else begin
            $display("Vector 69: Sign output correct. cycles=%0d", sign_cycles_69);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_69 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2e4d4754f30f7cb4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h12660a5ebdb771e6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he3d7e020561d863a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4649cfe7c0fc68f1);
        if (bad_sig) begin
            $display("Vector 69: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 69: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 69: Verifier accepts signature. cycles=%0d", verify_cycles_69);
        end

        // ---------------- Vector 70 ----------------
        $display("");
        $display("========== Vector 70 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hcdf615f1b87d7bfe;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h000eb57fbd3c40b7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5e0ec98b0240d28a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1318bea331d9234a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb0c438c71baf61be;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h80cc4b0205c1e4eb;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h5325a37f3ddb93ed;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h863b50e401134563;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h431fa5454b94588e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf56d02a7b3307d6b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf4b242c740769679;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcf96711c597f4c33;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000000;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_70 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3e91e72696d44121);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he2bdfd166687b720);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he85c0e38d25090d1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f62e603c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd0eb8f6e358be868);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd0d1eadcb6b8b4a2);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h59df746665d2b723);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000058da5beb);
        if (err) begin
            $display("Vector 70: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 70: Keygen output correct. cycles=%0d", keygen_cycles_70);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_70 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_70);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000683);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he608eebbf96e1abc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he540c61d8908bf72);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2691b54e410fdfee);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h725696ab468d1d58);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbf9e2b55306d2468);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h30fe7ce2256fa685);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8f44b1f56aa9c6cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0ca6955a795a043d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1042cde70f231254);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbef07f90abd24e84);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1de28c8f4dd8a5f8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6a4c27b0b0cbcbbb);
        if (err) begin
            $display("Vector 70: Sign failed!");
            $finish;
        end else begin
            $display("Vector 70: Sign output correct. cycles=%0d", sign_cycles_70);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_70 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbf9e2b55306d2468);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h30fe7ce2256fa685);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8f44b1f56aa9c6cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0ca6955a795a043d);
        if (bad_sig) begin
            $display("Vector 70: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 70: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 70: Verifier accepts signature. cycles=%0d", verify_cycles_70);
        end

        // ---------------- Vector 71 ----------------
        $display("");
        $display("========== Vector 71 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6ac78905e2832e17;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h17d58e4685cf5cf1;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h6dc85f701dc20072;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hfa71c5131544cfce;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc029987d7ebd2413;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hfe760d2318e082d4;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hcb1c5ec0fcd24f2f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h34d3d0f5fc941f4b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2d0861d0a46185e3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h711fc662a5f33996;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2f014c0a040c747c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'haa52369a213491df;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000005;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_71 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9f04d759fefc59a3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd017d50630ff696a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha08495356e6484dd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000002405c1a3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1456b6ad74a36383);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h70c4e754b18dea67);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1bccb9c57600c941);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000021adfaa6);
        if (err) begin
            $display("Vector 71: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 71: Keygen output correct. cycles=%0d", keygen_cycles_71);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_71 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_71);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000142);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7497d23d22219a5d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h73ddbbdf1ecccd8c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hee9fc1991e8f0742);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9c92ac0d1f0d0c5b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h226966f80621e1e2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8b032835d48a56c2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5e56871d6194a961);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h201e0845005f8c9e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb22d8ba0d05666c8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h25c301a40be9c130);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h6b9ff129937a4d95);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h380f87fdd769b3cf);
        if (err) begin
            $display("Vector 71: Sign failed!");
            $finish;
        end else begin
            $display("Vector 71: Sign output correct. cycles=%0d", sign_cycles_71);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_71 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h226966f80621e1e2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8b032835d48a56c2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5e56871d6194a961);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h201e0845005f8c9e);
        if (bad_sig) begin
            $display("Vector 71: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 71: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 71: Verifier accepts signature. cycles=%0d", verify_cycles_71);
        end

        // ---------------- Vector 72 ----------------
        $display("");
        $display("========== Vector 72 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0d3f498e42829d34;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h04daf70e36c5b504;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5823d430abb71620;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf75ff1ad094fb2eb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'habb9888c0d3723aa;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd6af37210a8539f7;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb743024bb454f5c9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hee8da6c446113c05;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h6626579f897374a0;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8b4c8f8c9b042bbe;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hee174dc600a8196f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h20913f7d3f5e4d0c;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000029;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_72 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h739aa4f5c7ff3496);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd6ec25ac271c46f9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h2b6a91acd0c48f3c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f21c7a43);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h92210496c04409ec);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3d1eaa0587f499d1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h57ec0dc93f41af94);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e92bcd41);
        if (err) begin
            $display("Vector 72: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 72: Keygen output correct. cycles=%0d", keygen_cycles_72);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_72 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_72);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000fa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h8443bbc70b9afe74);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb49caad3a66c15d9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h5e5c8b3bc48d24c5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha00acbe2f76effd2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2ba3686f788fb849);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4624ab5338d4c3a7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf368d8ef769b8229);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h28628b30d6dbd732);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9187882818c48de8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc3f98027fd4d16fb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h75cfc5c220a17003);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf759440468e8827e);
        if (err) begin
            $display("Vector 72: Sign failed!");
            $finish;
        end else begin
            $display("Vector 72: Sign output correct. cycles=%0d", sign_cycles_72);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_72 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2ba3686f788fb849);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4624ab5338d4c3a7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf368d8ef769b8229);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h28628b30d6dbd732);
        if (bad_sig) begin
            $display("Vector 72: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 72: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 72: Verifier accepts signature. cycles=%0d", verify_cycles_72);
        end

        // ---------------- Vector 73 ----------------
        $display("");
        $display("========== Vector 73 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4fe64c0c1f7f5a2c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7b3dff0bd5d0e232;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hbd80cefc5ed9ebcc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha5eee983ab5e71ed;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h715187a29d2d5131;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h332ddacf8d7ddb59;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h09b080f20604b69d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2c6890274dbef65b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb1f2f2cfe0b82f9b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h0aa88a560add313e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3f87380c211ba948;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1d34559f1cf2d095;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000058;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_73 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc25abc23883979ea);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h915c5579bfa3fedb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h58cf5247bb5a04d9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000009bfe92d3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf36a2dba9567f4a4);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h275123173b887fd3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1bb356babf20ecda);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000062500e2a);
        if (err) begin
            $display("Vector 73: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 73: Keygen output correct. cycles=%0d", keygen_cycles_73);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_73 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_73);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000004c2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb0ca46d9fd743b61);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf0d98bec1b9a130f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf8482250aba3ee17);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc3be16aceedd4d89);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8b7dcaeac497bd98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h19eac84a75aa35a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h20249e23f5e62d61);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h869f26cde34bf6e7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5f797d424f34cc6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h7223b08c1b08f3b2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h60d29b561b429dab);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h30189e59029c8dc1);
        if (err) begin
            $display("Vector 73: Sign failed!");
            $finish;
        end else begin
            $display("Vector 73: Sign output correct. cycles=%0d", sign_cycles_73);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_73 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8b7dcaeac497bd98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h19eac84a75aa35a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h20249e23f5e62d61);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h869f26cde34bf6e7);
        if (bad_sig) begin
            $display("Vector 73: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 73: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 73: Verifier accepts signature. cycles=%0d", verify_cycles_73);
        end

        // ---------------- Vector 74 ----------------
        $display("");
        $display("========== Vector 74 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h88350d232d44288c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h06e747ae858fb4d0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd90d188cc5cdcaac;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf8bf7191b206e9b0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5301e8320b4aaddf;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hfe2894190597d359;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h70a2dcf28acba6e8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h63da82038a51c32a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he90ce88002fe3d46;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hfa39666696a52c8f;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h203e55403a6e5463;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h22efd8f248d67fd5;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000019;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_74 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4fbcb23defbe8d47);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9e44c776d259f3b0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hcd917c332926c50f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a022c13f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3b82ad2500b63773);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h14c7258ffbd5a8db);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h3fbd19e6339f443f);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000060d42596);
        if (err) begin
            $display("Vector 74: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 74: Keygen output correct. cycles=%0d", keygen_cycles_74);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_74 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_74);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000020c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9a5e0ddf055eaa92);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h72606a1a13095dae);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4ae5bc3504d8b82d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9e8184f537acf17f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0f313dff127b5e33);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h595cc53c3eeda23b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf99d30c210ad63a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6958675b0a83f55f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h85daaf0cf9c971f4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha9f06a8cbb49509e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9ca7ef67048e6edd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf0a6f0b6d6583ecd);
        if (err) begin
            $display("Vector 74: Sign failed!");
            $finish;
        end else begin
            $display("Vector 74: Sign output correct. cycles=%0d", sign_cycles_74);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_74 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0f313dff127b5e33);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h595cc53c3eeda23b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf99d30c210ad63a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6958675b0a83f55f);
        if (bad_sig) begin
            $display("Vector 74: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 74: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 74: Verifier accepts signature. cycles=%0d", verify_cycles_74);
        end

        // ---------------- Vector 75 ----------------
        $display("");
        $display("========== Vector 75 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h68348d41383e26d8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h411c6700f1ac61ca;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8aa9b55139d53e5f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h948852ec2db77535;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h3789b2a68a2fe678;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9d05e99058d7a486;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h7f8adbb4e98940b2;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he7a03717e460273f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd63976dc81041840;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7de7f7097ec283d5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h61613b1fdac104b8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h46411fa2ed815aec;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a6;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_75 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h00a18a4eb1f929bb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5b9f677e94617171);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h42ca8fa08f99ae4c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000076472766);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb9c826dc682954b7);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h324f83c2a8a71ce1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h4879b6ab5ac71909);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003b6aa04e);
        if (err) begin
            $display("Vector 75: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 75: Keygen output correct. cycles=%0d", keygen_cycles_75);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_75 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_75);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000010d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h936c650946e614e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1be4dd6ca747fbad);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf302d063d01aa430);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6090e2be9541aa34);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hffe7abb5806f8262);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hddf1aeeac29914cd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfa00a5a81b82ce0f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h059018987d269d90);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h372f89a6a7d8aa20);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h977198367b030fcc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf2a2396d8880e35a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h18c17fdfb1c7c15d);
        if (err) begin
            $display("Vector 75: Sign failed!");
            $finish;
        end else begin
            $display("Vector 75: Sign output correct. cycles=%0d", sign_cycles_75);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_75 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hffe7abb5806f8262);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hddf1aeeac29914cd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfa00a5a81b82ce0f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h059018987d269d90);
        if (bad_sig) begin
            $display("Vector 75: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 75: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 75: Verifier accepts signature. cycles=%0d", verify_cycles_75);
        end

        // ---------------- Vector 76 ----------------
        $display("");
        $display("========== Vector 76 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc2330f7417e5ca75;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h207a1174957bf1a2;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h29e28b46058c8565;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1e7e188ae1092e1f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h28e0f974c3c5aa2a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h18bb493f824d8e00;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h856a99b4250f0593;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd61821fa97febb92;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h69ac2abf97e482bd;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h80e5c40d800481fb;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2f769e7920ddbcc9;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcaeeadd08ff878e5;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000cd;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_76 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h48e4a0bfe713fbd1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7f9228be8f72076f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha8e2bef29896a992);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000024b6784f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h8f1f4ce73a639e21);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h67f344e61e88fd35);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hc6b4d5cb31f2df14);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000fae5ef7c);
        if (err) begin
            $display("Vector 76: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 76: Keygen output correct. cycles=%0d", keygen_cycles_76);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_76 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_76);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000147);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc927f24dd7296843);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h44a85f6949981355);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1caf06cbb0014b7f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'heedfe45e95c93df4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8bebed35646a61aa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3f7878c6d66f0ee7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc84059df94707e2c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h52e342fccae479ed);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h297363ae6f87657d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2ee0973b23ef24f4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd48268e0830f8eb8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h3e57d6a830a28495);
        if (err) begin
            $display("Vector 76: Sign failed!");
            $finish;
        end else begin
            $display("Vector 76: Sign output correct. cycles=%0d", sign_cycles_76);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_76 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8bebed35646a61aa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3f7878c6d66f0ee7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc84059df94707e2c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h52e342fccae479ed);
        if (bad_sig) begin
            $display("Vector 76: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 76: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 76: Verifier accepts signature. cycles=%0d", verify_cycles_76);
        end

        // ---------------- Vector 77 ----------------
        $display("");
        $display("========== Vector 77 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h96ffd6e7e90a4832;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7e922a0f67441cb7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8c3bc71c86879b90;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc29b877b3df4dcf8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h781c4a096ea03517;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha50f4981a5c57063;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he43cf499ee485b49;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb8ad5fe813ddc538;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he470a0e079df6a46;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdc9be50de3124024;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf888c5fa3c908381;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1a141e000fc9d614;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ed;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_77 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h85e9f2de561bc8d5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h35032096a0acced4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h93d08deb38b8c7bf);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000916f3d86);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3f7176a6fd86eafd);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hab081a7f406f9561);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h483937c686350ec8);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000006af8fe92);
        if (err) begin
            $display("Vector 77: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 77: Keygen output correct. cycles=%0d", keygen_cycles_77);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_77 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_77);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002cd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he8a894cf091371a8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h10a4ce2632ba9495);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hcc4e13618b8ff2b6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he073f3096e80f7e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hdc579d954dbe057f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0a4a9ae98c325541);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h89036c8ce53bb9e6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h62b68c466ca87132);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5f454c6d78f0e9b6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfab956a9f6c2c664);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h63b294a5eb5e8a35);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h066f66a77d3bd3a8);
        if (err) begin
            $display("Vector 77: Sign failed!");
            $finish;
        end else begin
            $display("Vector 77: Sign output correct. cycles=%0d", sign_cycles_77);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_77 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hdc579d954dbe057f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0a4a9ae98c325541);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h89036c8ce53bb9e6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h62b68c466ca87132);
        if (bad_sig) begin
            $display("Vector 77: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 77: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 77: Verifier accepts signature. cycles=%0d", verify_cycles_77);
        end

        // ---------------- Vector 78 ----------------
        $display("");
        $display("========== Vector 78 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h48646d8f160849ef;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hcf922c6aefa8c807;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h617532f0fba2ecb8;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h502886e130ef48f1;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd63aa33b0d557632;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb3aa51f80f9cc544;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3a640851f948bd58;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h257ccb4a8b0b796a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf8681a64612abe05;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h74c57f00bddfa677;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hca1424b047ef65ea;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'haea1f7a3648aacf5;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ad;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_78 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2fb3b23515732d43);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1ee154ae22f5e236);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hdb41c0d3b9c01534);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000006bb0542d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9166917c921f5d60);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h30b509eccda5b455);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h144ec70f377c291d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005ba50809);
        if (err) begin
            $display("Vector 78: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 78: Keygen output correct. cycles=%0d", keygen_cycles_78);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_78 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_78);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000745);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0661ff73256acc48);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'haa51897a5c727906);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h312b8f25314f7265);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hcf8acf6b378586fb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h290f83653201235a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h27260d6e5cb94e2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h228c18d4e786a130);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e89801c482e3760);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4ba835af4331bdb4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3fca442474f7bcfa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1f2b03cd5977ddd1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hddc7bf5421cb474b);
        if (err) begin
            $display("Vector 78: Sign failed!");
            $finish;
        end else begin
            $display("Vector 78: Sign output correct. cycles=%0d", sign_cycles_78);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_78 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h290f83653201235a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h27260d6e5cb94e2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h228c18d4e786a130);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e89801c482e3760);
        if (bad_sig) begin
            $display("Vector 78: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 78: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 78: Verifier accepts signature. cycles=%0d", verify_cycles_78);
        end

        // ---------------- Vector 79 ----------------
        $display("");
        $display("========== Vector 79 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h490b6971e9fa97e6;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h95c9d9dc1aa46ecc;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc90d2cb0f0825395;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb1a3241fd8f1018d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h2a5d07f6f2d1b916;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he45b447a71a91b9a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc6d2f2c86d30a202;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h524b970db8701b89;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h5ed1bb1b2507b90e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf5cb850cde8e4cfa;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2f453a8f1feb151c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h650e1a9e0c1d5cb1;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a0;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_79 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hca842cb4171e00d1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h43c1a240c1e34e90);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h7633dcebaa577f75);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000008bcb816e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h83529f794363ccbe);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h602e34c74dfbd5c3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h4014e47700d4ddac);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000299cff3a);
        if (err) begin
            $display("Vector 79: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 79: Keygen output correct. cycles=%0d", keygen_cycles_79);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_79 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_79);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000022);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'habddef822fd33f47);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h021998b72fdf96b2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha44135bb5634f0d4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6a85bd8965b0ef73);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbad05cae68e8b745);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h150b9bf01e01fdac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h185c42e23cb89c3a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h43d709fc18977fbf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd097e6596c130f8f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1dc4a44500790af8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2507ab6005afe13d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5109d3c8268e80c0);
        if (err) begin
            $display("Vector 79: Sign failed!");
            $finish;
        end else begin
            $display("Vector 79: Sign output correct. cycles=%0d", sign_cycles_79);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_79 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbad05cae68e8b745);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h150b9bf01e01fdac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h185c42e23cb89c3a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h43d709fc18977fbf);
        if (bad_sig) begin
            $display("Vector 79: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 79: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 79: Verifier accepts signature. cycles=%0d", verify_cycles_79);
        end

        // ---------------- Vector 80 ----------------
        $display("");
        $display("========== Vector 80 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'heac2636060f9826e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h536a136b9286f219;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2964a68153c9e088;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd47dee59ca3a6eb3;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h34d99f5ed20a1cc5;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6bd324e0b5c70c42;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3123631c1bc9c2c3;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h31fd5c63f844fa42;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8dc8f5ab243370f7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc460fe42f1135408;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hccfd09d11529a617;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfb17c1ea1678da08;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000eb;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_80 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h060942296370e5cc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha840c0935b3f93f0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h07c4f5061d9cecd3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ad495929);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h964c0d4fb5c1203c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h23d0242b334a8c7d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0bfd779665349685);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000059bfd7f0);
        if (err) begin
            $display("Vector 80: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 80: Keygen output correct. cycles=%0d", keygen_cycles_80);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_80 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_80);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000a6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1c056675c5d9d571);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h8cd64546267e8d97);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h49106c28ba67ca60);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6a6c56fbd3ad6ebf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h145d521bb2166270);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb8975b36b4f56fb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3a1fcaccfb37986f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbd2159991acf8afb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h84d0aeb5b68a4bd4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h50d15588f6a05061);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf87770ac786a95a6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h68baff5167806443);
        if (err) begin
            $display("Vector 80: Sign failed!");
            $finish;
        end else begin
            $display("Vector 80: Sign output correct. cycles=%0d", sign_cycles_80);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_80 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h145d521bb2166270);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb8975b36b4f56fb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3a1fcaccfb37986f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbd2159991acf8afb);
        if (bad_sig) begin
            $display("Vector 80: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 80: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 80: Verifier accepts signature. cycles=%0d", verify_cycles_80);
        end

        // ---------------- Vector 81 ----------------
        $display("");
        $display("========== Vector 81 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0f5fb1ae0f5f9d25;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h85003dade8c5b7cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7969c1a6f4eef152;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h5063697c75d82e8b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h39d1ad113f51f9b4;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9318e2b21e14a169;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4de222e23dd120f2;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'ha0173ed1126d4d2d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7eef847237b6e1c4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdcecf7ef4b124040;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7701ecb276bcafdf;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h86abdbc1f04c3e8b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000032;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_81 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h8611bea25da20084);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd2e2662ad9b9a067);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h52aa6eeb681f6490);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000656b3efe);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h822405f3de891ec5);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he1702d5cf6a0b75f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h69e5b288156a894b);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000018898ce0);
        if (err) begin
            $display("Vector 81: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 81: Keygen output correct. cycles=%0d", keygen_cycles_81);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_81 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_81);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002a1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hfddcfd7fb6201788);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6a4474b28a56e06f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h592c33d05bfb674d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6a6485db56716be9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h85015fe2f0dee27b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8861375d264f32e1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h587758c73e9fd196);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hda430f8122060055);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h99628b6ecc08faed);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h8f746b2132c58b5e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9c87a9bd451a0c44);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2de3732250a55df8);
        if (err) begin
            $display("Vector 81: Sign failed!");
            $finish;
        end else begin
            $display("Vector 81: Sign output correct. cycles=%0d", sign_cycles_81);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_81 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h85015fe2f0dee27b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8861375d264f32e1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h587758c73e9fd196);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hda430f8122060055);
        if (bad_sig) begin
            $display("Vector 81: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 81: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 81: Verifier accepts signature. cycles=%0d", verify_cycles_81);
        end

        // ---------------- Vector 82 ----------------
        $display("");
        $display("========== Vector 82 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h074fdd9a77533290;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h66d4166473547475;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf382d0fe41f5429d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h073c5fb0bae1d8d7;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h392a3abc41d7d31b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h878680b9cb47adb5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9eb9919ea03f5ce0;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hed879c7f54311bf2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h255110c2f0049a39;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1fb85db630a95dde;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hbbce9cff86a2685c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h9c9664802d7fe40b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000002c;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_82 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc09155b7ea4006fb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2b7291759d56872e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd3b591827e639430);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000002488684b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5e52ef83d922544c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h2847a5a34ba72e96);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1ecd34bcaf8c5ada);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000030b3bd69);
        if (err) begin
            $display("Vector 82: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 82: Keygen output correct. cycles=%0d", keygen_cycles_82);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_82 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_82);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000ed);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1f4230b8dbaabb6f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hceccdb2837053d2d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hfb0c493f40f839f4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h356d3c4a9f521121);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6a53aab8b6ddbf2a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h267cfb11f402e198);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h238e129c03e1441d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he3aaf096daa56a9a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h06167129ea813440);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hcbf27ce183849d1e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbefbde3b6eb00dc1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h06375dec6a12070e);
        if (err) begin
            $display("Vector 82: Sign failed!");
            $finish;
        end else begin
            $display("Vector 82: Sign output correct. cycles=%0d", sign_cycles_82);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_82 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6a53aab8b6ddbf2a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h267cfb11f402e198);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h238e129c03e1441d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he3aaf096daa56a9a);
        if (bad_sig) begin
            $display("Vector 82: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 82: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 82: Verifier accepts signature. cycles=%0d", verify_cycles_82);
        end

        // ---------------- Vector 83 ----------------
        $display("");
        $display("========== Vector 83 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1d0aec9946857ba7;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8cd41cd08ba40b5c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h84788ea765420b67;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h324e33857ee2a86d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hdcae98cdbf752900;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h36736ae968ed0cac;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha4361d320493fba6;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h872391bfb31a7c73;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h3898251ae8c74137;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3ed59adbeb14662a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h62cd4a00e917bdb2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h5492a4414313d44c;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000fd;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_83 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf1cff8e59a1e6d99);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h609f99581f74ffee);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hbe32bae40153aeb1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000006bfe1278);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4fb6466d622d5e64);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h756b0995670bb973);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1e0b5c8c0eaf1bb7);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000047834b44);
        if (err) begin
            $display("Vector 83: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 83: Keygen output correct. cycles=%0d", keygen_cycles_83);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_83 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_83);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000bf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hbb560a763d28a61e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hea4f45fb35e7e6e4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h130b50c5185e786d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h90b081d499be841b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h370149ad85e9e33a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9a04c3f97e036cbc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdd946b4275cca2dc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h52a2bac60a4a6fc2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hbfb318626484bfc8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3c618d9451d9b541);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9fdbe572bad3d643);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h939fa1b6b6caf966);
        if (err) begin
            $display("Vector 83: Sign failed!");
            $finish;
        end else begin
            $display("Vector 83: Sign output correct. cycles=%0d", sign_cycles_83);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_83 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h370149ad85e9e33a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9a04c3f97e036cbc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdd946b4275cca2dc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h52a2bac60a4a6fc2);
        if (bad_sig) begin
            $display("Vector 83: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 83: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 83: Verifier accepts signature. cycles=%0d", verify_cycles_83);
        end

        // ---------------- Vector 84 ----------------
        $display("");
        $display("========== Vector 84 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0f6f75b9436e9c9a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd2ade30c9c03431f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc85fb96e3444bccc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h649ffc7c7480aae5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hbef2df1c3a226bd3;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hfaf33d2e29c26fb3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9cb6cd0ddfe832a9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h31bef28e51a4356c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1646892af50d5d6a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3595e44b5e9a9f74;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7f779b71c19fe4a8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h23bc6b9e6f2183e0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a3;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_84 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h209b8541900a23dc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h628707ac69fe5f59);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h74f304b3cfc53287);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e8513f92);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc85582e3df9d2408);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h787707b32053df8a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbed00dc0bfc23c74);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000dff464e2);
        if (err) begin
            $display("Vector 84: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 84: Keygen output correct. cycles=%0d", keygen_cycles_84);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_84 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_84);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000676);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h08f37537fd9ee9ec);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h010cacb319afc3e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7f919ae183ad1dad);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0fbe17a3f2aff471);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h94f2c7f37f8bbdf1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6c73bd90833190fc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hde442a0286c2aadd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hef938d9a10fa78eb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h04982daee2979c1b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h445ab768a4a71403);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h521dae278fa34ed3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hcbaf7efb39579b7f);
        if (err) begin
            $display("Vector 84: Sign failed!");
            $finish;
        end else begin
            $display("Vector 84: Sign output correct. cycles=%0d", sign_cycles_84);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_84 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h94f2c7f37f8bbdf1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6c73bd90833190fc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hde442a0286c2aadd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hef938d9a10fa78eb);
        if (bad_sig) begin
            $display("Vector 84: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 84: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 84: Verifier accepts signature. cycles=%0d", verify_cycles_84);
        end

        // ---------------- Vector 85 ----------------
        $display("");
        $display("========== Vector 85 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h255ff62076bf21c3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h637a99f5caa9aaea;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7e1ebda3a89344bc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h83f87479970d7a19;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1eacac968da04532;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc573ecd8ede60d8f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd73186ea6069ba9e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h0160c4628be9c01d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb764d049e104f849;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h659606ca302b13b1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he1ed918a93d27a2e;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h80dbda2a3139532a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ec;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_85 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h0c6021fd1386b7d3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf11cf2a6fe27053b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hc91dcde776856736);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001b4e6bf8);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9a85250df4216d85);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb1ac59675e884425);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hba7be15ba8bf0be2);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000b592d41e);
        if (err) begin
            $display("Vector 85: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 85: Keygen output correct. cycles=%0d", keygen_cycles_85);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_85 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_85);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000113);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0d2a598c4592eb57);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdc54935985b70623);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha6b15c70596fec75);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd924b2481f15baa3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb074a12a633f71f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h94ebe3b324bbfed7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd75f6a0dff744f13);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h519d080666c8215f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2549a6e28bbdb2a2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h70d53b091701b510);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h569d66c4f0f1d76f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4a2d0a0f73f6d534);
        if (err) begin
            $display("Vector 85: Sign failed!");
            $finish;
        end else begin
            $display("Vector 85: Sign output correct. cycles=%0d", sign_cycles_85);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_85 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb074a12a633f71f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h94ebe3b324bbfed7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd75f6a0dff744f13);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h519d080666c8215f);
        if (bad_sig) begin
            $display("Vector 85: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 85: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 85: Verifier accepts signature. cycles=%0d", verify_cycles_85);
        end

        // ---------------- Vector 86 ----------------
        $display("");
        $display("========== Vector 86 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8f118a5428a87e4a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hee047236b878d47e;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hdaba9dace73c23c1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h918910d0e6ff07ad;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7017e6809bdc2995;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8324adaf3c0176b2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc403363edab3ef31;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hefff7eeddd1ffcdd;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h086dca7b18f64db4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9f54aa96c3b0d830;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha537c7f12ddb0fda;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h185736a9bb66bfa0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e3;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_86 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h95d8494f93e0f5fa);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9534f5957d8b573a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h45ed115f3b3a75a5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fb27c9a4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hdfc3ea33930c914a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3b7bcce51fe3f9db);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hc1aadd519e6c49b4);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000007612668);
        if (err) begin
            $display("Vector 86: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 86: Keygen output correct. cycles=%0d", keygen_cycles_86);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_86 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_86);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000054);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7ece7a404f87ba25);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hae90aa3c6ac09d6b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4d94d6f5455e3b3d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb1bc8caa3eeda3cd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc24af5089782ebf2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h37db832654251fbf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7e010e555c66b743);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6ce3104861a88ed7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9b961dab57f05efb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hee060e0d79aa5254);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h7f074de95a609a85);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf8026e16ff802c4d);
        if (err) begin
            $display("Vector 86: Sign failed!");
            $finish;
        end else begin
            $display("Vector 86: Sign output correct. cycles=%0d", sign_cycles_86);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_86 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc24af5089782ebf2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h37db832654251fbf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7e010e555c66b743);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6ce3104861a88ed7);
        if (bad_sig) begin
            $display("Vector 86: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 86: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 86: Verifier accepts signature. cycles=%0d", verify_cycles_86);
        end

        // ---------------- Vector 87 ----------------
        $display("");
        $display("========== Vector 87 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0d6c18ddd3bfc3bb;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h593e56e21414ffae;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h870a475964411a50;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9fcadc927619eef5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he6e3a0a2b498711d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hfbd2842042565b8d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hdbd7aa9349f10eaf;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6b5405a371af04e9;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7d2a460179652355;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6fd2692925e8e0d2;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7eecf593f1c2302b;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6cd4d9e017a1ba68;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000008;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_87 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'heb65a7ccc522e182);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h0ce5f0de0e87025d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0fdf5e02108d1adc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000066530e31);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h950847ee40658fb3);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h60bbd608fe3ef698);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hfbba2c9fbbccb4e6);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000083dc44f6);
        if (err) begin
            $display("Vector 87: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 87: Keygen output correct. cycles=%0d", keygen_cycles_87);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_87 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_87);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000c4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hef0ca05d546b7010);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb1b2d060d221d214);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4a6d542efb742b4e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb926da2b385aeff2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c104d1d1eecda82);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h15e63f59fd15ecaf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h99295b646556f99e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4c147be1bbc0eab6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1f4e2e5abb8bb8f5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4fb6515124e85469);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h659d57940dedaf54);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2d138d9a1136afab);
        if (err) begin
            $display("Vector 87: Sign failed!");
            $finish;
        end else begin
            $display("Vector 87: Sign output correct. cycles=%0d", sign_cycles_87);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_87 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c104d1d1eecda82);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h15e63f59fd15ecaf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h99295b646556f99e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4c147be1bbc0eab6);
        if (bad_sig) begin
            $display("Vector 87: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 87: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 87: Verifier accepts signature. cycles=%0d", verify_cycles_87);
        end

        // ---------------- Vector 88 ----------------
        $display("");
        $display("========== Vector 88 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h3d9891d617fb216d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3c6fd4fc6351b224;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha76190cadd6ef9fe;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hfec033b4e8c133fd;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1ec793665fe10759;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hbcd80428db3d9271;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hcc28fbb34fb0279f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h84a7072d698df0f8;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h68b2efc99c4e139c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8a8f0daea96e32b4;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h87fd05e6ce55b7ff;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8a9cb9aab31283ce;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ea;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_88 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3db599219df09573);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb4ca0e1a09cdf1df);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hefd7ac72311b25b1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f6427a8f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf7cfc331b4c028ae);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h75634134b160419b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h3302f8d4b2c993fb);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000bc15fa11);
        if (err) begin
            $display("Vector 88: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 88: Keygen output correct. cycles=%0d", keygen_cycles_88);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_88 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_88);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000025);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h399cbd084a83e91a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h63b69aa5d9282541);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf13cb6cb7ab7568a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd9c246ba946eaece);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4dc4f6675c0006f3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h50d7270e7c8b1157);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h81ab45fe68a29142);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb497643bc6d5eb75);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1344c20548dcccdb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2af63f9e2138389b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h44b35b87b86d472b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h56afa85c2f04ce3f);
        if (err) begin
            $display("Vector 88: Sign failed!");
            $finish;
        end else begin
            $display("Vector 88: Sign output correct. cycles=%0d", sign_cycles_88);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_88 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4dc4f6675c0006f3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h50d7270e7c8b1157);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h81ab45fe68a29142);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb497643bc6d5eb75);
        if (bad_sig) begin
            $display("Vector 88: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 88: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 88: Verifier accepts signature. cycles=%0d", verify_cycles_88);
        end

        // ---------------- Vector 89 ----------------
        $display("");
        $display("========== Vector 89 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h7acee0dcc14bba01;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2184f27374f36b59;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h408652145f548f86;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3c46762374c47c16;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc937ae76ae71c2dd;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h05723eddf4002242;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc58f9d2ebc87f140;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5a4a9806ccc899cf;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0fe62098a3e78711;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2b95fd567002dfb4;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h31bae3f582dae56a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf32183cb616f5bb1;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000094;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_89 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd4a670bab6898af8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h75159bc2c1d7d337);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1527b13454f685f3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a98fdecf);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h83231ca55691fb52);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h811b2ba0b3a5e075);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hf793bc16fabe6901);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000011baecb9);
        if (err) begin
            $display("Vector 89: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 89: Keygen output correct. cycles=%0d", keygen_cycles_89);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_89 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_89);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000003d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdb3aea272115fefe);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hcc40d2764fb9a071);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2bae77d008ea3f61);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6c55e395b410d347);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h71920900e80070d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h514ddb5eea4730bb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha7fdfbe915c175b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h96906b4701c99e51);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2e33c3c961b56e12);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hedf127f197c0b9ad);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb4d699ac4a3d1ea2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5bf746035bec9c47);
        if (err) begin
            $display("Vector 89: Sign failed!");
            $finish;
        end else begin
            $display("Vector 89: Sign output correct. cycles=%0d", sign_cycles_89);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_89 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h71920900e80070d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h514ddb5eea4730bb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha7fdfbe915c175b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h96906b4701c99e51);
        if (bad_sig) begin
            $display("Vector 89: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 89: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 89: Verifier accepts signature. cycles=%0d", verify_cycles_89);
        end

        // ---------------- Vector 90 ----------------
        $display("");
        $display("========== Vector 90 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdd34154089482aed;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h6201937d1e83fab8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1cf3a509f00c08c1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hfb8968f6306e5775;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h681a8e559799d4fa;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb409cea801d10f5e;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf398f5187257d620;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf634518be7a78cca;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h41867812599e041c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h4e34af46e322b6a0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7e8c1cc67e7d95fd;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd7216cda91905cbd;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000020;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_90 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h7e7478db3d777b7e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h10d1323db0759507);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h68afdfcdbceb3fdc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000013cb3cd3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1dd37c0e548eac7f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'heef095e23af39fd5);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5d5889852f333d65);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000004dc8a8d4);
        if (err) begin
            $display("Vector 90: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 90: Keygen output correct. cycles=%0d", keygen_cycles_90);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_90 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_90);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000441);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he41e8bab1c0e5d88);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb15abfbfc295be83);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd435c02e0543669f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he867b9ed2d6bf6c0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcebd7024c15a3687);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc45f6c05621a33c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9aef016734c8f679);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hedbcf13786caad05);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb7b4fdc6fa723497);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h32fa2b699da8e3a3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd556133108bcba65);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb40c8b722e26be84);
        if (err) begin
            $display("Vector 90: Sign failed!");
            $finish;
        end else begin
            $display("Vector 90: Sign output correct. cycles=%0d", sign_cycles_90);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_90 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcebd7024c15a3687);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc45f6c05621a33c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9aef016734c8f679);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hedbcf13786caad05);
        if (bad_sig) begin
            $display("Vector 90: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 90: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 90: Verifier accepts signature. cycles=%0d", verify_cycles_90);
        end

        // ---------------- Vector 91 ----------------
        $display("");
        $display("========== Vector 91 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hd0d59f98d7d09bd5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h757eed4814adafbb;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h40a35b8d11d19542;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb1f3d44a8dfc4528;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h2b362a41729bf790;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hdc5817bf414db266;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6029e3fc4fb1a74c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3c7740f455dbb550;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h511d995d5e56d3a8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h752014ecdc48bb14;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hdb96d713187cb1d8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h99cab6da7836eee6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000002b;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_91 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h66092ba400d7f40f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h48b0c86a28145bf9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h02e8b6c010db77d9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001812e5de);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd08b4e0ef526b1b7);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc6f0fd8ac1e6b6e3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hf8aef93434744f21);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005cad10af);
        if (err) begin
            $display("Vector 91: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 91: Keygen output correct. cycles=%0d", keygen_cycles_91);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_91 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_91);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h350f42c1e43996db);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hcd4155971ef0cf29);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h05547f32fe427e86);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9f508ee7541cc47d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7daee7cf196bd5b5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0176effb4d119a92);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd7c455c3122b3913);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h37a82924d8b595b4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf544f50c7e83f14f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf42e88b16c1e2daf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0e356332b0efe7f0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5b2fe8d1309d50c4);
        if (err) begin
            $display("Vector 91: Sign failed!");
            $finish;
        end else begin
            $display("Vector 91: Sign output correct. cycles=%0d", sign_cycles_91);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_91 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7daee7cf196bd5b5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0176effb4d119a92);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd7c455c3122b3913);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h37a82924d8b595b4);
        if (bad_sig) begin
            $display("Vector 91: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 91: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 91: Verifier accepts signature. cycles=%0d", verify_cycles_91);
        end

        // ---------------- Vector 92 ----------------
        $display("");
        $display("========== Vector 92 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h460c8065e690f6d8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3e4ab1e710d76136;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he5e941f0594da406;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'haf618e6fd4ed48ae;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h6c5f9ed0e3302eef;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h81868c4c687d53e0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0eb8bfb47c2b3afe;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4e1ea60f3522ddb7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h25980a89d3f8500e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha90baaf87b02c4cb;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h85d9fbb67e4d90a1;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hae1ac9e92b3902d7;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000051;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_92 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he369568be11c756f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2fe16ad484810027);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hefc870ea7e4e9fc0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f7ac3790);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2c15428f4a0cf82f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf2a9198552a97388);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1b7e6de7db335f5a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000075203547);
        if (err) begin
            $display("Vector 92: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 92: Keygen output correct. cycles=%0d", keygen_cycles_92);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_92 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_92);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002ba);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9cdc92f1b82dbc0e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h42731df49647ff8a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hdc2112fe24f11071);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h606784e125f5d9e1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he1d420fd750378f0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9a9027fd74587ded);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9688f139e391bf7f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfb1fef17d27ba658);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc1ea7270628f18ac);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2a844c2882c53540);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc9cc1e38ff5f5a10);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h123c650ff3756249);
        if (err) begin
            $display("Vector 92: Sign failed!");
            $finish;
        end else begin
            $display("Vector 92: Sign output correct. cycles=%0d", sign_cycles_92);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_92 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he1d420fd750378f0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9a9027fd74587ded);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9688f139e391bf7f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfb1fef17d27ba658);
        if (bad_sig) begin
            $display("Vector 92: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 92: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 92: Verifier accepts signature. cycles=%0d", verify_cycles_92);
        end

        // ---------------- Vector 93 ----------------
        $display("");
        $display("========== Vector 93 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h3646f5cf517a74d0;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hdbcc97be9504117b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8aa58bf3cc3537d7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9a2f2eb953f2c6ed;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h96eb45d62fbd7645;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc6e90b069db99cd9;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h824e5f600f0cace1;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h9c123a96eea08c39;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h719f01b4aa2a64d8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb7bb2b89b3ef8725;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h97bc85ab9b221628;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he929cadb1ef33199;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000070;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_93 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h6f64cd475d69cfce);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9770b9ce4f7002fc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he0c9bfe33ce0c60e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000033a9243d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he0f0775faf83c597);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h386da873c7105ff1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h78e0543af80dc8d3);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000646537a2);
        if (err) begin
            $display("Vector 93: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 93: Keygen output correct. cycles=%0d", keygen_cycles_93);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_93 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_93);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000109);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc06b6c5f585a30e8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf15e3ea9822b8f8d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h44f938b9b0f94d6f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0bfa06f68c15a819);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h895fc06a041de159);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9373871ecfb55909);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h62396af823d0d513);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfa821146d1e69e51);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7e19284c64c62fd0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9cfd77be65e9d0b0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h56958559dbc5a71a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h22c562d17c2f34da);
        if (err) begin
            $display("Vector 93: Sign failed!");
            $finish;
        end else begin
            $display("Vector 93: Sign output correct. cycles=%0d", sign_cycles_93);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_93 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h895fc06a041de159);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9373871ecfb55909);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h62396af823d0d513);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfa821146d1e69e51);
        if (bad_sig) begin
            $display("Vector 93: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 93: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 93: Verifier accepts signature. cycles=%0d", verify_cycles_93);
        end

        // ---------------- Vector 94 ----------------
        $display("");
        $display("========== Vector 94 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hfb1ff7c3f3c655ae;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha895bdb99eefaf64;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd0f34fbc0059c257;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h299c43c7a18a2b94;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h838e6aa1bf03e722;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h278b3683c98fb336;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h855b4625d72ec101;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb89f5ef9cead152f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0b7552fc21eaeec9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9e2a51cf6431bd1c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hfbccab2c2c5750da;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfa9c148ee65b6f50;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000004a;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_94 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hdfa38acbdb6c1291);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h73260ead4714f6b5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf3ae365c88819060);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f27ea10c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha630c5f29dc07ac7);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h81dec125c51ea603);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h966d3c22664cf712);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000bf95a62);
        if (err) begin
            $display("Vector 94: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 94: Keygen output correct. cycles=%0d", keygen_cycles_94);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_94 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_94);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000064);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hcb3f1873defe6e71);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3e443491e3cd9bae);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h317558883bd2e8ae);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h088f7120877fb043);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc007f84088333cf1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5a0c6cb431677a42);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h999beda4d51b590e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf91775f7a636b5bd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h63abd0a7a978e4b8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h42e2810f5b77316f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he133a6ca0feca0e3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hd547ce3506bb3291);
        if (err) begin
            $display("Vector 94: Sign failed!");
            $finish;
        end else begin
            $display("Vector 94: Sign output correct. cycles=%0d", sign_cycles_94);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_94 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc007f84088333cf1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5a0c6cb431677a42);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h999beda4d51b590e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf91775f7a636b5bd);
        if (bad_sig) begin
            $display("Vector 94: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 94: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 94: Verifier accepts signature. cycles=%0d", verify_cycles_94);
        end

        // ---------------- Vector 95 ----------------
        $display("");
        $display("========== Vector 95 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9bb7ccc6af0a3803;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc95511ab15b59de3;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h6872f93b6f447ff0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h066a726bcd8e1d8e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5513a4a1c5a6b081;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h1e57f03edae0ea4d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h03c75adb81fdce83;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h853e3946f7ea0864;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0bef6ec171371db1;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1c2c1588ecad8814;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc895ec96ad0bde5f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h58ae394047653b2e;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000011;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_95 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h680dcf264f1da387);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf9e93e6aa7f46fc9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha1adb358ee15ba22);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007ebf2833);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7a4e32e99006707a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h44b0dc4953f71bbc);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h08c15b1321466ecf);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000d5e7268c);
        if (err) begin
            $display("Vector 95: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 95: Keygen output correct. cycles=%0d", keygen_cycles_95);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_95 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_95);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001e7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha9b36e134b9427dd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h4370f27cf21d20e3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hcc7c09c0806b918e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb1e81439f48dfbe6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc1fff230344af981);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfd93af9edb41a368);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h33118a7f06c8c5df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f151d723c977e11);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfbad092c181f28f9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6fe8ba7069628a6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'ha5498b655e98e0cc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h9bb671344c90208c);
        if (err) begin
            $display("Vector 95: Sign failed!");
            $finish;
        end else begin
            $display("Vector 95: Sign output correct. cycles=%0d", sign_cycles_95);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_95 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc1fff230344af981);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfd93af9edb41a368);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h33118a7f06c8c5df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f151d723c977e11);
        if (bad_sig) begin
            $display("Vector 95: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 95: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 95: Verifier accepts signature. cycles=%0d", verify_cycles_95);
        end

        // ---------------- Vector 96 ----------------
        $display("");
        $display("========== Vector 96 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hde18f7cff3e8dc6c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb6d10034f4ce2360;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h93818224d60de2f9;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1506c96513aaef39;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h0a40750158bb9e78;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf48f6917eaa5a415;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h47154365ab7ed047;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5d1f13c5e9f843f3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2e2b108a8af09df2;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h30214a4c900c090b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb7602369c68ce254;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h127ffe35cc6f9cb1;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000eb;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_96 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc52efe93d73685e6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h6533e25fc9c1e337);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h55af862a03f044f5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000075a09d7);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h84a01b2629459060);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hcb342dc294b720ba);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h09943f535a358572);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000575bbd4e);
        if (err) begin
            $display("Vector 96: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 96: Keygen output correct. cycles=%0d", keygen_cycles_96);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_96 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_96);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001fa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf2a5aef8685e5f7b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h8b41d0317580b063);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h38e1c175dd398f6b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h4e9c9886b2e28bfc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3f5eea3282e7ffc0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h50777e053d549ed4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h00f84df498701957);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e34c8574cbc3b0f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf8540ce1b89a0976);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9701d00fab453459);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfe0a7a2cf40f26c3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h81306441268469c1);
        if (err) begin
            $display("Vector 96: Sign failed!");
            $finish;
        end else begin
            $display("Vector 96: Sign output correct. cycles=%0d", sign_cycles_96);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_96 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3f5eea3282e7ffc0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h50777e053d549ed4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h00f84df498701957);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e34c8574cbc3b0f);
        if (bad_sig) begin
            $display("Vector 96: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 96: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 96: Verifier accepts signature. cycles=%0d", verify_cycles_96);
        end

        // ---------------- Vector 97 ----------------
        $display("");
        $display("========== Vector 97 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1eb00d06dda5b3bd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4af8d396abcc5e3b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h0c966572503cdfa2;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h66125860fd8aec28;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h48750ac23113cdf7;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hdbabaa80a128a888;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2a1914d7c35b3464;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h0c723feecb05e0b2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf40086b89f29c911;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h0add00f9119f76bf;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8f8d92c4ae0e15d1;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8a334e047b31ad0e;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000049;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_97 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hfc0000f7cb499bfa);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hfef0e2f54af60064);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0a3fc4bc076854ce);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000008d09d371);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h34541f16dc538403);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8edd84e6fc0de47a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hddf5b96a388595f6);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000086a13c5f);
        if (err) begin
            $display("Vector 97: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 97: Keygen output correct. cycles=%0d", keygen_cycles_97);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_97 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_97);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000116);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha998d5b91611a9f0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1b5aff7c860843e7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h10f4d0cae5be0824);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he09016893423ce05);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6b820f55ddf75f51);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2f02fe8fd12e066d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8faae1d60f9ca82a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h36a84a43a8d5e69d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcfd4f054533ee989);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h479e9775b9735f0d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc19156f7107c1358);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he50bbdd2411c9acc);
        if (err) begin
            $display("Vector 97: Sign failed!");
            $finish;
        end else begin
            $display("Vector 97: Sign output correct. cycles=%0d", sign_cycles_97);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_97 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6b820f55ddf75f51);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2f02fe8fd12e066d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8faae1d60f9ca82a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h36a84a43a8d5e69d);
        if (bad_sig) begin
            $display("Vector 97: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 97: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 97: Verifier accepts signature. cycles=%0d", verify_cycles_97);
        end

        // ---------------- Vector 98 ----------------
        $display("");
        $display("========== Vector 98 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha27d108cd3558907;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1ed00356850967ef;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb18417eab136d4f7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he8456dfe09695393;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hccdf2a7e7b8ee353;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc559fb9bf2dbc419;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4b53378a5750528f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4b7b0621fb51dd50;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h167e1dbde7346649;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h279435a7a96f7121;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc6b64c0ba00ea717;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7e121dde8fb76642;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000084;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_98 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h06a8448561b096ec);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he76cdd97df31e1a8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h3758fd3cca469760);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007bb8fe8c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hba4d55b529f8fa25);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h27f47f70bbc6464d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5abe4bd0ca30b128);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000aaaab21);
        if (err) begin
            $display("Vector 98: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 98: Keygen output correct. cycles=%0d", keygen_cycles_98);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_98 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_98);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000e6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h995116de3d0ca80e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h74dbc78c2481f0b4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h16b92d5a5bed169d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hdbc74b04eccb980f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd3e3d4c118098e63);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hbfb2e99b0b48c772);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4115e5e35e5f1a2f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h76502602fff7e784);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h598baf704d7dbd30);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3b4855ba2b0a6ab8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1b7b9eb7cf182838);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hff6077881d2df98a);
        if (err) begin
            $display("Vector 98: Sign failed!");
            $finish;
        end else begin
            $display("Vector 98: Sign output correct. cycles=%0d", sign_cycles_98);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_98 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd3e3d4c118098e63);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hbfb2e99b0b48c772);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4115e5e35e5f1a2f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h76502602fff7e784);
        if (bad_sig) begin
            $display("Vector 98: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 98: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 98: Verifier accepts signature. cycles=%0d", verify_cycles_98);
        end

        // ---------------- Vector 99 ----------------
        $display("");
        $display("========== Vector 99 ==========");
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he36f109485fb607d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3aeb31165eb531dc;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h6e7b5943dd0e9f46;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hab779abe15406139;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h951381d0bd725860;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h054c0edf7b0968d8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf3cd1d727d22d4c5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7ef91d2e6ed80100;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h6ca4a0d8e9403ca4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h971eb8418d474107;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3ceb09481a842fe6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h62436a4d68733dea;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000092;

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Keygen:");
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_99 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h199e8f240799b005);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hdba5e0b55a31b909);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h55bc5913f1a95074);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000077e561c6);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hfc4ebbfde32d227a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h64dfd2ff806c54b8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he848b64842635e34);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000026b0ed08);
        if (err) begin
            $display("Vector 99: Keygen failed!");
            $finish;
        end else begin
            $display("Vector 99: Keygen output correct. cycles=%0d", keygen_cycles_99);
        end

        clear_seed_eq_mem_to_x();
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
        $display("Starting Sign:");
        start_time = $time;
        start_comm = `START_SIGN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        sign_cycles_99 = (end_time - start_time) / CLK_PERIOD;
        insert_sign_cycle(sign_cycles_99);
        err = 1'b0;
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002cb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h71639ebaecce8639);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h4dc4400eec849b29);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf2892c1a499c044c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0078f8bd1a448143);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbccc3ed8f1e245df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h17b4f8b8ce499058);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h85f15918ca88ea54);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1703fedf8064c137);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h173f8fcfcdb13f53);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h50429ff8cd25adcd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'ha081142c7e30ffbd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h77462e569f692d8f);
        if (err) begin
            $display("Vector 99: Sign failed!");
            $finish;
        end else begin
            $display("Vector 99: Sign output correct. cycles=%0d", sign_cycles_99);
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
        start_time = $time;
        start_comm = `START_VERIFY;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        verify_cycles_99 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbccc3ed8f1e245df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h17b4f8b8ce499058);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h85f15918ca88ea54);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1703fedf8064c137);
        if (bad_sig) begin
            $display("Vector 99: Verifier rejects signature!");
            $finish;
        end else if (err) begin
            $display("Vector 99: Verifier accepts invalid signature!");
            $finish;
        end else begin
            $display("Vector 99: Verifier accepts signature. cycles=%0d", verify_cycles_99);
        end

        // Cycle statistics
        sign_sum = sign_cycles_0 + sign_cycles_1 + sign_cycles_2 + sign_cycles_3 + sign_cycles_4 + sign_cycles_5 + sign_cycles_6 + sign_cycles_7 + sign_cycles_8 + sign_cycles_9 + sign_cycles_10 + sign_cycles_11 + sign_cycles_12 + sign_cycles_13 + sign_cycles_14 + sign_cycles_15 + sign_cycles_16 + sign_cycles_17 + sign_cycles_18 + sign_cycles_19 + sign_cycles_20 + sign_cycles_21 + sign_cycles_22 + sign_cycles_23 + sign_cycles_24 + sign_cycles_25 + sign_cycles_26 + sign_cycles_27 + sign_cycles_28 + sign_cycles_29 + sign_cycles_30 + sign_cycles_31 + sign_cycles_32 + sign_cycles_33 + sign_cycles_34 + sign_cycles_35 + sign_cycles_36 + sign_cycles_37 + sign_cycles_38 + sign_cycles_39 + sign_cycles_40 + sign_cycles_41 + sign_cycles_42 + sign_cycles_43 + sign_cycles_44 + sign_cycles_45 + sign_cycles_46 + sign_cycles_47 + sign_cycles_48 + sign_cycles_49 + sign_cycles_50 + sign_cycles_51 + sign_cycles_52 + sign_cycles_53 + sign_cycles_54 + sign_cycles_55 + sign_cycles_56 + sign_cycles_57 + sign_cycles_58 + sign_cycles_59 + sign_cycles_60 + sign_cycles_61 + sign_cycles_62 + sign_cycles_63 + sign_cycles_64 + sign_cycles_65 + sign_cycles_66 + sign_cycles_67 + sign_cycles_68 + sign_cycles_69 + sign_cycles_70 + sign_cycles_71 + sign_cycles_72 + sign_cycles_73 + sign_cycles_74 + sign_cycles_75 + sign_cycles_76 + sign_cycles_77 + sign_cycles_78 + sign_cycles_79 + sign_cycles_80 + sign_cycles_81 + sign_cycles_82 + sign_cycles_83 + sign_cycles_84 + sign_cycles_85 + sign_cycles_86 + sign_cycles_87 + sign_cycles_88 + sign_cycles_89 + sign_cycles_90 + sign_cycles_91 + sign_cycles_92 + sign_cycles_93 + sign_cycles_94 + sign_cycles_95 + sign_cycles_96 + sign_cycles_97 + sign_cycles_98 + sign_cycles_99;
        median_sum = sorted_sign[49] + sorted_sign[50];
        $display("");
        $display("Cycle summary over 100 vectors:");
        $display("  Sign average cycles: %0d.%02d", sign_sum / 100, ((sign_sum % 100) * 100) / 100);
        $display("  Sign median cycles:  %0d.%01d", median_sum / 2, (median_sum % 2) * 5);
        if (keygen_cycles_1 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 1=%0d", keygen_cycles_0, keygen_cycles_1);
            $finish;
        end
        if (verify_cycles_1 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 1=%0d", verify_cycles_0, verify_cycles_1);
            $finish;
        end
        if (keygen_cycles_2 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 2=%0d", keygen_cycles_0, keygen_cycles_2);
            $finish;
        end
        if (verify_cycles_2 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 2=%0d", verify_cycles_0, verify_cycles_2);
            $finish;
        end
        if (keygen_cycles_3 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 3=%0d", keygen_cycles_0, keygen_cycles_3);
            $finish;
        end
        if (verify_cycles_3 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 3=%0d", verify_cycles_0, verify_cycles_3);
            $finish;
        end
        if (keygen_cycles_4 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 4=%0d", keygen_cycles_0, keygen_cycles_4);
            $finish;
        end
        if (verify_cycles_4 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 4=%0d", verify_cycles_0, verify_cycles_4);
            $finish;
        end
        if (keygen_cycles_5 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 5=%0d", keygen_cycles_0, keygen_cycles_5);
            $finish;
        end
        if (verify_cycles_5 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 5=%0d", verify_cycles_0, verify_cycles_5);
            $finish;
        end
        if (keygen_cycles_6 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 6=%0d", keygen_cycles_0, keygen_cycles_6);
            $finish;
        end
        if (verify_cycles_6 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 6=%0d", verify_cycles_0, verify_cycles_6);
            $finish;
        end
        if (keygen_cycles_7 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 7=%0d", keygen_cycles_0, keygen_cycles_7);
            $finish;
        end
        if (verify_cycles_7 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 7=%0d", verify_cycles_0, verify_cycles_7);
            $finish;
        end
        if (keygen_cycles_8 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 8=%0d", keygen_cycles_0, keygen_cycles_8);
            $finish;
        end
        if (verify_cycles_8 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 8=%0d", verify_cycles_0, verify_cycles_8);
            $finish;
        end
        if (keygen_cycles_9 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 9=%0d", keygen_cycles_0, keygen_cycles_9);
            $finish;
        end
        if (verify_cycles_9 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 9=%0d", verify_cycles_0, verify_cycles_9);
            $finish;
        end
        if (keygen_cycles_10 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 10=%0d", keygen_cycles_0, keygen_cycles_10);
            $finish;
        end
        if (verify_cycles_10 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 10=%0d", verify_cycles_0, verify_cycles_10);
            $finish;
        end
        if (keygen_cycles_11 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 11=%0d", keygen_cycles_0, keygen_cycles_11);
            $finish;
        end
        if (verify_cycles_11 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 11=%0d", verify_cycles_0, verify_cycles_11);
            $finish;
        end
        if (keygen_cycles_12 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 12=%0d", keygen_cycles_0, keygen_cycles_12);
            $finish;
        end
        if (verify_cycles_12 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 12=%0d", verify_cycles_0, verify_cycles_12);
            $finish;
        end
        if (keygen_cycles_13 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 13=%0d", keygen_cycles_0, keygen_cycles_13);
            $finish;
        end
        if (verify_cycles_13 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 13=%0d", verify_cycles_0, verify_cycles_13);
            $finish;
        end
        if (keygen_cycles_14 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 14=%0d", keygen_cycles_0, keygen_cycles_14);
            $finish;
        end
        if (verify_cycles_14 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 14=%0d", verify_cycles_0, verify_cycles_14);
            $finish;
        end
        if (keygen_cycles_15 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 15=%0d", keygen_cycles_0, keygen_cycles_15);
            $finish;
        end
        if (verify_cycles_15 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 15=%0d", verify_cycles_0, verify_cycles_15);
            $finish;
        end
        if (keygen_cycles_16 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 16=%0d", keygen_cycles_0, keygen_cycles_16);
            $finish;
        end
        if (verify_cycles_16 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 16=%0d", verify_cycles_0, verify_cycles_16);
            $finish;
        end
        if (keygen_cycles_17 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 17=%0d", keygen_cycles_0, keygen_cycles_17);
            $finish;
        end
        if (verify_cycles_17 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 17=%0d", verify_cycles_0, verify_cycles_17);
            $finish;
        end
        if (keygen_cycles_18 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 18=%0d", keygen_cycles_0, keygen_cycles_18);
            $finish;
        end
        if (verify_cycles_18 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 18=%0d", verify_cycles_0, verify_cycles_18);
            $finish;
        end
        if (keygen_cycles_19 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 19=%0d", keygen_cycles_0, keygen_cycles_19);
            $finish;
        end
        if (verify_cycles_19 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 19=%0d", verify_cycles_0, verify_cycles_19);
            $finish;
        end
        if (keygen_cycles_20 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 20=%0d", keygen_cycles_0, keygen_cycles_20);
            $finish;
        end
        if (verify_cycles_20 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 20=%0d", verify_cycles_0, verify_cycles_20);
            $finish;
        end
        if (keygen_cycles_21 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 21=%0d", keygen_cycles_0, keygen_cycles_21);
            $finish;
        end
        if (verify_cycles_21 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 21=%0d", verify_cycles_0, verify_cycles_21);
            $finish;
        end
        if (keygen_cycles_22 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 22=%0d", keygen_cycles_0, keygen_cycles_22);
            $finish;
        end
        if (verify_cycles_22 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 22=%0d", verify_cycles_0, verify_cycles_22);
            $finish;
        end
        if (keygen_cycles_23 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 23=%0d", keygen_cycles_0, keygen_cycles_23);
            $finish;
        end
        if (verify_cycles_23 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 23=%0d", verify_cycles_0, verify_cycles_23);
            $finish;
        end
        if (keygen_cycles_24 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 24=%0d", keygen_cycles_0, keygen_cycles_24);
            $finish;
        end
        if (verify_cycles_24 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 24=%0d", verify_cycles_0, verify_cycles_24);
            $finish;
        end
        if (keygen_cycles_25 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 25=%0d", keygen_cycles_0, keygen_cycles_25);
            $finish;
        end
        if (verify_cycles_25 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 25=%0d", verify_cycles_0, verify_cycles_25);
            $finish;
        end
        if (keygen_cycles_26 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 26=%0d", keygen_cycles_0, keygen_cycles_26);
            $finish;
        end
        if (verify_cycles_26 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 26=%0d", verify_cycles_0, verify_cycles_26);
            $finish;
        end
        if (keygen_cycles_27 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 27=%0d", keygen_cycles_0, keygen_cycles_27);
            $finish;
        end
        if (verify_cycles_27 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 27=%0d", verify_cycles_0, verify_cycles_27);
            $finish;
        end
        if (keygen_cycles_28 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 28=%0d", keygen_cycles_0, keygen_cycles_28);
            $finish;
        end
        if (verify_cycles_28 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 28=%0d", verify_cycles_0, verify_cycles_28);
            $finish;
        end
        if (keygen_cycles_29 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 29=%0d", keygen_cycles_0, keygen_cycles_29);
            $finish;
        end
        if (verify_cycles_29 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 29=%0d", verify_cycles_0, verify_cycles_29);
            $finish;
        end
        if (keygen_cycles_30 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 30=%0d", keygen_cycles_0, keygen_cycles_30);
            $finish;
        end
        if (verify_cycles_30 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 30=%0d", verify_cycles_0, verify_cycles_30);
            $finish;
        end
        if (keygen_cycles_31 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 31=%0d", keygen_cycles_0, keygen_cycles_31);
            $finish;
        end
        if (verify_cycles_31 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 31=%0d", verify_cycles_0, verify_cycles_31);
            $finish;
        end
        if (keygen_cycles_32 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 32=%0d", keygen_cycles_0, keygen_cycles_32);
            $finish;
        end
        if (verify_cycles_32 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 32=%0d", verify_cycles_0, verify_cycles_32);
            $finish;
        end
        if (keygen_cycles_33 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 33=%0d", keygen_cycles_0, keygen_cycles_33);
            $finish;
        end
        if (verify_cycles_33 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 33=%0d", verify_cycles_0, verify_cycles_33);
            $finish;
        end
        if (keygen_cycles_34 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 34=%0d", keygen_cycles_0, keygen_cycles_34);
            $finish;
        end
        if (verify_cycles_34 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 34=%0d", verify_cycles_0, verify_cycles_34);
            $finish;
        end
        if (keygen_cycles_35 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 35=%0d", keygen_cycles_0, keygen_cycles_35);
            $finish;
        end
        if (verify_cycles_35 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 35=%0d", verify_cycles_0, verify_cycles_35);
            $finish;
        end
        if (keygen_cycles_36 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 36=%0d", keygen_cycles_0, keygen_cycles_36);
            $finish;
        end
        if (verify_cycles_36 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 36=%0d", verify_cycles_0, verify_cycles_36);
            $finish;
        end
        if (keygen_cycles_37 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 37=%0d", keygen_cycles_0, keygen_cycles_37);
            $finish;
        end
        if (verify_cycles_37 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 37=%0d", verify_cycles_0, verify_cycles_37);
            $finish;
        end
        if (keygen_cycles_38 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 38=%0d", keygen_cycles_0, keygen_cycles_38);
            $finish;
        end
        if (verify_cycles_38 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 38=%0d", verify_cycles_0, verify_cycles_38);
            $finish;
        end
        if (keygen_cycles_39 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 39=%0d", keygen_cycles_0, keygen_cycles_39);
            $finish;
        end
        if (verify_cycles_39 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 39=%0d", verify_cycles_0, verify_cycles_39);
            $finish;
        end
        if (keygen_cycles_40 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 40=%0d", keygen_cycles_0, keygen_cycles_40);
            $finish;
        end
        if (verify_cycles_40 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 40=%0d", verify_cycles_0, verify_cycles_40);
            $finish;
        end
        if (keygen_cycles_41 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 41=%0d", keygen_cycles_0, keygen_cycles_41);
            $finish;
        end
        if (verify_cycles_41 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 41=%0d", verify_cycles_0, verify_cycles_41);
            $finish;
        end
        if (keygen_cycles_42 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 42=%0d", keygen_cycles_0, keygen_cycles_42);
            $finish;
        end
        if (verify_cycles_42 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 42=%0d", verify_cycles_0, verify_cycles_42);
            $finish;
        end
        if (keygen_cycles_43 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 43=%0d", keygen_cycles_0, keygen_cycles_43);
            $finish;
        end
        if (verify_cycles_43 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 43=%0d", verify_cycles_0, verify_cycles_43);
            $finish;
        end
        if (keygen_cycles_44 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 44=%0d", keygen_cycles_0, keygen_cycles_44);
            $finish;
        end
        if (verify_cycles_44 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 44=%0d", verify_cycles_0, verify_cycles_44);
            $finish;
        end
        if (keygen_cycles_45 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 45=%0d", keygen_cycles_0, keygen_cycles_45);
            $finish;
        end
        if (verify_cycles_45 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 45=%0d", verify_cycles_0, verify_cycles_45);
            $finish;
        end
        if (keygen_cycles_46 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 46=%0d", keygen_cycles_0, keygen_cycles_46);
            $finish;
        end
        if (verify_cycles_46 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 46=%0d", verify_cycles_0, verify_cycles_46);
            $finish;
        end
        if (keygen_cycles_47 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 47=%0d", keygen_cycles_0, keygen_cycles_47);
            $finish;
        end
        if (verify_cycles_47 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 47=%0d", verify_cycles_0, verify_cycles_47);
            $finish;
        end
        if (keygen_cycles_48 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 48=%0d", keygen_cycles_0, keygen_cycles_48);
            $finish;
        end
        if (verify_cycles_48 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 48=%0d", verify_cycles_0, verify_cycles_48);
            $finish;
        end
        if (keygen_cycles_49 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 49=%0d", keygen_cycles_0, keygen_cycles_49);
            $finish;
        end
        if (verify_cycles_49 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 49=%0d", verify_cycles_0, verify_cycles_49);
            $finish;
        end
        if (keygen_cycles_50 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 50=%0d", keygen_cycles_0, keygen_cycles_50);
            $finish;
        end
        if (verify_cycles_50 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 50=%0d", verify_cycles_0, verify_cycles_50);
            $finish;
        end
        if (keygen_cycles_51 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 51=%0d", keygen_cycles_0, keygen_cycles_51);
            $finish;
        end
        if (verify_cycles_51 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 51=%0d", verify_cycles_0, verify_cycles_51);
            $finish;
        end
        if (keygen_cycles_52 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 52=%0d", keygen_cycles_0, keygen_cycles_52);
            $finish;
        end
        if (verify_cycles_52 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 52=%0d", verify_cycles_0, verify_cycles_52);
            $finish;
        end
        if (keygen_cycles_53 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 53=%0d", keygen_cycles_0, keygen_cycles_53);
            $finish;
        end
        if (verify_cycles_53 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 53=%0d", verify_cycles_0, verify_cycles_53);
            $finish;
        end
        if (keygen_cycles_54 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 54=%0d", keygen_cycles_0, keygen_cycles_54);
            $finish;
        end
        if (verify_cycles_54 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 54=%0d", verify_cycles_0, verify_cycles_54);
            $finish;
        end
        if (keygen_cycles_55 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 55=%0d", keygen_cycles_0, keygen_cycles_55);
            $finish;
        end
        if (verify_cycles_55 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 55=%0d", verify_cycles_0, verify_cycles_55);
            $finish;
        end
        if (keygen_cycles_56 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 56=%0d", keygen_cycles_0, keygen_cycles_56);
            $finish;
        end
        if (verify_cycles_56 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 56=%0d", verify_cycles_0, verify_cycles_56);
            $finish;
        end
        if (keygen_cycles_57 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 57=%0d", keygen_cycles_0, keygen_cycles_57);
            $finish;
        end
        if (verify_cycles_57 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 57=%0d", verify_cycles_0, verify_cycles_57);
            $finish;
        end
        if (keygen_cycles_58 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 58=%0d", keygen_cycles_0, keygen_cycles_58);
            $finish;
        end
        if (verify_cycles_58 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 58=%0d", verify_cycles_0, verify_cycles_58);
            $finish;
        end
        if (keygen_cycles_59 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 59=%0d", keygen_cycles_0, keygen_cycles_59);
            $finish;
        end
        if (verify_cycles_59 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 59=%0d", verify_cycles_0, verify_cycles_59);
            $finish;
        end
        if (keygen_cycles_60 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 60=%0d", keygen_cycles_0, keygen_cycles_60);
            $finish;
        end
        if (verify_cycles_60 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 60=%0d", verify_cycles_0, verify_cycles_60);
            $finish;
        end
        if (keygen_cycles_61 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 61=%0d", keygen_cycles_0, keygen_cycles_61);
            $finish;
        end
        if (verify_cycles_61 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 61=%0d", verify_cycles_0, verify_cycles_61);
            $finish;
        end
        if (keygen_cycles_62 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 62=%0d", keygen_cycles_0, keygen_cycles_62);
            $finish;
        end
        if (verify_cycles_62 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 62=%0d", verify_cycles_0, verify_cycles_62);
            $finish;
        end
        if (keygen_cycles_63 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 63=%0d", keygen_cycles_0, keygen_cycles_63);
            $finish;
        end
        if (verify_cycles_63 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 63=%0d", verify_cycles_0, verify_cycles_63);
            $finish;
        end
        if (keygen_cycles_64 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 64=%0d", keygen_cycles_0, keygen_cycles_64);
            $finish;
        end
        if (verify_cycles_64 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 64=%0d", verify_cycles_0, verify_cycles_64);
            $finish;
        end
        if (keygen_cycles_65 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 65=%0d", keygen_cycles_0, keygen_cycles_65);
            $finish;
        end
        if (verify_cycles_65 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 65=%0d", verify_cycles_0, verify_cycles_65);
            $finish;
        end
        if (keygen_cycles_66 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 66=%0d", keygen_cycles_0, keygen_cycles_66);
            $finish;
        end
        if (verify_cycles_66 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 66=%0d", verify_cycles_0, verify_cycles_66);
            $finish;
        end
        if (keygen_cycles_67 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 67=%0d", keygen_cycles_0, keygen_cycles_67);
            $finish;
        end
        if (verify_cycles_67 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 67=%0d", verify_cycles_0, verify_cycles_67);
            $finish;
        end
        if (keygen_cycles_68 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 68=%0d", keygen_cycles_0, keygen_cycles_68);
            $finish;
        end
        if (verify_cycles_68 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 68=%0d", verify_cycles_0, verify_cycles_68);
            $finish;
        end
        if (keygen_cycles_69 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 69=%0d", keygen_cycles_0, keygen_cycles_69);
            $finish;
        end
        if (verify_cycles_69 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 69=%0d", verify_cycles_0, verify_cycles_69);
            $finish;
        end
        if (keygen_cycles_70 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 70=%0d", keygen_cycles_0, keygen_cycles_70);
            $finish;
        end
        if (verify_cycles_70 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 70=%0d", verify_cycles_0, verify_cycles_70);
            $finish;
        end
        if (keygen_cycles_71 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 71=%0d", keygen_cycles_0, keygen_cycles_71);
            $finish;
        end
        if (verify_cycles_71 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 71=%0d", verify_cycles_0, verify_cycles_71);
            $finish;
        end
        if (keygen_cycles_72 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 72=%0d", keygen_cycles_0, keygen_cycles_72);
            $finish;
        end
        if (verify_cycles_72 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 72=%0d", verify_cycles_0, verify_cycles_72);
            $finish;
        end
        if (keygen_cycles_73 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 73=%0d", keygen_cycles_0, keygen_cycles_73);
            $finish;
        end
        if (verify_cycles_73 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 73=%0d", verify_cycles_0, verify_cycles_73);
            $finish;
        end
        if (keygen_cycles_74 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 74=%0d", keygen_cycles_0, keygen_cycles_74);
            $finish;
        end
        if (verify_cycles_74 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 74=%0d", verify_cycles_0, verify_cycles_74);
            $finish;
        end
        if (keygen_cycles_75 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 75=%0d", keygen_cycles_0, keygen_cycles_75);
            $finish;
        end
        if (verify_cycles_75 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 75=%0d", verify_cycles_0, verify_cycles_75);
            $finish;
        end
        if (keygen_cycles_76 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 76=%0d", keygen_cycles_0, keygen_cycles_76);
            $finish;
        end
        if (verify_cycles_76 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 76=%0d", verify_cycles_0, verify_cycles_76);
            $finish;
        end
        if (keygen_cycles_77 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 77=%0d", keygen_cycles_0, keygen_cycles_77);
            $finish;
        end
        if (verify_cycles_77 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 77=%0d", verify_cycles_0, verify_cycles_77);
            $finish;
        end
        if (keygen_cycles_78 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 78=%0d", keygen_cycles_0, keygen_cycles_78);
            $finish;
        end
        if (verify_cycles_78 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 78=%0d", verify_cycles_0, verify_cycles_78);
            $finish;
        end
        if (keygen_cycles_79 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 79=%0d", keygen_cycles_0, keygen_cycles_79);
            $finish;
        end
        if (verify_cycles_79 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 79=%0d", verify_cycles_0, verify_cycles_79);
            $finish;
        end
        if (keygen_cycles_80 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 80=%0d", keygen_cycles_0, keygen_cycles_80);
            $finish;
        end
        if (verify_cycles_80 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 80=%0d", verify_cycles_0, verify_cycles_80);
            $finish;
        end
        if (keygen_cycles_81 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 81=%0d", keygen_cycles_0, keygen_cycles_81);
            $finish;
        end
        if (verify_cycles_81 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 81=%0d", verify_cycles_0, verify_cycles_81);
            $finish;
        end
        if (keygen_cycles_82 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 82=%0d", keygen_cycles_0, keygen_cycles_82);
            $finish;
        end
        if (verify_cycles_82 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 82=%0d", verify_cycles_0, verify_cycles_82);
            $finish;
        end
        if (keygen_cycles_83 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 83=%0d", keygen_cycles_0, keygen_cycles_83);
            $finish;
        end
        if (verify_cycles_83 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 83=%0d", verify_cycles_0, verify_cycles_83);
            $finish;
        end
        if (keygen_cycles_84 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 84=%0d", keygen_cycles_0, keygen_cycles_84);
            $finish;
        end
        if (verify_cycles_84 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 84=%0d", verify_cycles_0, verify_cycles_84);
            $finish;
        end
        if (keygen_cycles_85 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 85=%0d", keygen_cycles_0, keygen_cycles_85);
            $finish;
        end
        if (verify_cycles_85 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 85=%0d", verify_cycles_0, verify_cycles_85);
            $finish;
        end
        if (keygen_cycles_86 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 86=%0d", keygen_cycles_0, keygen_cycles_86);
            $finish;
        end
        if (verify_cycles_86 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 86=%0d", verify_cycles_0, verify_cycles_86);
            $finish;
        end
        if (keygen_cycles_87 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 87=%0d", keygen_cycles_0, keygen_cycles_87);
            $finish;
        end
        if (verify_cycles_87 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 87=%0d", verify_cycles_0, verify_cycles_87);
            $finish;
        end
        if (keygen_cycles_88 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 88=%0d", keygen_cycles_0, keygen_cycles_88);
            $finish;
        end
        if (verify_cycles_88 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 88=%0d", verify_cycles_0, verify_cycles_88);
            $finish;
        end
        if (keygen_cycles_89 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 89=%0d", keygen_cycles_0, keygen_cycles_89);
            $finish;
        end
        if (verify_cycles_89 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 89=%0d", verify_cycles_0, verify_cycles_89);
            $finish;
        end
        if (keygen_cycles_90 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 90=%0d", keygen_cycles_0, keygen_cycles_90);
            $finish;
        end
        if (verify_cycles_90 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 90=%0d", verify_cycles_0, verify_cycles_90);
            $finish;
        end
        if (keygen_cycles_91 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 91=%0d", keygen_cycles_0, keygen_cycles_91);
            $finish;
        end
        if (verify_cycles_91 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 91=%0d", verify_cycles_0, verify_cycles_91);
            $finish;
        end
        if (keygen_cycles_92 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 92=%0d", keygen_cycles_0, keygen_cycles_92);
            $finish;
        end
        if (verify_cycles_92 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 92=%0d", verify_cycles_0, verify_cycles_92);
            $finish;
        end
        if (keygen_cycles_93 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 93=%0d", keygen_cycles_0, keygen_cycles_93);
            $finish;
        end
        if (verify_cycles_93 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 93=%0d", verify_cycles_0, verify_cycles_93);
            $finish;
        end
        if (keygen_cycles_94 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 94=%0d", keygen_cycles_0, keygen_cycles_94);
            $finish;
        end
        if (verify_cycles_94 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 94=%0d", verify_cycles_0, verify_cycles_94);
            $finish;
        end
        if (keygen_cycles_95 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 95=%0d", keygen_cycles_0, keygen_cycles_95);
            $finish;
        end
        if (verify_cycles_95 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 95=%0d", verify_cycles_0, verify_cycles_95);
            $finish;
        end
        if (keygen_cycles_96 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 96=%0d", keygen_cycles_0, keygen_cycles_96);
            $finish;
        end
        if (verify_cycles_96 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 96=%0d", verify_cycles_0, verify_cycles_96);
            $finish;
        end
        if (keygen_cycles_97 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 97=%0d", keygen_cycles_0, keygen_cycles_97);
            $finish;
        end
        if (verify_cycles_97 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 97=%0d", verify_cycles_0, verify_cycles_97);
            $finish;
        end
        if (keygen_cycles_98 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 98=%0d", keygen_cycles_0, keygen_cycles_98);
            $finish;
        end
        if (verify_cycles_98 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 98=%0d", verify_cycles_0, verify_cycles_98);
            $finish;
        end
        if (keygen_cycles_99 != keygen_cycles_0) begin
            $display("Keygen is not constant-time: vector 0=%0d vector 99=%0d", keygen_cycles_0, keygen_cycles_99);
            $finish;
        end
        if (verify_cycles_99 != verify_cycles_0) begin
            $display("Verify is not constant-time: vector 0=%0d vector 99=%0d", verify_cycles_0, verify_cycles_99);
            $finish;
        end
        $display("  Keygen constant-time cycles: %0d", keygen_cycles_0);
        $display("  Verify constant-time cycles: %0d", verify_cycles_0);
        $display("");
        $display("TEST PASSED");
        $finish;
    end

endmodule
