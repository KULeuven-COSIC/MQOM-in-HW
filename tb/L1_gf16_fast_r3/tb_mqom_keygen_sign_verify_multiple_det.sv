`timescale 1ns/1ps

`include "mqom2_main_header.vh"

module tb_mqom_keygen_sign_verify_multiple_det;
    
    localparam SECRET_X_ADDR = `SECRET_X_ADDR;
    localparam Y_ADDR = `Y_ADDR;
    
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000066);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6c96c0888d320712);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he156cf036c980574);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h482f5b3ca6492ed0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3e2774860d071634);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1ecf6cd2772d2517);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha427acf98855f997);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc02dd8aee435af74);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha8b88267af6a5f72);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9aa4640e566e2d98);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1b989d80daeac93e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb4bd129e9ded8d72);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0b66dda54293c946);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1ecf6cd2772d2517);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha427acf98855f997);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc02dd8aee435af74);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha8b88267af6a5f72);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h5eacf921079c5e6e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9ab29701aded4a44;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf3aba847fa040960;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h51f3756796675f07;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h9a3f5bd7e5c148b8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf80f65ce33a73afa;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he1b40c650eca2539;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h79d81ad1944afeaa;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb7a2cd488eb5b74e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8d557be22e3faa22;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h15e1bc35ee20c0b1;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3d5fde8e6c2b187e;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000005b;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1b06ef0b5768f04b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h23ac3ae2d99bfcc9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1be415fdaf9f22cb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000003af5fb0f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb916e1defff627bf);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3bf77f3355e70720);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h857848ed44b569c9);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000048d0d60d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002c0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h5db3d68d32b31e45);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h48c6fad2fd55e752);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h905d1db4a59c00cf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hac18b254aefb4bec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8d665bcaa4c26f9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9662b73dbf9a1758);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hac319b68f8fc2b85);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h79219df2f8880240);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8ddd12ea21c85a3d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h93428e56ff93f916);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf6c861570a48e708);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h15c0f8fb3377e45a);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8d665bcaa4c26f9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9662b73dbf9a1758);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hac319b68f8fc2b85);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h79219df2f8880240);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4e6f255c2f358850;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h96c73736db986f0d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hae6993a4c9e2f8b2;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h87492e4310477ada;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd8e44f5bfb695f33;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2999a63b3063822c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h91fc0b68f891c625;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h73ae6c2a866b8309;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h87b693419b745a69;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8992c487c3fb713e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hcfdd54db6991a815;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h614e036b307650f1;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000a;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9a75a39f45bbe04a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h52c08a34b61d46c8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h60a4a278f84e3bf9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001d587b7b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h8095d35a31c67424);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf81b308230dfd22a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h53164130d5ccbefc);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000d29dd84a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000355);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4d03d4d27364fd5e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h507321228a79aeab);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he56b1b644dbe2edf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb4942d5e1eab8228);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h487569b6b87c5064);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'had2a3197c40dc2cd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h37a3685ea3950669);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h36400849ca3d4e98);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hde9f9aa313fcb50a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3cabd483fea0b7b1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h62aa65da69e17900);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6efb20d58de00370);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h487569b6b87c5064);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'had2a3197c40dc2cd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h37a3685ea3950669);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h36400849ca3d4e98);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdae39050887c5095;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha6d4c7bea5f5fac5;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3a448f7e198e2c96;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd695ae4e288cda6f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd4918bf98ddcd0b2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf26cf0b8e711b693;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2fb6734dbf1e8a15;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he79fe0d4a129db43;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'ha1a380547d3774b5;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb60ff6f7b909000b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hbc1ec222d1b41f45;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'haa4e7519a7f542ef;
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
        keygen_cycles_3 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'haa32da0d3abd9698);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h15367ffa24cd890f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0c19db5fdb5b2d8c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a37df9af);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h374cb0090de34cbf);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb640ddee98a2d51f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hff567eb4dc8a7b3d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a1d15a4f);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000176);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he146f3c4465a4ecb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc6a07d1d59baa29e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h33126d0c7587da68);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h76f298b3da564e7d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd8224c33f4dfb9da);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hadbb059dfc8cb5a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha0ac0824840a0d85);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5b37bc7d52e16f7e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h3374fdba10fa23ed);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1367da46b37098d2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h04ddc49fff26e3f5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h946625989187da52);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd8224c33f4dfb9da);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hadbb059dfc8cb5a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha0ac0824840a0d85);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5b37bc7d52e16f7e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0e4aaedbe1bd3867;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf637917892d4219b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2b0736f59577e896;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h04539b7a6af3dc4f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8895785adcbf419f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he4809c960a5c05e0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h32760cb037852e20;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hca403757e3f04858;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0fbd17cb2d93a313;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h0613e3a71dfd6f61;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h796a656777111469;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0bdd6357b04b019c;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000b7;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h674b5d405a291ac5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7e7d4a9fe83d066e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1ac437f160bd5bae);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e9b979ac);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha66de7845bd792ab);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hcdd5a95e0f7e2ddc);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h9d91f44393e76b41);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000824f0766);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000116);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1b1959031c47c2d6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h42ebae8eca46a299);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7b5990cd95a07c85);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he63cfecf2a26d72d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc6b169f208557883);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7e85f480d0e77e3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfc632272a8a95f3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha4b53f11eb60d54d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h6c1b12c4e7e9ab77);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2e8b01cf229dcf32);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd54c94cfcb792438);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hfe5cca9308bec736);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc6b169f208557883);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7e85f480d0e77e3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfc632272a8a95f3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha4b53f11eb60d54d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb1a4f94523540d6f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h93b61ce9e0b26800;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7a2d17a6359a356b;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h758cc93e26f04afb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hce6e925e14658a32;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h0aae1e5c234f459b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h5774073d0d1bdc23;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7c0f47005b243803;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h3bbdfb096e1459e7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha26a0e619885a724;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h719fe8f6ae85d414;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h9e5a4e13276cac29;
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
        keygen_cycles_5 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1ce9a312ed0ae0d5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h83d009c805447a83);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha67d4944ba18e4f2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000004be73ff);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd9cfba319f155e84);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h7129e1c0f45dd27b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he9c1ac7aaca594da);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000092e6b112);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002b4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0533eec06d1b8d44);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2f775316a0fe53da);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h59490866a28b9c93);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h304cd47e4470309d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hefbb5bf1a86dcb6e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd22577f979921ceb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc84512778be1a8d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb11d3ef5ed18ee4b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8a9bb276da863e9f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha40373ee168deb7b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc7c06108c5d8327a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc9363285ead7382a);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hefbb5bf1a86dcb6e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd22577f979921ceb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc84512778be1a8d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb11d3ef5ed18ee4b);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h322d9e872bf16141;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc63230fb96aee564;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3ae49f241f0954a7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7ef8ff132c395895;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb89c94687e97a6fd;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9c104182d3000a8e;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h28e532a0a66b12fa;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4cbbb8381cdbf979;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h56961825838f332c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2963416ef5000bd7;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0d7f7abe89a3d747;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h5fb878fc14ffa6f4;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000086;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h22a513c77348a52e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hfbc5d5ee17bc1201);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h2b9733184d8f4e15);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000009dacceb4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0558aa472808263a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf1fb7890bf5417b1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hf07f511e64bcc417);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000001fed75c5);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000014b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h5e62098bbecabdb2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf26e4e98d1a598c5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2c16b3e930b7fc52);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb0faefd2847cbb93);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9cdc5d3a52341099);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdee133af136b8498);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hcbdd644c688798ee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb2a0650c2f92d782);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hec5dbc16c14f7426);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h779fd06743753150);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2f0f6ba0abb665db);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf7fa593bb9ea169a);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9cdc5d3a52341099);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdee133af136b8498);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hcbdd644c688798ee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb2a0650c2f92d782);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h54c5d3e894a43b37;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'haed98faba90645f3;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb1d35109642b246a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hce06ff0c50b2067f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd22cef45c4f23b2b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4670d41b63e25658;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd7bbb81b3beea3f4;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2a1374d9cd5a90f5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h5d4041a2fd8de2c4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1cbd8d6c8e89da7d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hafe3fd1069b84701;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbe45f59d78caeb1b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000007;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1e078d271b325d26);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h4dd24d5b5d59570a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he89d723a1aa16930);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b89b565f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc2e8470d025dd71e);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0494bc1839e24db5);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'ha1dbd17d4f77fd09);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005cef3fd7);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000ad);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h077cf2e605f556ad);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2355b7ce9b077fef);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h502bd534b31b3963);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h1c5d9da7cbee21e5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2080ab42dd57f46a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h922e42f228490f77);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb4846a36528325e5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hda1ff6c260f1a370);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4fe0676da4668ef9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3581557d1351bc7f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h56ef0598303f39f4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h116235faec167d5c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2080ab42dd57f46a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h922e42f228490f77);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb4846a36528325e5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hda1ff6c260f1a370);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he5124ed186182250;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3d68d7b4e5669385;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hdd0730f935e175d8;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he5a757f5fd849478;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha74edab3f3f98198;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h81b364fc5cb03d73;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1594f84e7d0a7390;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h109e88866f3afebe;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8acc3e1ee58dfe48;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h89e219fa1af2b4c9;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he85f1e513b2c76b9;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd2dda9493707d917;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000008f;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc833fe8c79320884);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h147bd1d1691f7194);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h88fbf7ab78bd25e7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000005ef7127d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h8ff1b6720d80d02d);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'habe9426d60b4f71e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h13a514bb1ed12da0);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000fd8b96a7);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000027);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h225eb064bd7ec9a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h468fdd7b04f16b81);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4814c205a61d7501);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h88b66180feffde28);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h705d35b575cebfc2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb88dceff7d54fe9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7ebfaac77da6cfe2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha5a6c39b173cb2c2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h316a43b84d62b094);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha60b278e4e57d056);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h44be872dbf9e7bc9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf8bf94a5f5b7adb9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h705d35b575cebfc2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb88dceff7d54fe9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7ebfaac77da6cfe2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha5a6c39b173cb2c2);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9ea5fc6ac9bf48ef;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h6eedd7231da707c2;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5c32a5bb38585f46;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6fc9ca0825b540c3;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hce20fa54f2fc3fd8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he48bef87d35203cc;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc0d49f941f1b51c5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2c04a34bed3c6343;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h45b67a954d4a13aa;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'heca0873672990793;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf3465e44b95db92d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he91fc9aae84f5089;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ae;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9e6f32e84ee7aee0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h55e6667e359023b2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h06bd8fec96ffc6d2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000055aef6d2);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7e6e5f46225546d2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h18e6e079326ff409);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h3e12a5b9abd586b8);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e1c1badd);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000030b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h98872d2629d51140);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h12a5666214dd7deb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hab36063765bb3863);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h48674d49aaf7c441);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h997f66f39b95fbbd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0b3b4b8c8ca1e941);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h266aee56a514c951);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb96a020837a38c13);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h70081a75e76c180f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hba801d7793f7039d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf58ae7fe41a63cdc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hdc7158902cbee359);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h997f66f39b95fbbd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0b3b4b8c8ca1e941);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h266aee56a514c951);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb96a020837a38c13);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hd8248a81ced1ea6a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0ada323c8ca2ac55;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3a12f589e744fe06;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha16bb71aba1a6ecc;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha624f849cafb4433;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he872d4c5d4d90aaf;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc198f8ad8d9bc5b1;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h0ffe2cc589aaa001;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0e453a5c4d101a06;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h4c16bfdc2fe0701f;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h22cacbe1fa94f125;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h521cc8afd6bfd0f8;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000043;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3f94f1f1736273e9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf3db24877f4d0d96);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h4bdcd1b4a92ec9c1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000059bfee01);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha7a37d7818f590a0);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hebbc56f36ae991ae);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h7b672da0dcd45a8a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000ad2c265d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000f2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h358341192811a3a7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1c7489e5142d92ed);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h63c001277d48afaa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h331737cb98fab30c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6db0edc34e11dddf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf337395426b97ca3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h85fb3521ec83eb94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h65ebb446361141e7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'had65ee473d77400c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he974189903f890c6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb936df71eabc6564);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8119e33c69a51e84);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6db0edc34e11dddf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf337395426b97ca3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h85fb3521ec83eb94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h65ebb446361141e7);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'heb40716233062220;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf8a7f00b8f10262e;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'heb9ec5ea77e9a351;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb1f7d4f81288b85b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha8798b8ffb03993f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf2dbec1b7847b05c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h841175f441d19bfb;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h67a96b82ddb17ec3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2b6fafc9647bc8a9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h164cad497d7c54be;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4278ae387d669f2d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0ad3ec0236cc7114;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f1;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he758103d8e525585);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha648e8adc5908c1e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h805d135b1311223a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000003b3435e0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hea0ca3def9ea2088);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8c5ffcf697d0372b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h88186784f695f02f);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000042235ce5);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000189);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h45885b28706049c7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h30f4893f039d5961);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h89754c4463e17dc3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h1e6e9f2f76f5bb23);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6169506f494abfea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h84cb13a4389bbd11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1bfcf2d68cf038d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbf64940d75a9cdd1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd7b8461b81f2fe4c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5661730c2cbb6f45);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h96127669b1e72bad);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h9f1fd478650499c9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6169506f494abfea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h84cb13a4389bbd11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1bfcf2d68cf038d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbf64940d75a9cdd1);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h748bc6ef35f27663;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h84bc303785db2efc;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5deeaf123068c12b;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h587cd0aeebae25e7;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h68cfe3d63f243335;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc58978761a596035;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h898eb29a22d44d2a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb855008eeec95841;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h569bf95aedc7495f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6adba163928ed2d6;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha9559b18709694ae;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbd27f07b34a24403;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000fc;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h466f754293aa3f15);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1f2dd6477f5781e8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd6758a85bc2cb4be);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000cfb40ed0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hedea351beefadb06);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h693973c026e8bbbd);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h224077583f66840c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e0d34e85);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000022c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf925b3a3de30153a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he29ea1cdf2fa87ba);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he849ccc9d8568869);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha774bdde19122cdf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c06d675a0258d47);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc174d628b2cdb595);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h769894ea92e245cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h05dd603597fd8840);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1ade8c3b4a575369);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbe08f7057309e9a6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he5beac25c7bb13e8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8de59370183195e4);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c06d675a0258d47);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc174d628b2cdb595);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h769894ea92e245cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h05dd603597fd8840);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf86e31ba819775dd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he36e56f0d78c4fd4;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd567d52cfe135149;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf951bfb16f612260;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hbfcaece460f8a279;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h5bd44caf277e3388;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h087a96346a1e2d48;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h11f2cb0231bbbd00;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9b9b039f88192b9e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h27f3fe79f2bf16c9;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h10482e07e1f313c5;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0bb591f6ae8a568d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000b6;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h19760d2545ee5e89);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h0f2586fae1099afb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h730a5f9ef31473e7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000024174744);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha60b700d073c348f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd953561e1c9e4838);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hb196909b64b7f73d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000af1f6bc2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002a3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h78733df32e603bd7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h67241792afb7f526);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h77c351d46088825f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h8dae6851fc658c52);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h236dadbc5b297dd0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h95f5fdabd34bc1d6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h75ea4cfa14b811a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4a665bc0dab712d8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hafca0c1238f2d1a4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h43a08a288b0c2e6f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0f6c41a6c77a9de8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4e2b5c01f8a4e86f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h236dadbc5b297dd0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h95f5fdabd34bc1d6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h75ea4cfa14b811a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4a665bc0dab712d8);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h56ac36f72d6dda31;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h35b71c7184aeb353;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h03b0c64299d2883a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h24d8785235a40e46;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he2d5bd5328faa4af;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h98eeb80ff71d0146;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb49ef398596fd619;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h02f556ac3af2d24a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hae48c77481153472;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h79a4ebd759329765;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h29b7a397b519de6d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf207def35e87c136;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000003;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'heee3931b52d690de);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h613526a92c035fd9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h2076bc2477711cd6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ba0bd8cc);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hfe8f6702cd6ce1da);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb1cf8803c30cf5f3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h3cc84aba903919bc);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000c86bceba);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000176);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'had3f8f6a254c18a5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf8d2651328f5e546);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4db57487b1148fe6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hfd40e8c98c4adc60);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha198bcbac94e46bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5b0cc2ad618eb2b1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h356ebd7c1ff07c33);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h383ea6e690aed62d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2f7e64cf7f50ac5a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc8bbb2e4e26a013c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2902a1144de283c6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0cf69c33f65dee3a);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha198bcbac94e46bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5b0cc2ad618eb2b1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h356ebd7c1ff07c33);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h383ea6e690aed62d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha636d470592acbe5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9ba4dcd88bfbfda0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7769c00ce95790ce;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf6f31434780dc415;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h3b5ccf3f8f06a853;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h5545cf303af8eb5f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha7b8db575d2ddd65;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h103278feb20a33a5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'ha8cee2e30e9b7a07;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdacf7f760a9d99f3;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h22e52e208bc0c17c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he6d85c6b26b4d4ba;
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
        keygen_cycles_15 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h466f16c724a82da1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd59d55d9003b5bc7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h43ee5faea7b0c1b1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000c4af2f11);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5a59050640082544);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5a5a88b32701186b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h6b3ea950900becf3);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005a8513e2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000013d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha6489390ebdce32d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha12f62e57bcd42f3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h92bf34d011dd810b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7bbde2e0d7728461);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6e9ffa9c0dc55aa1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h48d69574a2cfda03);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2715d75b50e31fe0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf974eed08b5816af);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1dbf5bbbe53285e0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4101ab8c10e6bb70);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h666b04799ad9d5d2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h9d8b7d349b8aa97f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6e9ffa9c0dc55aa1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h48d69574a2cfda03);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2715d75b50e31fe0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf974eed08b5816af);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2c4a0ecaf31a0bcb;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h5cd3f12112fcd6bb;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hde6a2eee4a62d392;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h37a7f7affab816c0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7f9b82ed4e29bbfa;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h65638b66e149b289;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha90a679cd81f6d29;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf576c3acde1d8919;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h404b29618e138172;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6f7db642d017cf9e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h07718cf425b2526c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1f7bdf9d562b2fd2;
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
        keygen_cycles_16 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h00d4dba537668062);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h3be96af8f161f68e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h22b39a4ed85fcb0f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a1201492);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha5ba0f7611d43fda);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9152b41f8c191524);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h78e5d1147b68f239);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000f9673dc);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000170);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3dfd90eae872bde6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0ab7d91e4f34af8d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hc2602337c5b2ac6a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he7e49d34dd94a6bd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha1bcc943abfbb636);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h42945c7de004fd00);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5755e867ad485a50);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf929ec2797d969c2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf793390455b77115);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he1a86459774f0012);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1c869c42712d3c4a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h253fd16afafc449f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha1bcc943abfbb636);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h42945c7de004fd00);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5755e867ad485a50);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf929ec2797d969c2);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hafdfbaca66643aa9;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h77df07a27226349c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1e658dda2f55349e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hcdcf4906646881aa;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h34c97c4f30e66bbd;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h0d4253f1b4f2a1d7;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9cc8e489ab703f7a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h434ce1eeddb2db23;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd8d1d851c4752d93;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'had7f4d93f70e6f01;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6b86b5cead048fe6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8f9f086fd890568d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000009b;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h8bae89d61cf9cf14);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1cd2ede4eb208ac7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf320961a3989c55e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000cb4e09c7);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4470c8722965da3f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h2f917e938c921e13);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hde0c8b470700fd25);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000055e42ff7);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000425);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h164cbce0a5afdccf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha65b2989922d723d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h894c0a7c4df276f4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha62ef4498b967cd3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h349d09def986948c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc45a6fa5696de2e3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h86cfc1940037bfd7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he63760d78777976e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2dd249b687c0c901);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha12418c3563e51f1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1dabd66ff7e4c436);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h3dd19e8b178e058d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h349d09def986948c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc45a6fa5696de2e3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h86cfc1940037bfd7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he63760d78777976e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9f2b015fb3d1dca5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h74a2af16fa2e20b3;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hceeab1de6af6398a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0dea767055321297;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h3b54c2c5f9b2ec70;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'heccc009e544c9750;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he6c66ab227e679a9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h0a64998ca53d484d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h88f763c80a2d2893;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9ab9d4922cb7bb10;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h92e25debc2766f52;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1cde0a047379f056;
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
        keygen_cycles_18 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h81193eafc724222d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbe7cdd14901a4aa5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h479f181350831251);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e6707142);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5dd3b3e9e3c31073);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0d2be257635441aa);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h3d98c4b239bc00b1);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000c1b334e3);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002c6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1d8f358e0f124f22);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hba6d543ef8ea2306);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h71af43a33d677db5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h65ebabc3fcc10375);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he37535176114219b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd86334b191c8e385);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he997345e9baf00bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9b6d1a48d543e6a1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h97582cfb93ab8c97);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5ed491ff69105cf5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0de11b9e463f5f32);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb648c4b7bc9158b3);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he37535176114219b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd86334b191c8e385);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he997345e9baf00bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9b6d1a48d543e6a1);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h60c7c0dfba5aa2fd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7fd292c4290ce7cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he22abaf8b2ed7a5e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hefd06b781653984d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb01d2228f05c50fa;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h315c8c29f4d07ab8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h41cb50320202228d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2e5c4c628ba850d0;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he96b5566a7734603;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5e8c3f931469556e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he78471f5c7a64486;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'ha7dc04ce5b7e94c9;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000f;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha6abc9196625180b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1723bf6cc1aa08fa);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6da1b8155337b4af);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000004a5c7538);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hcfab9588b54db8dd);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h87f0c587c329a3c0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h3f8e4d1a8bd45a66);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000090f2b841);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000000b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha9f1f82da2ed6167);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h14c507a4d055cabf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he6fb2f99bafa8d81);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6ecef0728aa5630f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h431c8620d93090df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h007022f8a6962d8a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6f60e3e4e3229ebd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf96c97f045922b55);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5c21af9704aa3d7f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf58ac7b69dc7f3b9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd600c62c4650d518);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hbf048ef1c09ffe30);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h431c8620d93090df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h007022f8a6962d8a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6f60e3e4e3229ebd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf96c97f045922b55);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hbddfbbcf1cedbbe0;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h38c9cd7687ca11e0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb6355333234216fc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2a49b31ccdd08312;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h04ec616c2ab9675a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9a0880fb6eab72aa;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8a1c1502777e285e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd4e7336d4fa9ca04;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hc3d5d229351b7ef8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5fa9105f6d0dfac1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3e1ada724eafa010;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h60c6910fbb6dff41;
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
        keygen_cycles_20 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h00aad9e03729fb12);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf8634a67b70cdfa3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h5e06328f80629d73);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000005f6ab46a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf64614c28eb07842);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h6d51656e7a415854);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbe5e18c79918035f);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a0d13d96);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000326);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h78d3986b9f7b4218);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h24dc5e49bc160bc0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h5e143e4a25f5bc4b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he845a445428284b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he1d07fc11557ebbc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3842c12b05acc3d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1e262dc29741ea79);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2c22bfaa89371214);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hab37374c6d9ee3c2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hca151f0aa0eb3618);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h358b0c26031c85c4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h25c8939d1a57c5fc);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he1d07fc11557ebbc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3842c12b05acc3d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1e262dc29741ea79);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2c22bfaa89371214);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb3cfb744607f3473;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0341d7109397c425;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8ff01379d8f3f403;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he5586f7ca92686a2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd47f66dc7362a584;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9e5fb178b46c768b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9414ed7cac45a862;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h67539563448d2dfa;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1506a5c9eeb2acbf;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hfe07263a4dca7bb0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd281e9730e7a330f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1599405d886b5cdc;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000b;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4fedae682f453192);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h74561434e2d3c305);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha93b9def865a3c48);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000790bdde0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h035f3594d4a8e17f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd03c91cceade0019);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1dca5ef9b16fc33b);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000007de49c3c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000f9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdf6565b41050c516);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdd1ccd1d8aa6bae3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf57ec9de3e09bf1e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h841fe7d53c24291e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h556321dba4c8b052);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc5eb3f22c3425866);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h83d4af6d785e0ea1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h927e6289761a44ed);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9d3868a1599dd5ff);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h61ab37407c1928d5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfd9d6c8569ce3f95);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h365fbbe67c3e0794);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h556321dba4c8b052);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc5eb3f22c3425866);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h83d4af6d785e0ea1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h927e6289761a44ed);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hfc085a66086f54e1;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9ef44de812e1faf9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hebfaf49d8e71e09b;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hef37165a8c773224;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1fe4f9099f018829;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h09db3cf9b5048f0c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h94b693ccb1e08198;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h54564a585c5ddf0d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hee2657cbb57c35a4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h274c99f9a61302f4;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6bdf9264073a6581;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hde29a895701ed471;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f1;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h74eb950437859176);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7fb30ed275eb2892);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h316c42c6e95317e1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001f622883);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1d785f36da426628);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc50e451b240d6741);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he9fa113d8694e9f2);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000002f4fac85);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000029b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h64d8221e4f03abb6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hfff0a923118d3c6e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4690b7a7d43aa1b4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h026b23e9a5e3b9dd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc588be6039dcba17);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb8afdee09c278de2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6768ad89daa08316);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h978c99818acfc802);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hac24e2fded6ed492);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6c97e7be5cb05571);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h66146962e8c65a86);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h692fda951e7f9bed);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc588be6039dcba17);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb8afdee09c278de2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6768ad89daa08316);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h978c99818acfc802);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc9452f1030fbd657;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h96f1c9bb1b6abd31;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h606d5e99387e5f23;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h747b4c612d38fedd;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h59fc4cc90465df8a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4da9aaa694dc95a8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd5121264de9fb5ee;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5aab9b70db4d7a63;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf9a08514e1979cc6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc78df6ca94bed50b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h1afc1952fdafb5d2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1c4a40aa9a8ab620;
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
        keygen_cycles_23 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1555a64ffc52d4ae);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he6b3ad7c8ed76907);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h1f896dab17c2c8f4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000002059c0e3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hefa3f469292713d0);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h07453c519c2a21be);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h9c453986cb01771e);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000089ab1c93);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h5b2cf1bf51eb5432);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h358a7dd7e3d26454);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6681d2163125311d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he7dccdbbb537d4c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h32ac2794b7653cda);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7f8a17f242d4aa00);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9720710d815be103);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h06dbf94ae9f55388);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h03ec74e2f60abea9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5758e162e815919b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hba0748740585cd4a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha2c9f6efc80471ec);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h32ac2794b7653cda);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7f8a17f242d4aa00);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9720710d815be103);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h06dbf94ae9f55388);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h862eecb53828f50f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf25cec3767f92775;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc36ac687d4a2aa06;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8021754accafbbbc;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he8bfcd2c90c3e817;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h95f87dbfbc51a551;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h25ee81fecc5e613c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8847d985a52245db;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'habcf5307f4ca0c64;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h30984d7e9d16cb10;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hef2fee5056c6c496;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8e36661064983a8d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c7;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1c1994d112d4caae);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hae655efdda8c3fa4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd627cac83134b298);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000496d7f42);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hcd3a44bc84db7107);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h31081d7c5d18f7e2);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h45eb12475d82d08c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000c52ae5ef);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000003b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hd7cc7f59aacd5a39);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdb5ecf3bae70c356);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2c29c380e3f61d00);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h99be7c8e4cc95c6e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5a24a0fb69e456cc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he223067adb66c36c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he6fb28406e1aa611);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h560aab8acd93bfdf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h91ebae7119528c0a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h10db203f076efc81);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3c0a3aa9fe8e1d94);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'had7d4c7aa6a53b56);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5a24a0fb69e456cc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he223067adb66c36c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he6fb28406e1aa611);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h560aab8acd93bfdf);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdec65d42785da935;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he1fb3a25578199e8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hde247b6be05772a6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb931a8f67a24513f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h6140525dd28bb902;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h904a2ab44b01176b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h66f2d59047abe031;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h32e46ab25725c014;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h36230a1a1b767426;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd5af36c51001f110;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2dee9e39ce2bbe63;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h471f8f18b0a5e852;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e4;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf90ea21894909470);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hcdf0329214417ebd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0a6b6a1eaa3f8656);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b25e86bd);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h004a271182ae8c91);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h458c2d64ec579058);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h6dc787ed3b101ec6);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000e9cdce5);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002c0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0e03cb3b3391468b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha93b7f9e29f959e1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0cbbb6c921861b3b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he8446051c93579fb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h31079b3a3d11aeb4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9ce126f3eff9db34);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hed18d5d7257f3617);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2338dd023e670fb6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hed6b998d319d8014);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6534785e8c44b5ff);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3e3a4025085f83e0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb78883ee280175ca);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h31079b3a3d11aeb4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9ce126f3eff9db34);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hed18d5d7257f3617);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2338dd023e670fb6);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb0ac5fa5305ad8b5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h56484403486f0e78;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he5f0cfaf5aad6681;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h54e74b1c5420843e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h850fbe4994436f85;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8b6b39a7abc4a09d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h09c713c64762bd85;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf72be800d6e77108;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h40dac4b7f0ffe519;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h730c9d8a543b5953;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h35312e436ecf9256;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb66f8d4c7f102021;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000df;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf857afedc0d530ad);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h28314e370ec4d21d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hb0b0c6b46318c69f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000009547e34b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h36263e548e88ed35);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3b63500eb4ef7674);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h4e546a66c833405e);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000084f720b2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000005b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4806fe1db50c9542);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h362ec713148fd280);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8f5faa86d3dd00b2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he9cd62b042921c6b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h621be310bf4f73ef);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6ed76b62b59ab3e7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd54441d17a4c52c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h332170f3acf12407);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf8323da197b4a8f0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6742fe692ee4c4d9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h03b8d77925996631);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf2a5dc9c5a5c6b8f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h621be310bf4f73ef);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6ed76b62b59ab3e7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd54441d17a4c52c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h332170f3acf12407);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h54638f250b661704;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9231d3d894fadc52;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfc7f6e671606d5de;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3685a02fcade5df4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h219166345439d8b3;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h787860c2060330ac;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6867977b5b3233e1;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hba04c35dde5848c5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd8f8a591502a987e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7b0e57bed7d4096a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc735314119194750;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h703c2fb48a7adfd5;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c2;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he931af61c2876ffe);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hef27d108fcfee458);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h9b4d2ad3fe1fdd4f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000f96f2a55);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h974463fd9b4f9216);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hed792a1c489d0c96);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hfab2d87713a65c9f);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000265ab59d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000017f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hca70098a5c640956);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h27ca62cb52395cd2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3c93f5db5f0224d9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h1f523cbaf97a1e9a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4e4361845c25fe8f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfb5fe7fe1640631e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h54b905a3d7910a65);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h57ba4fc1fa522c49);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb9a4cc3d1372d7a5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h7ea863c8ad9f47e6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'ha97f000da301ece9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5d20cc2ad138e3fa);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4e4361845c25fe8f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfb5fe7fe1640631e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h54b905a3d7910a65);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h57ba4fc1fa522c49);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h69d9e63bdc80074a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hde31f1dbfcceff00;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hba626ec47f1c201d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf783813a69898d3b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he46f0aaadff417dd;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf382fb664c643930;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf9b946ac6b0dca43;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'ha363d85260ef2149;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7d6d139e8c64f131;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6d8b9f891439720b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h209b984b7a273be9;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hec1d5a509ab6b7f3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d3;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h739c0ef8c4b17c99);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h87662438b505e59b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h8aef915db74cf637);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000003f792e62);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1c6b5c925842fa03);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9ae55451e212fae9);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hccc2177af38d1d9c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a78e9731);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000cc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hbd3589c83edcb224);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6f73f1208edbdee5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hbb0e05cb47bb0ef4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h4832eec0060dd368);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h235961801ee1dede);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7f602b196e859d66);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc8797b917ff69ceb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3148e8dc871aa5e7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h640e97777c914896);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hee3e0c15c957f6c9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbecab9dc4bb76bc7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hec95e2509feb8fd6);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h235961801ee1dede);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7f602b196e859d66);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc8797b917ff69ceb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3148e8dc871aa5e7);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4653182bd4bda954;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd39fb1f5590cae4e;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hac91810e0a8ea7ec;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc9f78df7b490e73a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5d35032eaac50be1;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc891fc5558156f98;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h252779252d078e16;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2c78f2f588d5aecb;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9d6eb1b0d1992cb6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha74bc4e13656ea37;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb71fb782add5aca2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7ffe347b6c0aa1fa;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000af;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h075c159aee9e1167);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h61172990f808b4de);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6eb09cc6b6cc76bb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000c801748d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hdf29962c4645566f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd19a1f3c457cebdb);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h94d035b94c3f4a12);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000385880f8);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000029d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdc2abf195289fb92);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1debbb2c2d319000);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8ec497fa28e746e2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he91334dd4c99d29c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5a8910ed0cfbbd60);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf7a3c46b5503fe55);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h73b2d664ffdc4477);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb35a77230b0840b0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf3651c3b44948d6d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h91f91fffe346e6c7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2ed11ec8ea524d34);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he527f3e1147f1396);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5a8910ed0cfbbd60);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf7a3c46b5503fe55);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h73b2d664ffdc4477);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb35a77230b0840b0);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h66f26177fbf288de;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hab30ab732fa7a533;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfefc1e2b511e4046;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hce1ea908d558d242;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc3010a708b9c9a31;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9f1b6a76ad7ed965;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4841b325712e0d01;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3855b6b120317313;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h6a76db118277bc8f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb25f126d0f05af7b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0aebe1fe2ae70359;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1c90fbff29b07f10;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000079;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h513b17d7e35e806c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h632a0caf552a3c25);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h080745b751ff1cc1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001b469dbe);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hdc52dab13c072461);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb24439a4985b8fe1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbb0f12855416583a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000004d623421);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000160);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h508ec4f297c05f56);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h68aa8e1182cbf507);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h03d9d2d9e539f743);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0192c8eb2d4d71ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9ad33f1c62f7a94e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h56de9cb4d63c690b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4dde7dd65aa41abe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1e449184da2ddfb1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd2221eff4ee03452);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hb2e604143a144af7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h27e1610f3421349a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4e01f71553e31698);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9ad33f1c62f7a94e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h56de9cb4d63c690b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4dde7dd65aa41abe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1e449184da2ddfb1);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'had4d7b42ee624d44;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2bcb974cfde141e0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h643a4028511defcc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3438c2307ed9dcbb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8c1bf6b87907f6ae;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he66191cc4e6c88e6;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h81f30f7c5ea7b4bc;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8ee8a7d346adaf40;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hbf8829511344555c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h257ab0b35bc923c7;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h1641cd76426de141;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h362124cd9d4f464e;
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
        keygen_cycles_31 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h46303e3885bedb35);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2ab1c35f795271a8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h344e8df07a6edf5d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000066a8ed8e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h47a45f68210c0163);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h6072b90822f450de);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h3994b11ce364bf72);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000006bbede6a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000cf7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hae6edb0dc23e4b0f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h06b805b694c26326);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h50853eb4800a256d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb8fc9fc54ec25352);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcb9a799142bdc186);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha4792ab1d2b7225c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h60a9adaad7b5a97a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9d6315cd49962105);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h364b50d51e60234e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4840d739295c0478);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb4e601a7bb0b42e4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb4f8bcee78c50131);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcb9a799142bdc186);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha4792ab1d2b7225c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h60a9adaad7b5a97a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9d6315cd49962105);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h3cfbb6ae1af5dddd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb6a75dc02367476a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hec4f34ce9ecbcd84;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0fc46573710698d6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb6738937533e093b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he24c0853ee7f011f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9c161c098af48254;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h357ebc2d83cb5945;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4573f00a480a6c80;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8f96dce2eaccf445;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf826b71a27c28447;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h78a4c9b62e17e7d1;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000026;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h271b9547368ece3d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd469241f9d7e0e4b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he6e0ec71263b6b50);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000002e1570b0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd4a186cea0c5ff8f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h7419eb27711c8131);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h4e4a9886e8b25205);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000b31ac44);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000011b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h5a3009fb3092be41);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha5ada374d3c2a2d5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h428e774a8c8a9950);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h94110e81bd5357e4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h91623a92bd477f24);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h260a1f8d709b00a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9a8dc2edd40691dc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he5493497336c9990);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcd382c2257e59c39);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h38a08d865a611728);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf28e95816725e6f8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2dbe0815939c639b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h91623a92bd477f24);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h260a1f8d709b00a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9a8dc2edd40691dc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he5493497336c9990);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8e27762a9b27f8da;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3ec25b3e093e5cd7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h92731f440f1700f4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h88244af1918ad01c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfef84f77a0f70aa8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he657dda9cf9d8a71;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc07335f4b25faf05;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1c49d60c1df65e2d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'haa253ad36f6cb8af;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h65b95852e2506de1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hee25d7febb54ebd9;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h39b27600038df36b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000080;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hed2771ef2e660bd2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h71496bc4d8cfd4cd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hc207093f5ea3f2bb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000000626cba4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9e0afbcc2da67b9b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1c47cf38654f76f6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h7b66efcd04f09b45);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000201b9c5d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000062);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h169188d5b33e3831);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hbd075cbead2e59ff);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h939d118656c3de58);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hcbc08db653c4e5e5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h66193e941974f9ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb3f145b79bf77373);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7aa4da2fcb917c0a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4ae5877deef1be14);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7067374c466a8cdb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h29a8862351372490);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8a3274669eacc552);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h42383c669aba5a58);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h66193e941974f9ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb3f145b79bf77373);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7aa4da2fcb917c0a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4ae5877deef1be14);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdb9132edf6752aae;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h218a571c3d239794;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h25c750250af9c64e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1a54824622879bdb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h927cec3302f18d38;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h166953ad4abc33a2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hfd89c5ab36a5aebb;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf291e8e70f3d0d45;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h08e69f4417eec495;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5dcffeb238ba500a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h02411401c1a92965;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd093a452dae63db6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000001b;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h14a8957e758d4551);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h941ac7d763f048d8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h510921128d634a99);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e5d5b5ea);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h40b5d591c8df1477);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hbf3844bb953bc1f4);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'heabc28ca0248ea14);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000b5f01c87);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000004b8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h338f68548c7f1861);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h55d92d54b040fd2f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3d3bc5e8b0eb337a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he0ef95c2dbbb5eeb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h395f300e693f5a11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7b92a39a51056a5b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc76190b9dc105ffd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfa5776bdf6ffb7be);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hdb23235ac699f573);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4c041c04393328eb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h21e7093191864814);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hef1b020e41d7ef52);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h395f300e693f5a11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7b92a39a51056a5b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc76190b9dc105ffd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfa5776bdf6ffb7be);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he41292b99b0f24ac;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha5cfabccc469f3f5;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hacac4939e2268950;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hcfb56d48b5ac4ed5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1a276b881ffbaa6c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3e64c485fe12ecfd;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h995bd158212486bc;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4a407479832ec83b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7e3135214e3f6a3d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf7fe24e449d16318;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8d81f7affd965089;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1de6e3298aa1c4e0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000027;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h7b4c2fcad7f6b82e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1114bdcb9fd89dd3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h37abcea5f594b085);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a0b178b9);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5590ab6fbbce7d92);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hae8745e793386a03);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he800d6f53023bb95);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000008317ddff);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000093);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h349e24f6426f32fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hae68f67ffda1bc6f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hc541f9312fb02a96);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h13e8922a41b3689d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf5cb5ac550f82d08);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h51639304417f0cb5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha97def753ee9eff9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h494ea6f46b84082c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h85fb26d45915ecbc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3abe929ecc1dc03d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h6071a57a10f8047b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6c27d6605ecc63fc);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf5cb5ac550f82d08);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h51639304417f0cb5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha97def753ee9eff9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h494ea6f46b84082c);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h09de52526881d8c7;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0663ab4a252ff697;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h57f7bb87d4bc51e1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd5de274c82a37ef3;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h071e15a883ba217b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'heef409ed32601703;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4b7e7651726869bc;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he1906a59e61653da;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hce55295df1d68f1c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h171dfcc5ca2bfb51;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h82d89c083bbb79af;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h036c0e0af6fe486d;
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
        keygen_cycles_36 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h8f91eaa71ddc4063);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2a6f4d275847c291);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h291b73125f71240a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000818db55b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hbd144aafc7dc6595);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd607835e1ba8de01);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbe6c716d81c4bdb5);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a61f111c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000041f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9b6b2f5e34152fdf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h91a4d84464d3545e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd6a02d12730d9613);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9e9782a9367d0b19);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2d3c7521588ec660);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb81a09489ee3b16c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf52c80ce3b65e551);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdaf8ec9032a3377b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h19a33e73e37930f9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbedd842116f3630c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd48f2b50712fcacd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8c0bb0144028d039);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2d3c7521588ec660);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb81a09489ee3b16c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf52c80ce3b65e551);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdaf8ec9032a3377b);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf340450334f6539d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd5a069a502a56a85;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha21d28a2de2ef180;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h29fb8d7611e54f22;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hae7fc5b1950cb247;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h692cbc51eb84771d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd99efc3a04f0ba84;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h93e99df1f74351de;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h58cc89387f38e7f4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h47349dfe8a64b795;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hedee1405b49409b0;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7fb544763684c9a9;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c6;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h93329b99bb3b0d31);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h04e2be281c34886f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h976a3c8a7f109fe6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fb8cb2d2);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h00c2c3e7c58e1731);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h50b28ff688ceede5);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h81c866160ee201b7);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000007cc2f499);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000044);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1e36225ae230b9fa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h7b9c27d8338527d9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6a30515482b2d6fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h23d179856c17a890);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f4dae797d64e4e3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6067c29876e6725b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h60a5fabb8c278405);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h52f2b23be086ef72);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1abe7b4cbb7df827);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hec19111d70fee73d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0c691b4aca89f81e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hcf5901c7cd1ef983);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f4dae797d64e4e3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6067c29876e6725b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h60a5fabb8c278405);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h52f2b23be086ef72);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8b1c62901f82d13e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hac51ce5e65fb7254;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3c5dfd547579625a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7ddad4406b25bbc8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h15821dcddcef232f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h213e23d6a16f616a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4b79a6f5a7ac25ea;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h9d2871791c49fa18;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h6542ef6e4798cd7d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h34057f486792e49c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4574623b4c6cedd5;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h979246ea090955a2;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000007f;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h85001dab8bd886e8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7e16d7fe68774baf);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he8593228367ba842);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d7b0ad97);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb09bf837c6461678);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9afcbb39674733b3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0db9e54c5bc9c89d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000018d9f534);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000065);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he5d0dd3fca89262f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h31a243eee6bf9f00);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hfa686168889bd338);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9eecf0064a423fec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h95e045f46fd43177);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc9c3a5594b198ba1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2ef0098f3c48f708);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1bfa42583457f3fb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h0367e333723bb70c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h021d680ab74f7f70);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8e70bf3fa3966023);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h047dba0e7e2f96d4);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h95e045f46fd43177);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc9c3a5594b198ba1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2ef0098f3c48f708);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1bfa42583457f3fb);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he7f6dc0567d3ffeb;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h04a090853e6496f8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hbb6616c34c1839de;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hbc0f1feb4eb1e455;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hdf89d7031fe3a962;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he9339ed501da91c6;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha62deaf603467fec;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8c1dc59c48a335cb;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hdb7249a0bc5c5908;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb62e232aca23b711;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h5472160538b16db0;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h013a7367f922062f;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a1;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h35e9544da7b4919b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbac4a7c51e76607a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h8177a1fb98f07182);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000005f1c3109);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h37be36fe9406cb5e);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hdd32566ddb871d6e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbde246e12ec006ce);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000038255a28);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000073);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hedfc5424aaa7dafe);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h47050d7490661e1a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'heed5bf632c59b20f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h648ee55ed969774d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h72877214a6cab275);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6cbc519c24934a62);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1f65c6a204ff7c1e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3490269d00ea42a9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcc17b70419c039fe);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1be15deb05e8ad45);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hedfabbc9440e53d6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha4eda7b99cff7c4e);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h72877214a6cab275);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6cbc519c24934a62);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1f65c6a204ff7c1e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3490269d00ea42a9);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc82212484305c150;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h99414aa7ffcef523;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h66f9455c140a6928;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb8d2cea9059e88c1;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf0a601fcf6f1de3b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3184cdbe430fe87b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2941289621517f8c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hda9f2cfa7ee3311b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1105d1ead03b2dc4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3c570536f72fef55;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4436a716b294bdc8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h620d6e02ce58669a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e9;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h8247e0b57d8f3b1f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he82bcaddf351eab3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h74fb0d2ed541bbda);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000061dbc013);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h925677464f76b895);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h54b9ce9290d3bc27);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h045afdc588695d40);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000015128f7b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001e3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h8a7d22b758274a49);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h22e4b334f365b26b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2f79ef3ae47440f5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5d0ba6dc7ec42025);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h896566726ca73b94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5f4334c91190ebb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h123960b256530cc5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5cc6fe05767e2b58);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfbcfaefdeed57c96);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he829e26de4b77617);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h06f135dee79a7a85);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h3cf3f330c39ebd5f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h896566726ca73b94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5f4334c91190ebb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h123960b256530cc5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5cc6fe05767e2b58);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1566f41a0a5ffc72;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h99e0254a7e8b2a26;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha22880b64a47ae08;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h25700b59eb9a1dc6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h9f181022736548e8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he02d7ec28906d62d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc99ca90fd6de89f4;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h79c53129229aed3d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h40f2bbde2ed9bf9d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf6988f99a1540a0d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h9da2e1022bd4aa31;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'haf65a80d34161a47;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000aa;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h202069a1bd24173e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h525ef17b036d9d6e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf9bd3ba8d6205c8e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000664f8f32);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2fce1cddfc3adfc2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h34503b177aefc7e7);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h035ace3993a374f0);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000b74956dc);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000016f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h69824ec5f4fbdd55);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc5c682eb8e8687ab);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8c1fb2b25d48189c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h666dbda951044e9a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h709a1eb00d435009);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h11f66ffd40655997);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0a72a253eb4268a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h83fa343d860868e9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h72afe3b4e998a9b5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfe181c86a3cc02d2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h6942eaa73366eb15);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6b9f1cf588051fce);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h709a1eb00d435009);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h11f66ffd40655997);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0a72a253eb4268a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h83fa343d860868e9);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h794612c80b475d5f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1116e1714e7fb00d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h83e0ed6bcc8fbcfc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc7a488d1bc695759;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7bfcb0de67216dd8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd28609aa0fbf6b33;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8b9a296f79245eac;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h87cb37ef82143a0d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1ef1901ef6a9c246;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hecc0cc31779755c3;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc47394a1d0140e4d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfd185be4ce8f6422;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000036;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb8583a94389ae3dc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc2410bec474a144e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0fe5ea25a4ba9b2c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d00039ca);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h127f84ff8c158ef8);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3f38f4468060da0a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h48d635e8c2a87496);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000041cb4e55);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000275);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he8bae4939b3ab486);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h74f56d90c543821d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h77c4498d83c77a1d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0c4b826e2018b803);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3e54765edef21d39);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9d31147924b30b71);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2438998f6b4f8293);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf1cb7074d65300fb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h396b1761774a85cd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h046a935052e91b85);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he6be13854ab5c278);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha6d44896f58b6dfe);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3e54765edef21d39);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9d31147924b30b71);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2438998f6b4f8293);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf1cb7074d65300fb);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdcd46a67c6c77486;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h6a70f20232e60e03;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7fe9c9f2b8f235d9;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha7a4eb1f775d02f0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h3c425b371fd8cdb6;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h52033f860eb55eff;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4521d5e0984e9d85;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf83e5becabaf706a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h022c818d6c0d885a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdb4892dc757b4162;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h37b40b7c30b8fcf8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h15fe28037ae02f99;
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
        keygen_cycles_43 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h8b043a2b915f5ca8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h73d978c5b7858b6a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha0cd28332fd4664d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000002f6ddd1e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3f8630f846ce194f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hfe1fa1f30621957b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h7424547c350d9e67);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a38b67b0);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000cb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4a90d539d555010d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3dc833fb11496b65);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf1f235b48aa72c85);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'haf2124fe803959dc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6c9463c80380fc36);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h907aa1bc416fb82e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9567ae08e04f558e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc7128ae6f7cb10dd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfb592d633656068c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he41c612164f3c384);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h007551e7a17e8b9f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h3a72a2576b0d7d5d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6c9463c80380fc36);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h907aa1bc416fb82e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9567ae08e04f558e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc7128ae6f7cb10dd);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h40f467e506fd7bcd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3e705f92e9a78ff9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd6cb4a374bee07bc;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9f7878924fcd2c6e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc6ded26094c3591a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hddb55f07ce0e31e5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0d8b6c36bcaf2d81;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h182255c46792914c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2b8b90e60acc74be;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf4ea1d83f76be3cf;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he51d6de7a586a647;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbaa8fe43266016ca;
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
        keygen_cycles_44 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd3ec67b4805ecb3b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf7ed3cbf20bf3b34);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h25d86e47010b9575);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000035d79fcb);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb44f38789144f93c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hcecb4935a21ab086);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1a108f5a6bd0333d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000ba75f36d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000006f6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h67fa895a006b7615);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h284f12d6f4ad525c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h590a8a3d325e2bf1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5494808b3e5c6be8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4b2fd3a9f1f2c59d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2c4208ccdc6541f3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h296108ea3953e451);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1618743b16c0bb4f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb93ef8a083ffae8d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h872c102bbe53bf63);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h93f856ac403c9320);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h23b6a30c4983cabd);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4b2fd3a9f1f2c59d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2c4208ccdc6541f3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h296108ea3953e451);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1618743b16c0bb4f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb314e602289b7c31;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc9ef4848b89607e7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb028ef9a5f166761;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc50558041fe03843;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1baff3555deac75a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf33ad808cb591045;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h717e6f18408cbbdd;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2702a4a94e3f821a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8f8788148bbe35e7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h07102dd7bcb69597;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8420754f5dae37d6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h2d4559cb919b1a1c;
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
        keygen_cycles_45 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h37cc0c560c81079c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h09d4e334f3ab92bb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha98ad95c441ee548);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000008698f789);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h89d4f809cba92f9a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha80936b01729e894);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5323fe494bc69c9b);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000057a085c5);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000018f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h5e841d99833e1523);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf5c6c0b8b6de569b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hee8936130b3af6af);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0f5bf61b6e70e670);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3c030e160488da4a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h19c0d34159b22ef8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha575430b7d97ccd9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h092812f9243eb78a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h247052d0c4be1cf0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4bb7132b2d759ab7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h14216317002312ad);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hfd26b6eb9322e1f3);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3c030e160488da4a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h19c0d34159b22ef8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha575430b7d97ccd9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h092812f9243eb78a);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6aeba8a185599979;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h19dfc759d996cd04;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h711f07add5e229b1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7f109674e980143b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h34a7cf19561bbcf2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc3a3fd0038b97a69;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h77e85451069ff078;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hfa53eefd1a098963;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h116bf3f8ce82919f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h55f6afa039e7467f;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2c2fe7d145f94d7f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3a954558448f6676;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e4;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h02f89c46e1702911);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h566a3c8c781447de);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he36b375cbf078012);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d33c9c40);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd5afb2d214ae86d6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf37f1e699a0124c6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd1fe44c7036efcfb);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000b5a7a8ce);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000c5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc30fb8918ee0d5bf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h889738b34f24456b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h99a3b7a6589b2323);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h74fd56955b5e1d82);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h18291671ab972d80);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h18f878841f836054);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h54d9c9da0b16768a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcba803ed420d925d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc55a8f817d3a2899);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h433096c423d44fe6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h27867ae28b329879);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4b53f2e60e805aaf);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h18291671ab972d80);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h18f878841f836054);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h54d9c9da0b16768a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcba803ed420d925d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h80c1289cb0459a59;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h435b905a39a540c5;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7e36babe60a00ae3;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8d78d8ee72bea4ef;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8c712d8f731b9acc;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9efb922763bd4d93;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h5f19397e1f78db9d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'heb6de03d946c2c64;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hffe16962423f2eb0;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb253038b9b5abfea;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha6492fde40aa5855;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h5dce9acdbc801a36;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000e;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he124020e36e4ea12);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha34945a8d10feb71);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf289dab31556b7f2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000004d6c3ba1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hda298525fb4aa28a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf5fdf8947b613ff8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h25bedb3575891f39);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000007b055249);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000017);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4fd0946f8521fe53);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2f606cdb24472c14);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6de387ff4bdaf3ca);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h11f60019e91ddebe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h785f1232d940a666);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hee9bf22e96500b78);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2f34a9d86f8fe5d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2a9b8ac7d0705bc1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he4b865a594f0b38f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h715c98866673ba20);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he2b9a0f8a8067fc3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he20cdd1d2624f156);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h785f1232d940a666);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hee9bf22e96500b78);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2f34a9d86f8fe5d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2a9b8ac7d0705bc1);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8a3db7214d090ee5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1c4bd8906f94bb28;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9b289f80c984f60a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd602541c1994c1eb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h0e48ac8b2a9a3532;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8c9544122c59c100;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h037148480e8b9c15;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3f8bd2d300a3030e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h6d789344a9bc0822;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h290f7d0be422bcd6;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h04d17ae237182741;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h5e4e7c88feb151c9;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000003d;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h6ffb0a9159bc6507);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he99692090d7325bc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he3a24836d5fd68ef);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000c1aa8344);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5d7730b080068a73);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he67367bcc701570a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h4fa46717a18d85b0);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000c3ddff5b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000038);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha743e7b66f6969ff);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5291d6e986df172d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd047c96767f866bd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd4a320f213fed707);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0149c5a8abd29769);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h40f2c1101e98936b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1bfd0a159a2a71d1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he0208e1d7759ac90);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb37ba44a233cdbca);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc06cfc8488c91045);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hafcc699dbf61b329);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha2777cf45745a4eb);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0149c5a8abd29769);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h40f2c1101e98936b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1bfd0a159a2a71d1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he0208e1d7759ac90);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hd3a3323814c05c3b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8767caaeca181417;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb8348dd256149af5;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf61be0f2263456ab;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h173f3dff7ff26e51;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb72c88de8b26af83;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h304d67434e0dc7d0;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he98f2e4fd2be89c2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfb1c52002c2b3c6f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h88b38c19a01f4907;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he241601270367740;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h19385193fe1fa516;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c5;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h11a1ad7c15e482b7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h581609de15079839);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h95a33e2dc58e222c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d5c6043e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1fe0dc75661ede01);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h86ace1168258d9b0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hcab8937fbc8f85c9);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000da4bc828);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000023e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h5390c35a03d2c87a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h092fe51e3d631d84);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0061396717073b66);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb2648204676af141);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb5392d48c65e5557);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5d736c9137c8fe74);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h24d08273f639da85);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1177d990cef932ac);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4afed4d1929b2330);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he2bd37bae971a3d9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h43f4098a1b61e618);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1c5d7c7f5b52da4b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb5392d48c65e5557);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5d736c9137c8fe74);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h24d08273f639da85);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1177d990cef932ac);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h5550c34ff7295191;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1e5305c69106c8ec;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h14d7999106bdf751;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb36d32758e9c3934;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hbe1b4644681e716d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hcc1571a95c0e7bf9;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h64825301ceb864bb;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hce864c94dd0cb36f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4a0711a9a672259b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7629ce92e0d7fcbf;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h97c00b86c8f8820d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4dfcc8d79faeecca;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ce;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h429c045b6e6fa35b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb5aa12c808f980b4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha1ff3a64d5867407);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001f291104);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'haefdf5c1558e6344);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he42e9f0183b0ec62);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd53a3c91527158c7);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000b07d12cb);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000033c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h142fddf0410a0a37);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3bf68af225ff5529);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2adadd8ff696add8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hfc0e9206634fd829);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8c30f858a0a27e94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4dd6e0bafdda10b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9f9d5bb5669dde4a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hda3b8ad24b514800);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h845893d256f49af2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h833fe41bb3534564);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h5d6f2c4dcd798e6b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hd6257a29fa0e49d1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8c30f858a0a27e94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4dd6e0bafdda10b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9f9d5bb5669dde4a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hda3b8ad24b514800);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1f3132c8e9d55c0a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he8625399a77b940b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h01ad0948b21d113f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hef52fbc28a9a4ba4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7b5682e1065b7f9c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha9bc0f1a0c2e7daa;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h09bbbfbbd21ddeb8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4987baeba755ed02;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he6947d3107682dd3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdfc3c87796d98a75;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'heeae87e3aa1951c2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0355f02bea3d5075;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d9;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha7636ff4b3e8607a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9bf3b8df3d5fe37e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha1a31395c7b8675b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001ff7ff06);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf0bd65e49e6bc5aa);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h11b458abe5380849);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h362eed3ebf747a5c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000951434f9);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000000f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h636741d60c90e65c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9af8deb96991a887);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha911f505cd6dab56);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6bbbd59b928b8182);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf8f509698187bdaa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0757e5cfe9c05e3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0dd2145ee66c9956);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2fa87a7d8f988c57);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hdf63bfbde6c1daab);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h67d8e8069cff22e1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbde5ab2a673b3c91);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h49e853b10b1faf47);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf8f509698187bdaa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0757e5cfe9c05e3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0dd2145ee66c9956);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2fa87a7d8f988c57);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h55214c9d180719ec;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha168565259ac9691;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd880061e068d62d1;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0170054b95661336;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h62c7a947d7b40d23;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h80b5320e1c30866c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hbc693a6789dbf64d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h430b63e3cfc563da;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h47d707ac50bf283b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdccf73fbdbf4753a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h499e66196421d87a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hdf5e7f94d1c484ad;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000003b;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4820eb787e506ae3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he5fbd65eef630ded);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0d96f0a1e0a2ef9a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001f45419b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc8f8e2c12548275b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0f3b525b028b93fe);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hc8c8d52220260c27);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000004bd7affe);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000458);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hba929ad5a07afd55);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h8e687de1cf82370b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h75909d856cc8275f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3e56c3aa404968fc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2fc305e10942b138);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1d611dc324ffcc51);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h959e237d050f42f0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb1207ce0cdee8800);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h82d666faa864736e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he61f9a2aaf4ca3cd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0849cc3e4d17c821);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h54b2275cb39defe1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2fc305e10942b138);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1d611dc324ffcc51);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h959e237d050f42f0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb1207ce0cdee8800);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he9a08db4b77335fc;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0feb36a855413a0c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h71fcab55fb724b3d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he6036dcb4c3b5898;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h140d4a9d2a758976;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb901e75ba7df2a95;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h10b78732b0b4f4d0;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5af13f8b842c8243;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h23e02df949f26e32;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc07f346155be7410;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha9b70b6b6bbba9fa;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hedb6a3492ffa7546;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000b4;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha34f7879ecdda5a1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h31232573496c7634);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6f6ea9c3de36fe33);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000003ba157f4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7b0741f551f35290);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'habe12c2ef1cfae62);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h898d25f47ad0b04d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000001f775c4b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000023a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7e1066145c995883);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h01a73b832dc26cf1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf275e0d9fa08585e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'haf736718f022e5e4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h49cc7c47381b051a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha094724817c8557c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0416541cfe3faa2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbb1f911939c5c67f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h548d8e616593c386);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfefaa617f92f5970);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2fa8f1d1ba0097d7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7b91aa2df50c237c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h49cc7c47381b051a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha094724817c8557c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0416541cfe3faa2d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbb1f911939c5c67f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h056687d8654192c8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd54db977459b6723;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7a3752dfc7d726ee;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h72d3f0f6f3b95533;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb49b110144a749f4;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6e260e61c31824d2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8bb7578609434f6e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5c03f6bd2a879162;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hdde55d4514ebabeb;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1c082fb1d188b9fc;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hcfe0e866eded42f4;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h45c78f6ddc77b0b6;
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
        keygen_cycles_54 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h0430de4ec7141440);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h897e69dbbdfba95c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hcf497ed58d7dd569);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000baac6ff0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1b6a4185a4d11261);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd39ced9f8792d8f8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h9341101b1397a115);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000068177019);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000006d3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7cd363cd9cf178f9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdbb5632d1da15333);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hfd07d38f49661ac9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha6148f05b73078f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h28c17534fca61473);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h59747573622fddb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf7805b0360261ee9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc19b5a5a3b4d5b78);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc6de67f81b5abf69);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h81f5a41b08da79cc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h87756376e7e5527f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb4755c8cfd41a378);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h28c17534fca61473);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h59747573622fddb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf7805b0360261ee9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc19b5a5a3b4d5b78);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h30dcd09c4967b387;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h504d66e45f87379d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha05eb41e8cadd60f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb40c62a97b526db2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he41ae642ced1365d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hff682ff746c78480;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hde445b8e37fc3a53;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4205d2dba3f254f3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h419f4919f6d85d50;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2c046621e6346d02;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4c4b028099c4955f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h55b2492f739d04d4;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000001b;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc47f24841903bd1d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h49d50ec942e2a8c8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf55b7885ea5df4ba);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000de7d1270);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h664362f7e96b9d7f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h16beb91acd8cf75c);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h4cb4fc418f679267);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005c465cdf);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000437);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h64dc7362e7eb4289);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5e724d552d029814);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7c3f5e4bcda963b2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h91e0e50d08e7adab);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd9aacb16744743c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcff1dcdb83a2e693);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he07cbf624f7b2bb9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h46993bfc99c8756a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf087b45a4fe3117a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1c7cbfbddadb6d6b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h98565764eb701565);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h08f269e9e8587cdf);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd9aacb16744743c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcff1dcdb83a2e693);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he07cbf624f7b2bb9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h46993bfc99c8756a);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h959ce16ed39f5fd3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he1a5fdfac06c1f53;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4036d4fe31e8f19a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hfd8ccb9691226cc9;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfddc3e24d008e303;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'heec4b87d6ecdda01;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8038aaf7d4b6d429;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8488f201d828579c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he7dbee6a4a81043a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he455c1fe3594242b;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6369ccb0a62e7700;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h837137ccfa6a7db1;
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
        keygen_cycles_56 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h47324e6169a7d0c4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h95698da7d7d8089f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h533b4b4512014b0c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ef11e1ed);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf6c374d3e5edaa14);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0e60ed0601be880d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h32efae21adf7755e);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000016fad65);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000156);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hcba01ce9c2e58612);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hafac75999ed28d1f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h5ad83499e9ce29c4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h303243c8a11cd551);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h422ad769c62934c4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0a6af92cce235f4f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7cc9572b6ee16574);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdbf2767429212797);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7b3eaeccf02cea4c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf0f7b1c6a303cc26);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hef598b48a229a6c4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h574f0473e1f474e2);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h422ad769c62934c4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0a6af92cce235f4f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7cc9572b6ee16574);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdbf2767429212797);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1361cc11e80ec712;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha1064891de3dbe43;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfe34bf47f67a3401;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hbdd6c4bcb028dec0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf960968a3fb19085;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h421d03518e2f0546;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2545cc93bff5a9b8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd8fdb36c13d3f3b1;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h5bb8073bd9d361ea;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8b8ed2eaefeeb969;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf1a772ab48f1ac2e;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h891039f4193585a8;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000005c;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb19d97ad85d76cd9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h45226002ee86fd7a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h4a9c56a02983f526);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000097df2440);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h11ace99cfba90ffd);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h4375c4b7595643fa);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd5f87a967518a544);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000ef8b176a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h08b806869c489375);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdad1e314030acf54);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h813306ace03bf175);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb607520c070b51f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h56f156391d15d3c0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hebceb086b5925ace);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd93838d139af4536);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc9bb99c10c331798);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7e78c326fb83fd9a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h86db0e7ea0c8dfd7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he7fe5df4bd7c2e93);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h342b318e61a5d51b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h56f156391d15d3c0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hebceb086b5925ace);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd93838d139af4536);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc9bb99c10c331798);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc2d134c4b52f37a0;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc519fcc96ea216ab;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfeda11a88ee74aac;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he211a92fa4941275;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7e5b0768a6e14bd9;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h0479de7e6fe07761;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc1cad19828c2c50d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4f101873f00999b8;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4dcbe1f826ebabbe;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7b58196056adb916;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h576dbde4b85e96ed;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf03965d9d9332de3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c6;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h38e2f8da80811842);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hec9fb00a72d7faf4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h73d2f7c206313b84);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000041986558);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hcb78131cb1b49b68);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he11ca5cdd1308a8b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0566fdd78b939366);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000310e7a83);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001fa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4617a57a8570651d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h43cd0c25e1aa23f7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h30a88f7ff9c16e4e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h73a0a2699f24effb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5d422c3abfc02f45);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1f94a442fa099423);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdeef24267d288802);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfbaa952b841725da);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha9afc11ba4bf75e8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h84e720c322315c2a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h6ac04fb95f533848);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5cb30dad1b1ff206);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5d422c3abfc02f45);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1f94a442fa099423);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdeef24267d288802);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfbaa952b841725da);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha087f559db0e8126;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4e918c0fee05e290;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h163e27b962e41883;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h01b3fbd987718581;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7690c5514d5675c7;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h047a152d414f06b0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2fc7e2e867df8df8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1abd3a95f290848f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h18cd76a8cfd8ac8d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6cc0886baa7485ae;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3dd76d680e3cf010;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h06bbd5803fa5aebf;
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
        keygen_cycles_59 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd0fa89e06de91f7d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h458fbf08bc6a245e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h5f58842599624b4d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d4a7dec1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h81ebfd2e7bbcb508);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h748f870820d8c8af);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h6b953a04460ca7e5);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000c8d5963);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000004a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hfbf1e07a91e769e2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3fbbc87c0dbd8ce0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h73da2f06b53d50bb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h8e3103833dfc7f9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8334305fccf993cb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf2a67ade38462b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4ecf48572cdde2f8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd83a753f0a3ef8a5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'haef4e83a131421a5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3094e12b76a0d55b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd0ff71be091ca4ce);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hbbae4296ad08e31d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8334305fccf993cb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf2a67ade38462b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4ecf48572cdde2f8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd83a753f0a3ef8a5);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf82dc69ad6256988;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc0f3a7ec7e40d6f5;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h28d1681bc0f45afe;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h085b260c6c32485f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc15ce53096cdbb74;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h623c2b72be458516;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h61cc81aea549ad22;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h9592241eedfda620;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2fab9d36000a6a5f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha9284af3a71cee14;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4b08968b6765a411;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbe55b5295266e6b3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000004c;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9ce4db9b23be7997);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h74f9d98fcba4e699);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6bf4f7f9922d7478);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000c8de73e3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6ad4d865359da031);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h2ef498f4d2333a23);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hfad2b4c99b9b0979);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000001a4c46d7);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000144);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9fa62ea7f154e8ff);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9cce62d10f8bdae2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7bc09b7fc9b81ddf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf6343f017d2ee0f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3e81a9e81da58e6d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h940d69c1fad74038);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h491f056c57a054c9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f01af32ee60d481);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9af3e288f7955f89);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5cfde56856c1f34e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc7435038d6401a83);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc89fb71a3f17d5d6);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3e81a9e81da58e6d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h940d69c1fad74038);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h491f056c57a054c9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f01af32ee60d481);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h58c462984c3468cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9394bf03d106da64;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha1fca90c7fae3e94;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hed899928fbb967ac;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h09a2eb45dd27d40b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'habbac27adca36ec4;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h65034ec5fc94786b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8810cdfcf38b3f5e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hbd48d823bbd5a669;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9841b3361415a744;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha5ecdaa0ec0bcb11;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h59a4beae20d02b07;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000022;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h136899d59da2396d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h20152355f8c8f367);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h3ce84a8cd1e6ca13);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000087845223);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h22eb0d6c56a2797f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc89fdb7cd3c77455);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h1b836e5d105fb944);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000074b76ca9);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000f4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h65601f55aae77432);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h554ceaa7de7232d2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hade94c84ba12d9e1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9c1f083a60f02e95);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf6f68231c07c2df2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h36e8aed178a3d365);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb7f5e7e85cc35b25);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0a52984e9667195f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h0cf31dfb0aec04c3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4b6c0d5370d2ecdb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h19b3d043805a69ec);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h59810c29b306efe5);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf6f68231c07c2df2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h36e8aed178a3d365);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb7f5e7e85cc35b25);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0a52984e9667195f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h501222743c108357;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h260d3925c9e21cbc;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he1e9684df6ba4a05;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6a3aa068351a9ce4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf51df4158d537bfa;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc53c2c7f344c3e0d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h59e681a01cbca29b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hdc5f86d35c333854;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h355f817645f2d69e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8297a67503443209;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h76a4668454c080f6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h01e8cfd8e30eb875;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000052;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h97cce184572d5bc6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7db2f594bae143e2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd81975e33f6988cd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000009092b4b7);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h03dc64492284e2c2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1e63157cc6ea3573);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h56c5caffe0ea309a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000fa6a6dbe);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000111);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'haff3f7b5241205c5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb0343ab6ef61f36b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1fc37012df804e13);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h23f8b9349dbd4b6d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf6b570d57d2ab162);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'had7db0eecc7b329b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9d6d2054a705165c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h64e80ae7d1607556);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h28678959db0162dd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hb06dd84f12edd19f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h06dbf04d0e0f4951);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8244f9406faed8f2);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf6b570d57d2ab162);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'had7db0eecc7b329b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9d6d2054a705165c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h64e80ae7d1607556);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h27ce4c9b5d24663f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h5e7ab33c2c3a9685;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1b9405115ed7858f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd3b45ff713edb3d0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb9335cde0b0a5ec4;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h906c364f9a724533;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb6b4ed8383379ec7;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h80a398a4b7e3268b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h87c4a9f876f448ea;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1d539a013d056188;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'haa361e22e2d2c5c3;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb1d260a5532b666f;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000006e;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hbe3a66ac9fa12321);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbcd0b9e4f09c5a8c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he7f5ae0a6b7771ff);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000008f29e0f9);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7c46f6889023e698);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd8461042b5b38300);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h593b289b40ec95a0);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000e6d7df0);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000009b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc7f36fcc8a7fa90d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd78a68169a1c2879);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9a0c958b17c391e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h62232dc5865f0730);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4fa0fdd54fd294d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcf8fc053d4cb3a31);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfe6b1024f5d245d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6d07e50f120d83a1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7eb09efdf8ebaa93);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1688ab9fbecd8449);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd95c020df357aeaa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h776d4fe0894de25b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4fa0fdd54fd294d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcf8fc053d4cb3a31);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfe6b1024f5d245d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6d07e50f120d83a1);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h85fc55af55291ed1;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h994228ef227cb1de;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h99b7c0eca9d52a58;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1ef2394e57ce6d5a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7c7fd37663f3f54e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h1e3495c70fe4a0c3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hba4daacc5b3977b8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h08f5f82a20bc703a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h97dc3a83af81bf6a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdfe574d4a9872169;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3ba8cd430aac3ff8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'haf11ade2f219fd85;
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
        keygen_cycles_64 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h7d4cd85969a927c6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h6330ec9540eb8119);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha7b1fb58a1e0f40d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000bce75e97);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0bc27b2857db2df0);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h42d5c83850e342d1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h28f7a48addb9ef7c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000014346caa);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000004c4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'haec1fd65c1082a0f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5d3f2bf23235ab56);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9c517f99b6062277);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h1e19967b38516967);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha78ff68482f159cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7dbba49b91d407fc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4aa0e921807effc4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h594fa84ff171462c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8188835a8dae4aaa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfa5fdc535ef69f34);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8b1f6be3e9f87886);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0754d22ce6f3cec9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha78ff68482f159cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7dbba49b91d407fc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4aa0e921807effc4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h594fa84ff171462c);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h065952af3ec1c9de;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4ec6469772e31e8c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9817a215292e6be4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hcbcf5f990b41baa5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5c0f041f0df5a22e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h983692e1bb040e34;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h75b1c0ab4ecb073a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h162a826e945c7b87;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8a7c40574811d136;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7d01f43673c217b5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'habaaa76d766ca735;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h63d1e7ba4478b433;
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
        keygen_cycles_65 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h44944d440f3d2c12);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5e888acd6416b9fe);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h80620a60fab55d5d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000005a984e64);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hca009fbba02ca763);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8f5f015dee48031e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h26faa6b836ea5c57);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000f3bb6859);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000413);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h009b09e7fd5fee1a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0cbf69a3bfce7809);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6383b2d13cbea5d7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd8aaf8e2782f88bc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hde16a0290a787dbe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h104c71d7aec008bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3b7b6e656ad90514);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he45edb61645238ca);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8255aaa3816495c6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4346b078ee06ce4d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc1ffa5b4980b1170);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6265bbbd12771406);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hde16a0290a787dbe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h104c71d7aec008bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3b7b6e656ad90514);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he45edb61645238ca);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h54de7e1751ee7bb5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h912772c1baa83fab;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4026d612853f0bf2;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha9cb84802b4f5088;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc7b1546c0dcfc84a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf7c0d112b9913145;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hca999d5646f2ef92;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1aa6bebb09b3e43e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h65cd6b8064eb91e6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc687fa1458d9d025;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h377e6c385322d655;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd2d6390576aebe5d;
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
        keygen_cycles_66 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf794365890d87e22);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5069639a28704e6e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h4fbe50453fa149d6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000004d16a725);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hab626957b856388c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5dbd086618bd4d93);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h27f957074f89782e);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000df56b281);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000004f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h751eafb869ae593a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1f3abe74697e247e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd0b6a8972fc0e77d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9aa1d654b7518f68);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h29a73b760cb2b9b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he7b01c30ca1d9d21);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he22757aba75a8dc6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha49cd4a45db5d85f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h6fa146172f1f43b3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha753d1cca31698f6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h40d8850c1e625b1e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h177799742535df24);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h29a73b760cb2b9b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he7b01c30ca1d9d21);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he22757aba75a8dc6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha49cd4a45db5d85f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9771c678bc6afcea;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9a60754485f58b86;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h25081e603fe85a35;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0189cb22726fbbf4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h07e8cd4a2ceea9a9;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb0570c342a3a1d0c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h552da80723d15358;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb1024394e1c0cc06;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h580eda8f58643edd;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2ede13a3f7f90f36;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4fc33b0394b5b418;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4f87ca19086da125;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000006;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h674bcdbe55839789);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hdf90c62739d61e90);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h176fd7bebba58511);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b27710a9);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'had16d1216a9d8c1c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8625567e8d358945);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h8452c1db8edbdad7);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000045d82ac1);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000005f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb6e280a43598190f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hcd2831afcde80efd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9dc188c9085d4431);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h577ceed0bcf908c9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4ab0f8e978e960d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h328596e17a0bbe3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb2526b9b97d9bee1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8a3be010d54a67d4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfdd81991d84467df);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5ff90e1e2fb942f1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'ha14239db2103189a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h56880dc3c19f8db1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4ab0f8e978e960d9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h328596e17a0bbe3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb2526b9b97d9bee1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8a3be010d54a67d4);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h73134a5068ea9558;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he8f8780405192e1c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h00a21fd8aa012387;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha9e94ab2ab28059c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h60b3c0f10e90c5fb;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9c4ecddde80096e0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3666390dfaa11fbe;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5d0fd35ad9c82a05;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2f898e7aa1309e3d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he2fecdb591936378;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb659f9beb0aee79a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3c953caa1027e74d;
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
        keygen_cycles_68 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb0a0bf7813ccfb87);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf65132a4504e2d3c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h9bee433e75952332);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000277b9fa4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h213a0ed9667e247d);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he172fad24f29d7dc);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h21921de064cd290a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000073545ac);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000de);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6a35d415f0c30e02);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd7f6424dc33678ae);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9e9ae75c0a90bc11);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h2240e1a51ddde348);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf87c641ba9b7e6ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hff8a2b7ce9d40809);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h18ddbd610f387c46);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdfa83617e3453d46);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h56e7a77d00f68db7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h791e5907b2d0dc4d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbe5f2a9d2fa39d36);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hff10e3beef84bef9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf87c641ba9b7e6ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hff8a2b7ce9d40809);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h18ddbd610f387c46);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hdfa83617e3453d46);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf6c369d78741d705;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc5b82378155fa931;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he11db894915a1dd7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'haeed42b829e149e7;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h2be012e78dc4adea;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h318cb359640f270a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h7d6a19dabab6714a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hfdb5b3c413b37f69;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1f85882652ebec0d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8a11cdd99392ba87;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h65d6c1df7546df0f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h542de69edc4964d0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000dc;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb1e1681d0d9ff112);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he7a081de5fd6d715);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h72aa82a5e1e80540);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000ab575966);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h98cf1b02d9f0e75a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h63d1990ef60835eb);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h616a780e17976b15);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000485dd338);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000116);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1d9955db118e4102);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h48f221e86b7a5c30);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h559b2432dbe03f3e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h59db908d5216967b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2a5bfbdf2189280f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he8a29f667e43a063);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0a61af387d51009b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7d5c0fd6ca577a4e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf7df65168b3ac618);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h81444b22e8f21e2b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4163dcd5d9c01ca0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8ad262ee03ea52d6);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2a5bfbdf2189280f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he8a29f667e43a063);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0a61af387d51009b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7d5c0fd6ca577a4e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb6f014667ef07283;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd06008af9aa225b3;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h6968fa0f68111f70;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h952033a3da657410;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he3d2127a3b1efb8b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9d8c1e97a31d807a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h41f46dafaa5351a3;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'haac4d74b74f2e3de;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hefb025ef568b3752;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hefaea3266ca23a97;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he54346eeedcb2565;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'ha824c84913e17b8d;
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
        keygen_cycles_70 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2183801855700e30);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha2c36022b287ca1b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h320119ffa97572f8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000b4c1c261);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6cd3316736a93513);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hab0d64e16b368270);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h30fffdc5eccaf099);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000455e5566);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000be);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h54053b3710460643);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5c87fd7f52e13ed0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hce728d0570b640c6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h400d1192a4d35405);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd359b071c3ed10f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha29eea9a93a7e8ee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he7d201cd761eaab8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc7391b061a604592);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1724ccd36d00aaa6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3ba84d3d60d8cb45);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h48c0473273eb1f9c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he27e403cf3372ebc);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hd359b071c3ed10f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha29eea9a93a7e8ee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he7d201cd761eaab8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc7391b061a604592);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf7b41c935840e66f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1a45253a4ee2872d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hbeb99b8f53117eba;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h007ad58ca1dd8f21;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h9bc4f1f75e7703f8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4ed57985cb9fff77;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hafe73352acebc9cc;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3b0a5ff6d067300e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8f83066bf1cc813b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7fb8961fe80ce1ec;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf758e71ddc59cf32;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h37f7fdc6ac4674c7;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000007a;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5893774ae4423f09);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h32333ab73c221c76);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h012bd3eff88cb201);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000824bab2c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hdf351536c6d292e6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he5d6136a2c9eb8de);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h7d00e195068b0860);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005460602a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000036c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0f34f102d2c328a4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd2578b3b247cae50);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h284afe02fecb240c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h997c0292666f2573);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6c6a95f53b0848ff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h54cc8ecf877799e5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2944f87e178ba1eb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he623caec16be3198);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfc569742b818c1a1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'had714a7adb14091a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbb421995dbcc58d8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2f50d7f5fe7a3d41);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6c6a95f53b0848ff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h54cc8ecf877799e5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2944f87e178ba1eb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he623caec16be3198);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha0d6931e3e23a008;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h6988af1fb830b410;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha87f0e69b90fdd8d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h56bd2ef54667e7cc;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4a80589f0870ab88;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2d344563598a4407;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'heb8c1508a8ced1ba;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h438314af16955afa;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1bd5c1c1d4126951;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h14db87802cf36538;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hee4e1d43d986e388;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h32d60a3002a7e6aa;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000004;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd75de6c6f4504c5e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'heee7272db9bc41d3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hb75bc54ecad1fcec);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e891a570);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6da34bedad8ff605);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h65a58ccaad12ee35);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h46389420980d290c);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000002fcf510a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001f1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h92f6f50db17f118a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h38b1004ce727f9ab);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'haa8def072ecad944);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h23cba64b95feade1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha34848fbe666904d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4ab62b22b93bd311);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hac5f2de5f0a70e68);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h101167a3b75f9c45);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h0b8a5ab1296e9241);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5f1aa1eb78425686);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he2db3d3437ca9685);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4e796656997efbe1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha34848fbe666904d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4ab62b22b93bd311);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hac5f2de5f0a70e68);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h101167a3b75f9c45);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hfeb37b6a6a8fbae5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7c4f0adb6e199216;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb4b24373f1698fff;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h831b9fd2b4abebc4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h0a9886f2674c861f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hed5865e5f128e43c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf2a131d128969832;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8879c88a747ff5d2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h81d44224bdc39089;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5144a55c8d34cc71;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h1b0ab2c44bca507d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h761bc33c41df648d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000089;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h14d9e68a71ebb7c0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5390bd5151729c07);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h094192da208b4e59);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000009c170f5c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h00e26a7d89c8626a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h458e9d4c5d224d57);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hd01b42410d963b33);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000a744f4f2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000170);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h822f74591bc05c37);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9b232c61aeda6ccf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0f08165ea410617f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha4b2241ca91aa07e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4948d450ef8b85ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he66a51061a0c0e42);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4ae9a94cabaf6a82);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9ee7b9ebcd876b6d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'heee4ffeb76ef2563);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h195fefa878b8e816);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd123513b37d1160f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hec56178d2c586c5f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4948d450ef8b85ea);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he66a51061a0c0e42);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4ae9a94cabaf6a82);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9ee7b9ebcd876b6d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hf83601440daccbd8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h56e70c8d4e71bb8f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h0e435fd7127bdc81;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h7bbb9d6ba50c51d8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h025934dd94617fdb;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h26cbd361e8a082ec;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h5cb63e2c4ad5cb39;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6d4d08d71c92018f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h98c8083bfd1af350;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2bf1d060898558e9;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hceb0e812d13a6e0c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h13621785f1e85bfc;
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
        keygen_cycles_74 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h7870092b85e716ea);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc95ba89341c4804c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hbd34144d18786cc6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000e8b07966);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd77433489b36b9d1);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h474cafe02826c091);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5fe09fade4db65fd);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000049fbbdbe);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000d9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he94802efe5dedae8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2ad04ee80f4de6fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h08e84355bcd184d6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0fdad0916ced4092);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc3ffcf262a888ddc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb46e666f6f0fe419);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5fcaaf57b020f49e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h64cbf40f7e68781f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h80d0bf600a5a2d5e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hdabdf53de6ac5282);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb1d303bf76408666);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h9204b5baa0db9f13);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc3ffcf262a888ddc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb46e666f6f0fe419);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5fcaaf57b020f49e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h64cbf40f7e68781f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h5e16ac694d9039f2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1940342472745ec2;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf2cfb32e1942f017;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6f031d05700f4b16;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfcc382c334dc77ec;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h59d02c20df51912d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h219e56963da1d396;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8d628689ff2d8903;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb6426f431e984437;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb4d1f40932b28ec5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0cb9bf483983ad0d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h2133572703ce4394;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000006d;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h923fd39ee2ee6f8d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2cc7add9a6dd8c74);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h23c4077fe36d302d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000003bef76fe);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h263a5533562ed01f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd21fe034c8df7333);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h743cd948f70bebe3);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003a5ee85f);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000044);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hd04e4f3083b913fc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h843a8707543612e4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h96226cbdb082879b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h2d79561cd88d02f2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfa73af477d5a4c01);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h79a6a432d627fd8a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9a5b2d85418ba5f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h06222028827f66ae);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb957b82662a339ea);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h74ff355313105a2f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h96dd49991d9f19a2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hddec2e256f70efa7);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfa73af477d5a4c01);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h79a6a432d627fd8a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9a5b2d85418ba5f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h06222028827f66ae);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4a21269a14a43fcc;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfd39dc55edc01b62;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3842dff11a68988e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1bf3d063c2115560;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7f78ca7c0dc13a6e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h40d97278d5647460;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h88626cc5684a058d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1e216a55be1bc0fb;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7579f23726caa3fd;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h429c682cdc910c30;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd9d301c3fb60b070;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0d7be37d970b42ea;
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
        keygen_cycles_76 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'heb272a9f38e239e2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7f24c66627bddb81);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hd18e41bece0cf799);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000a6b8d4b8);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h29516459c15ded5c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he67c14d2687b95b6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h977e34c4cdc8f67d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000506b7824);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000006);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3d902bdf7e4aa327);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3181bf29e2384640);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h972e1485e6af51e5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h178b20d26fb5ba72);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf683f3e2b91c717e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h62ecea89418e3fad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4114bdc956480aa4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h13bad2a37c3c5e4e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7f22ad7da5bc95ac);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h65e13411737934c4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h23a79b785bd76da2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb24b4d1545a3d244);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf683f3e2b91c717e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h62ecea89418e3fad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4114bdc956480aa4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h13bad2a37c3c5e4e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h401a0597d63e2368;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8783ceba3f3822dd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2daabb1c624f6f0a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha62b81624490effb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd958c44c8ff88e15;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4f48fdddce607c31;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8357a138b70dffed;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h21fb29e25de25af2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h56ba99f7078c853b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hee111b886595406d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h58cbc60328e4820a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3ee4d84221d7a0b4;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000b6;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5d5b69cd12c6fa30);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1a0122e3c4b28175);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6a4475bf2408525b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000201d1bbe);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he23c7f043d89af65);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf05b667b3bdb6faf);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'ha1bb8ded48b23bdc);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000042613927);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7d99832a589d83f2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h239a477065551e63);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h27c3b9722236b931);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha6aaa9dcbe2e2f73);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7ab9fe5ffb76a5d6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h749419bd6676662c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h06b9e12f6c372d44);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2e8353604d5a3ff4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h0e4947c830bc04cc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h45cd1fd57637206a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hed7b708f0792a066);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h092c66def89e014f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7ab9fe5ffb76a5d6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h749419bd6676662c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h06b9e12f6c372d44);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2e8353604d5a3ff4);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb12e8aafe7d46559;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb8c996875fe7ffd6;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h180d0cb770abfd00;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd01848f99cbd4521;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he12ec4ade2322e3a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2ab98a13044d5f56;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h535f388828133496;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2d5ea6d733427016;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7adc05eee8af0601;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h01816d7f49a50089;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h9298615d65b59c0d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7e995d316c91563d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000001e;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9bf0718afd4569f8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h86abb2062f7eaba4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h2bf5473c9448b366);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000062de1a5a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h14b02f7c4bd08c8c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h017c3014bb3a02da);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h792a30dc59048ced);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000047147f06);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000055);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb509c729b4a17fb9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha37ed12805f829e3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3c1da8c7294dd20e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5327786d596c49c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc4d36644d6a69bcb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0ea0d754b3776685);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb3035c743f860dec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb95632de27e401d9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h6d16b9c5828bfa0b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1c57076cd92cd33b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h830269a5fa7e5d0c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hd323ff6ed9f0a8c3);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc4d36644d6a69bcb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0ea0d754b3776685);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb3035c743f860dec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb95632de27e401d9);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4c4b992e2eb1fbaa;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc135c539a464b12a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1885bbfd489973d5;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc52a2d9d471727b6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h292bb16fbe92cca9;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8c7219de23d7297d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hcf10856b74516174;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2b0c06edee1be887;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1106330fe5ebb737;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd97af29ce93ac3e4;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hae3e40f667df3ae6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4b4f2211abff3bb7;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000dd;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb4e67170772d0645);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2af404fc03db8615);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h7bb5eb9aa5b770ec);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000c7f87f6a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6f29debe7c8fd551);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h06eef4ddf7915a94);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5d21bc20970ced4f);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000007fde4585);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000206);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha06e488359850bb6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h55ed444deb1033ad);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h73619ae40379ca93);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'haf0faa250db5e182);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3725204b72f5580b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he98da32ad3db170c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h426171d943aa4ab8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h11460400cf697d51);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h72e9a86569b84b98);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h560be493e822af73);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h779ef245e4d4585e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'heb3fbfd5bd2d0183);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3725204b72f5580b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he98da32ad3db170c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h426171d943aa4ab8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h11460400cf697d51);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h3377386c4574da9d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h5c3fe7711709a7c8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8ef87aaeb909d5d4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8312b2f7a700593c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4190770ffaa4e345;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h88f626dcb2664c31;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd8f8284d6dbb170e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h37eb957f67588e53;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4a53c6fe0e8f5fa9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5b59d851ab8ab0b0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hff6d85736646d2fe;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb14591939cc50dc4;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000006a;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb9d53d5fabb1cb15);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb1b4b433671bc2e6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h3ad7225dfd2c7376);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000007c783add);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h42ea0bccb741c642);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h05362dab812bdd37);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h87dc0dde762d2dfa);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000649f0fce);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000041);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h25ef36330bb367b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h94cad56fdf49d2c0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hcc892f4c8010f9b5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hbb61cd98e1937e0e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c43698512e43053);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7a2a3d8bfa12b52c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hea060f13097ecf81);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0567790d464d74c7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h00d63d0e60b792b6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hcd9739b00a5330b3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfeea91f589e6c32f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h242eb7c42d27f4b9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c43698512e43053);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7a2a3d8bfa12b52c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hea060f13097ecf81);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0567790d464d74c7);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h68f322faafb27a27;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfab46b72cbce64f9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he7877ae0a37063cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h732eb5862cc1aef6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfebafdc3f3fc4b8a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf5a0d85ab66261c0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hea7e1e29c0ff3fff;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hddae39efb1418b15;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he145a0e8be6ebb97;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3b1c61217ca53e59;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h11ffae62115004b8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h479b73bc1fd845e9;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000008d;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h652b4e36b4abb92f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd2c71935afe06bb0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h811e1b0707f69d9d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000daf82608);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hdd0e583c79c131ab);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc0ef01a8b4fcd073);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'heb3aeaf13d7154c3);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000013d48fc2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha6c04ddd1ea89ffc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2b463bbab21341b7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3ff11edaf4d63101);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc6296036b8c28422);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7ec4f8a47a7a61a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4499cf914c48275e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hefa2f62c7afdfa91);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfb543a88000538b6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h0123df393a0242be);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hae1f719538930f39);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h7f86d16cf5d88b22);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h810f7f9d18912005);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7ec4f8a47a7a61a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4499cf914c48275e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hefa2f62c7afdfa91);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfb543a88000538b6);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0e6a0eb014a8b322;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha6625aecc9e5f1d8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf56154ae4dbf4ae7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hca7d0e5e3e6200e4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5ff10a0b4cedee53;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h1c5eaced9f5d0aab;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h25d9f685090a1f95;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h92311e257d4317cf;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8152a52cbe59f2e5;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h603abe17d58d86cd;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he649a80f4dfaceb9;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h467a2fe0f0703a42;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000005a;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hcc443dd1a9e71672);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h57695f6ffa3c416f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h31f47e8d2fb3a02b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000097dfbe54);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc2d50bb9441570bc);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd4ece04013484e74);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h5bcbba98fb12b423);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000009bfdda0d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000014c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hac357d6b3ab60ec6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6f435e1c5e50682f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h916a10d9304c4a1f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h460b294c0bfdb5ec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f89f63a3753da04);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h78414b12d329c270);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4eba5d5a26458217);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfec08890679a2bb8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he78d760a6a6af952);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h1e65e91125aaa68f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb43a6cab87d01a84);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4ddbf40216eeb013);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f89f63a3753da04);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h78414b12d329c270);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4eba5d5a26458217);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfec08890679a2bb8);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1a29ad54bee2e494;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfda310aa351dd282;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha3efefbde72e9fe4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4685550311122a7f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h75499adefaaf6aef;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h41a68a4ed302f587;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd690d37eb2ef5f97;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8d797d30abe5df0f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd66f0b025ffd1c01;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h78ad482e18b1d92f;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0dc111028e70ca40;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcdaba20ece99639e;
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
        keygen_cycles_83 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5b3a0864dcb53a73);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hadafe5b83cf0b4ec);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hc963e1b3d117665e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000008a681de);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h8e451d4179ed8fbf);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h20a35af35bf2eddb);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h956b3c7371b5b720);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005d478106);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000359);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha7820db65e0da035);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0d0386b765651316);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hc52ca510ccb82999);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h998e9f7361ce0110);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4f0fcbccddc30e58);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h01e0de06e4c4a999);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc49b8d004469f99b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e15c55efc959e15);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf364c6e02987e061);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h645b80ad18c68c97);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h5fad0192820304ff);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6fc5257d4fead749);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4f0fcbccddc30e58);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h01e0de06e4c4a999);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc49b8d004469f99b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e15c55efc959e15);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8a36109492c754e6;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h89e1cdf0d693d62d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hac06ddcad7e14498;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h004de8ea1bf4e324;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h6f68f44ee9be9db5;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4ce9494a6b8897ed;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf811dcfc7ce7c8b2;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h0ec0bbc7e6e8aff5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf177d7e01eb804c1;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7bdd133890b0ef0c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hba7d6d48585ea25d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7c70699e56699d11;
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
        keygen_cycles_84 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3b68816275a65cde);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h77c4b8f5461123f2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha2d129f3a784ac80);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000005c245a71);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hcaee11259bbec7ca);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h828d870aaba6bfcf);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h4464554e0b512a68);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000001b1e4143);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000144);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h65de6852da2bb8b1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h076cdeecff7d600f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h68ee6d087f150f05);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha28d10b6b0fa8413);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9e05fdbc72d87595);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h12a9bb83d860c1f5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h56dbf573cfd943ff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he044edf4c2428654);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfc76b1dea82a041d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4c4f08da5fa98b24);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h949881d7b5792a90);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hee3936d252688ff6);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9e05fdbc72d87595);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h12a9bb83d860c1f5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h56dbf573cfd943ff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he044edf4c2428654);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h741d4dd734873d80;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfaa096fd23c60129;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4263064d0baef522;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hbdd74ed81d2a9a51;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8c719f8558e7e3bc;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h7d9556bfa221d3f5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc56ff1abe36e79dd;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h351669b06aa8af51;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h612f3b9523bad194;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7bfedf7c7ea5029f;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h5d219cc9129d5cb6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hedc8420e32345260;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000007;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h8b9e15b270ac311f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h54799361503c3e13);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h5fc01e6ee9ce6b8d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000bbe8ba8f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h873bfbe485b222b6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he45bdd3d2446c76e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'heb88f9b4150146f3);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000b097107c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000087);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he2512d7880e223f2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9a88394142a95c63);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h742e8721328bc521);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h1f17298abbb53ad0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hff51ebd2d2901ef1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7981ebd197633e37);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9d35ba339b1d0e5d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1c776fcb45297f92);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h24a08a1d78ea7f48);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he7231d157b91c724);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h67538132b54ad376);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0a25558edca9d174);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hff51ebd2d2901ef1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7981ebd197633e37);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9d35ba339b1d0e5d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1c776fcb45297f92);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h77b8a6d3908aab58;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hbff2c1dc3c1c5b2d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h551b5703d34ce356;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2bbc4d1b5d7a1cba;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb60cb61a6765b573;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h67b1909a294a88ec;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h5c7aa11f00e266ae;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h855a6879e0e4c5e3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h3d58c024aaee69c7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h849ece2f2ede0773;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hfc8fb287e09b6c76;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'ha50c29f816a01206;
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
        keygen_cycles_86 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h479d8e730ff04e1a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h5ee7691f884fa57b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hb32d24db8bb046f0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000064f48c25);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7ae45c5041103b5b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h84e1d4f58fdbb0f3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h24d95fbdac3e4898);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000ed805d9d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000041f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h69fd4e9fc59fe374);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h7f5e6694638b0f32);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h08afb320f74b163c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h780d52ee985c09a9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hca95250591898212);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h27d717e0a9c8be25);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfabdf6b474044aee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6587c100b521f925);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5582887483b42e17);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbb141c68fe8590a0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4ef2a255c50f8de5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7742e199a1f2aaa8);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hca95250591898212);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h27d717e0a9c8be25);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfabdf6b474044aee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6587c100b521f925);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h93c7501b4552d0d1;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3f02d09ad21f6999;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h78c1d546fef686d7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1c63b25a0829aecf;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7356b013b550b80c;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc2a29d03839ef4d0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hfb58ef9328742b22;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb5468203591f4e0b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1e3609a07ac99f58;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'haedfecf16764d750;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha668221da109ed36;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc91550ad085f4b8a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a1;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he25d8ac86be93a95);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb4ce2f4fa7787cad);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h67dee01045c7921d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000003d880241);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd797b6cdcc106b61);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h623dd3cdc520e7de);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h12ce2a0742258d3d);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000323caa1c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000533);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hd8916cf843ced876);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hca6a4f0f6020cdac);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h829ee435e92212c4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h4f1e26f5f89479c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h171dc2f9854ffffe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h32f085a951ac00d0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfcc0d181de71d19b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he69d461ba611adb5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h89644e3f5c9ce353);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf810e02c63a51e97);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2e7ea10cc1830161);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hdd658bf30f68587d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h171dc2f9854ffffe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h32f085a951ac00d0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hfcc0d181de71d19b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he69d461ba611adb5);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hece1a800668ce249;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hecd76bf2dadb7a76;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3b3ca2e5acd16c00;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h704c48acc56d2274;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he7d528f9d3f36bd5;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h1cdb1028e4dd0418;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb600337f8921275e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6522bc763c32d5a7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'ha5f2ddf2e47f1be5;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h80a0d6dccc12be1e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hfcc5896eb0f8cc29;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h686f2740da35e738;
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
        keygen_cycles_88 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3566d95e2f9744ec);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8acb69ef64886a7a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hf9c36d1be8b8f079);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000001ee92a1c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h14f6aa4fd682ddcd);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5333fb00356709be);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hfadd7581ea12dd77);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000000861996e);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000014c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h084ee11537dd7eb8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h86c75bedb9d861d3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1daa9e6a847b4d90);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h784ada2c13fc3ee8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfcabb00ebaffbf7d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h565c38c929a6bdde);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5c0ac58477e180b3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc9bda6c7f1c0eb2e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcf6672b05c8fad73);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hebe99c4691ac7a47);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h283142df57aad7b3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h45d767bba83a9be0);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfcabb00ebaffbf7d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h565c38c929a6bdde);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5c0ac58477e180b3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc9bda6c7f1c0eb2e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0cf43cc47cc6f352;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8ec463909d280ff1;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfc65040b7bb3d9e6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h31f8fe247809908e;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he67d44938be9f3f3;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2cb3568078c93c2b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1ae7d0cff61346dd;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3c53870251fea653;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd70206c916394bc4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6d42e1c360ac4dfa;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he57c197e4a815cc3;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'ha209976d83c4e2bc;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e9;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h09cfeb02ed4c9ef1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h15457e88df9dbbed);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0c754dee06aa0831);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000c2995aaa);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h180e3018effe0b48);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h54ecdffa8ca81e68);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h389f4a6f31bf41c4);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000040c8aa5c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000002a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hd7538477b535efa7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he74042c1442b4ed2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hce98a8a7fe85f328);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h4bd198249712c1e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4e753a6dbe850b8f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7b84e2a42751867f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h396064389beba22d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha2614eb59b9be60e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2d809113e0f3e3d9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd2a2e335e63571b0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9db5c4073a3a57e2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf38e361f9ed8bab6);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4e753a6dbe850b8f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7b84e2a42751867f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h396064389beba22d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha2614eb59b9be60e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he0a0eff98a1e2cbc;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8aa870fab131e297;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hcc818ebb1f81eea9;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb6e19812ae03e807;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7b73d646f560743e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd8157affa9d796f8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha96d589c3a6fb906;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd4e3f2e0d0839274;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hde183a7755ea14b8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hab717ef82cf4c371;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hcf9ea3259bd7e44b;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'haa00e1225a1fac7a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000073;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h27c16c207d32da9c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h33a54c5e14c425ee);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'he7bd5412a2832d86);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000fbe11892);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf307e71a88b44574);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hfdcb6c2eb812daa3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h03d14c521901aa8a);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000003b539d18);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000009a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hed86fcffc8cb8837);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h86b6b3cbcc69ca4b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he737ab1c75115469);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf231419dfdb71f8c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2df5e893f5c44560);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc08364be19963dc4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha523d4edfd22e4ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1db339ecdbd0555b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h447bcfca8426d2cc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h03357bf823db6e6f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4af072ef72e2166f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc95b966ecc9c872d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2df5e893f5c44560);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc08364be19963dc4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha523d4edfd22e4ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1db339ecdbd0555b);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdd232e050fd48dbf;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7513a8f2c36387db;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hdef287f4f47ceef0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf432d586852b52d0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h303f8782ad7dcc52;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h16ccd0270899d956;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8746ffe27246c15f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8ea05dcafff7bda4;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h06f5d3bae63fee0d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hed35548e0bb20852;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h50ba25b116f613af;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he016cfd60ba63308;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d5;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h35ced75e4cd3eb18);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h98818fead81d4528);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hfa0c5bc3b733f15c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000006c0387aa);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'heeeacf3f9d1bca90);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h116f3c75125d5af6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hcdbe63ab3aa9fdc4);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000d5c5c22b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000178);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6fbfd59f1d5d5546);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha909efff9eb44411);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8f0e704f868a1149);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h043515bf6af23fcc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'haede4de026dcf8cb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1818fe00389db090);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h64ae140da7d7e671);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f21194e87d0b97a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h30297b4d6c08864a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he42b8d403ead297b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9cdeea0097dc3e98);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha65d81b809357016);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'haede4de026dcf8cb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1818fe00389db090);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h64ae140da7d7e671);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f21194e87d0b97a);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hecdd45653615c664;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4935af71c02e82ff;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha824fad6e87cf3aa;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3437e9052ccf835b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h108c81bfa9b2e81a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h7ec694f5bd1f4e3a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he28870c149cfa484;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hc512a040895d2f1f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'ha6036385af54f911;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd55574f6b8c5ff46;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha9a1016eef1513a4;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h27c9848ccfbc1218;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000069;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd13e1f35408d5b61);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h663384110b2610ee);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'hafca61fe28b6a7f6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000d2969c11);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd79d672b0ccdc862);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc85e114efb5d2997);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hcec6c09a7e6f1319);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000009409f07e);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000c0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hfe2cd98ad2cd043e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2d1ad67d5fb24360);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd82371b05805620a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7e50a9a27be36c46);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbd90eb9ee7354ca4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h676a16627a881fb5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h00399ac2ff63f74d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he395796400c9e845);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9c5f49a2cdb4fa9a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hef0b95b77423e4b5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hde5a91ed46449db7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5528d1da870a1fdb);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hbd90eb9ee7354ca4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h676a16627a881fb5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h00399ac2ff63f74d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he395796400c9e845);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h54961810f03b32c2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hc0d6b1d3ba836045;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4cc125c5e0ff958a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h684035bea7bb9578;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h53434190f70944a2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hbf3e19a9f42f1962;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'had143a5f32e2ef7c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h91e180229f6e870d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8e135c081eadc08b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h776188a2b1c5d4e8;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h924ae4ecfc0189b3;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb79411d6c5b09dd0;
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
        keygen_cycles_93 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4f0b133a6ff44d08);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf2704b13a1f881a9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0521cce2f4734709);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000affac419);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf4719c90fc607c47);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8808cdc105c013ac);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'he628809fec379da0);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000009af5ef2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000a1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6171bcad502ecc99);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h63b5de5581deb098);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9bc104d4fb9d2f8c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6b3a73822b333847);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0cd90d6156868fec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9f8d6e43f08f1df7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc6d731d3f92779b4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf9bbbcebea357775);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8bbaab90271d2bf5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4675d9ceb9a6b2a2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb81f6768e713ee59);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2f6f429a3d744dfe);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0cd90d6156868fec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9f8d6e43f08f1df7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc6d731d3f92779b4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf9bbbcebea357775);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0dcaecfee9e3be7d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha66216280e318a0a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h85c1893a22c610cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha628a4ae504329c7;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb5a3c020904d7bd1;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h17cda9b3bb76b665;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1134cbc59b9e216d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd5346b7002fe2f93;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hbfe2978c73c38ef5;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h851bd200b6d52410;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hec94cab1caed6761;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf7f0872ce21d9993;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000001;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hde3256a320910ac6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h09b8c271dad748a6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha63c8b664ecf1553);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000acc4c8e5);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf25a4739dd7de35e);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha8e761505892bd19);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'ha561d078f88642b5);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000003499aa9);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000019d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6079dd13f4fee06d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2ccca5b2e4cfc5d5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hafcb74d4b556a6c2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6bdf89c8b60867af);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h906382792ca4a1a4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9a134fd8c128a1c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6f6c58e139d4e596);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb73fb934157dac30);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc50dc0d0a4bc6fec);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha5e2c185c479e6a3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h723dd543264b79ff);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h666770cb9b66918d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h906382792ca4a1a4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9a134fd8c128a1c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6f6c58e139d4e596);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb73fb934157dac30);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he6e0cbeef4cf8330;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9a25308c149d1fbe;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h042caeed6bd74de0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h5d06d9dbb38be7b3;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h365e0b2a1fcdb59d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2d07bf6b4a746c3b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8a380314ae00f33d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'heb7b6907669c9a90;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h11d049b2f3b26af9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1562c4775a270f85;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he683dc51d0616b73;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1b24df81a65e424f;
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
        keygen_cycles_95 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hbb2cb92d624986eb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h14dcc66e575595c7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha071e3f854f15742);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000bd866ce0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3c58fa738daed7b9);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h04c5296818bc4ea0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hbe6a393202f6b8b8);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000f0b87435);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000dd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9b3c9dc74d2b0d4c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha836141bc6467389);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h619368a3497396e7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5e825edceb2aae4a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0977ff368eb8acbf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0af6397bee4dfba7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6751f496566e08c5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9eeb5740c6d173f6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h6de64d3b67c71e0e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6de48ea843148131);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4a6e590bfcfd2b42);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb9c8c2f225728912);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0977ff368eb8acbf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0af6397bee4dfba7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6751f496566e08c5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9eeb5740c6d173f6);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h32f0709b544b678d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h39a8384820112ed9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7183aa5b6c313fe3;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha512b2cd20d8a416;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h0d10b3d3bf9599fb;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4d032a7ca7d31860;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he35d2fb681ca1ef7;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4ec1d62484ec15f5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hc7ef2d0a6034ff95;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h01a41deec0041ad8;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7e4124ade9c9cee5;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hce28174174d6f7c4;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000002d;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha21ee2021b476218);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h55dc181bdf969385);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h3cc63cc066db3999);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h000000004a10e11c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2ea56c2f13f5c189);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h142d1a0e737ed7a6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h38dfcf7865252566);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000e7613e93);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000012a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hee1711620a34e120);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6359f2e71eb397ac);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h88fe14e100739ae2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h95770cb24e73e66e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h629d70d4be3f5029);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1bd5405942366299);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h95b704edd114dbf9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h627b9317771c9b7d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h62581a2a19f341ea);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf05423d1cf401543);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3cec93c27446fd3e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7a5143d2df2e6f88);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h629d70d4be3f5029);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1bd5405942366299);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h95b704edd114dbf9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h627b9317771c9b7d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1f7f54b91a106bfa;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h99ba5fbeda8a0393;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc5a658c796c2f87c;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2c5e67189294cfee;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h629c8895d19ea281;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h77bb4748322c5cf5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd91865f1e98d9ec1;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hc499327e93ba4472;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h59919f90dda3626b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2fa82bf7e5154606;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0de5c15541a41dc9;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h42fb5461d9fb7427;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000b;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h225d993b09d8816e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h0da41af9b2182edc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h9d4ad4e1a9d2a65a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000cf576584);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf621730a34c7d157);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8f9e49142ba5eee9);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hb9c3e4b8f956a570);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h0000000014168e61);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000113);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6910c4a6e9614d99);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf9f352ca62a50876);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf9cadd270f3381ed);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h59046031da435ff2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hdabf673017fa5427);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf4715ecd6c746ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h98c0cd19a53d1495);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h42dd03e1d39d490a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hbfdef4bb0bb14bc6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h80808564b9af7c93);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hedb34f48e0aea27e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4aee8cce46802f06);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hdabf673017fa5427);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf4715ecd6c746ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h98c0cd19a53d1495);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h42dd03e1d39d490a);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hd8e018097030ab97;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h61f336cad1bc45dd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd7e3f9f0bf974e15;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc845c4cdbaff288c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb00dc99cdeeaee10;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h684a4ee1d5d5d256;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9ac16130b29baa17;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd1f05a749ef6a12f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9ce1f1db4da1ffcf;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2cc45bf18a5dcb7c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2a8eff3152be74f6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd05e87c6af360d33;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e8;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hccb116c419ac90a0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h171d0178202057df);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'ha684f7524a3021d8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h0000000004fae982);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd8b3f39b470baef2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h33d97219b727df1f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'hb2464a624f153160);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h00000000dd2d9751);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000003ae);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hebe4f039261e606b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6c70bca03b96fcad);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he97c3d32a3cf9559);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc4897ce0cda891f6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc71a2c984f7b118d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha0c3feb07c1254cc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8f12d8b482f2a9c0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h628d7b62cede84ec);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7f61a703787bc1c4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5b9107e7545469bd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0b855e1ce0ba93a2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1066a9eda826f2f2);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc71a2c984f7b118d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha0c3feb07c1254cc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8f12d8b482f2a9c0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h628d7b62cede84ec);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h93dc839025e4990a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h394bf84269ddbf3a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd4e5212c8ced464c;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc8643983b3c444c6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h0b8d78345cd0ebc5;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hdc1136d125c9867b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h146e85adad9415e6;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd7a2a8687b97d9c2;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hcd041874ed9d3c8c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h04523e4cb41b154e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h34b01b4d254af986;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1649bd07e8626520;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000005e;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hcc41790f3fe84eb5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h43383d5a6d1af378);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h6c35dd77679734ed);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+3] != 64'h00000000160911d8);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7e7485b6fbf70280);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h91d42ab34d100f95);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h83e1f1f1167471b5);
        err |= (dut.main_mem.mem[`Y_ADDR+3] != 64'h000000005e5fcebf);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000060c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hddd80abd64db55f9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h124f2d9c5d4dd5ea);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9b346fea5d3e7d9e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hac0b5b5a648e9c8d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf7d44f0199e76a67);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h707f6629d85804af);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5fac349eb131e01e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h723f4074da0c58ef);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h877ec5b654deaefe);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h31a4e911736344d0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h53c29259f06b2977);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7b174e3673a0e7db);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf7d44f0199e76a67);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h707f6629d85804af);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5fac349eb131e01e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h723f4074da0c58ef);
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
