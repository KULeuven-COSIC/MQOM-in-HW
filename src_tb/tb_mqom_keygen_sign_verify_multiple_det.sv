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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000baa0eaa4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h954a60314040c3fa);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h275bd75bcca65531);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000e9b374e0);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h178d0a1eb7d5e95a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h8421522ab3e8332f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2c39df262a6728e4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc7d5d8f8548aa3d1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcf59154954788168);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hed0a896917009ede);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5329fb4217afda28);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6267f622014058b4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he82b6269ce20c5c9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf4aa56e655f5e331);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h208fb3aa66daf177);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hbed8705326e07cdc);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcf59154954788168);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hed0a896917009ede);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5329fb4217afda28);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6267f622014058b4);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8800e3d3871afb1d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4a320d3a37da099a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h922233e4c88113c0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9fae7a006cadcf11;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfd94d87139b043cb;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc90f5d4c226d0248;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h783ee5d1ba7e349e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd65828b353323422;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd5030594047b9a90;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9eb07afd3aff1f94;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h352eeb8807a3535f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd91e77cbd82b8e60;
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
        keygen_cycles_1 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h42331c4b6b5de061);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h4086c7f285839e09);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000797055ba);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h87cfef2c934d4f4a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1a0668216e51be81);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000cdf6949a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000385);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h325a86cb509b6631);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1f25094be280275a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hdd3cfe5cb0e63d91);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hefa7b0dc7b2c9165);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4fa4c8f5d9de668e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha5b24bc0fd3d6d80);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbaf268e64db822b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd795ddd0a7fda8b9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcf59355508f2c7c7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h29cff433ad8c217e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbced7c57c159c566);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc47191f49147c6db);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h4fa4c8f5d9de668e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha5b24bc0fd3d6d80);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbaf268e64db822b6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd795ddd0a7fda8b9);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb5a0357983dbde79;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h012bb9f3c4586377;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h30c19e6577d371d5;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h75913be76f209fdc;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha45a7ed912fc8d61;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h41325d0491345842;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h7f6e11b368f8af2a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3a07e74b5494d3f6;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h5db64f44c424fb82;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8c93bd0c3c5839ef;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h06c3bbaf4db85310;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf8e642db13891dab;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000055;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf3f659b77ae25808);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9a59b9203430d363);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000444816ca);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5c6c87aee4686b90);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he33d790fb17df27f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000000b4e825f);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000060);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc74a34b093d7984f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h680b601b167b973a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h075abf678728c325);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h931ad1b28c6a0b2a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he92db0e5b1bdda6b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5a1a5eff2725e61e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0ff3fa7f00dd559f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7423b1287ceef2f8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb8129dbdf5e5bdd5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5f736eafe8c2bc4d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h46ec653ef7950df5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h849a201c3727bfa8);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he92db0e5b1bdda6b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5a1a5eff2725e61e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0ff3fa7f00dd559f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7423b1287ceef2f8);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1e369e27cd01e87e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3327e042d8b9d2cb;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h60a1e126349aed43;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd2dc023fc438e875;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha7f44bd78f7884f4;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8269db696308fce5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'had32ff68ca344ece;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h19c2816651197e76;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h05268ff7b48a2c88;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h48b1bae062cbbf79;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h81fe3bda71e1f5ba;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1962e487b5b9db23;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000090;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4f6a4d16d113cda7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h57080c993f89440b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000046546fb1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf1b956a64b280e10);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9eb2247ba5cb9ac1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000655e8623);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000004da);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h826a7247cd0c464f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h727979bbd2657fd6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he02bc3b744fd09fc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5e6c1845bd4d7a5e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0ff974b155b48a98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd7b7e5e6816a98f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h207947bb8b31570e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hba338130aba4f149);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h43c5c02874af35bd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf60dda4deaf1e4d6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0e6966c77a868de2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'he3a44adc9c7c748f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0ff974b155b48a98);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd7b7e5e6816a98f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h207947bb8b31570e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hba338130aba4f149);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc29c3e44dc011292;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h640aee57a1d35a73;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8e22226aae28bb45;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0e38a0e8399fac28;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h3f00021c74005208;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h05a2b58717656253;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h00d0b31f983d33ae;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'haf84135b3978bbe3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd8a78d736a652111;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb1aed5e1fe6e873a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb18cea1b284aef4d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc239df1b479a6807;
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
        keygen_cycles_4 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h52506c8d70be68dd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc19bad9282f02653);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000eca10f53);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h622381c51ee676f4);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha212cf84151eea9a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000009b841e87);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000006d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf2319028536a2d7f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hfdf1bc23983d8659);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0ee8f5851767de37);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h60cb198d9b9f4548);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h34556364de4bb1f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h55a78e384f5e4f88);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9ca1dbf3f851b7e9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc583f6a5cce85d46);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hde06574de61dd445);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h68f4dabf3b707ccf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hec9cdf7f679bc73f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7f897ceb84d4b40b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h34556364de4bb1f9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h55a78e384f5e4f88);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9ca1dbf3f851b7e9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc583f6a5cce85d46);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb420efd30a76e94f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'had6918f7ff0980f7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7f57a8386aac0137;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8064ee6cdc8abda9;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he2b24f808a4df433;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9bd55afa4f808641;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1c60621f5f50f2f6;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h48b2aa96fee14a00;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hdf79fbc89ac9d955;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf630b4ff2d15f69c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h66a0f9f7c2890049;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd16f3efd7a8bd9c5;
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
        keygen_cycles_5 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h05227fd7424b3cde);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he2d1ed78be85bac8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000e02bca1d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h451c5bc8b162ff45);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc9d68e1dbc45358a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000008c000df9);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000099);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0748a815ef5e55ef);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf14bee6f62299aba);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd50ee595fbc6e74d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hfe4596cdb3e55a44);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha624c06e875e5f82);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h62132fbaa9a37ef2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc700a62d08e53378);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfb68e81400c55333);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf5c7b8d577e5e067);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hec611b84acb065be);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h59e30438252ec378);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1b2d37a75341fe3b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha624c06e875e5f82);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h62132fbaa9a37ef2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc700a62d08e53378);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfb68e81400c55333);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6f4d5280d24d9a01;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hbec9fe8eed206458;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h63e2b61f0da2cb2a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4eeca6c1bf08ce83;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf176d0055e07c5bc;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h0a4a8e51fed52e35;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h72eb868f1110060c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hbffdc89af7a8348b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h280b2a4c4cb7e0cf;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3cd38ae59fb9a856;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4642276900b9d780;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h48e62d95193ac387;
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
        keygen_cycles_6 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h99e1313335a0926d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h7cf45bbea2922d3a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000062dafc2e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9f48242e9dd4ccad);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hbd9f8aaaa95c3269);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000003e3e1a6e);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000ee);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h094f598e7e806af3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3ffc83403fa9bb13);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd15605564db860c1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h414e15979051705e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h276ea911de526085);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4b75e85d947731fb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2db820886ecb9ecd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5e52e6a53b342672);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb161e21f69ad74d5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfdf23ab131e378f0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h003ab9685d79df73);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4a3f2cdfb5298f19);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h276ea911de526085);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4b75e85d947731fb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2db820886ecb9ecd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5e52e6a53b342672);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc25755ed5acb95ea;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4e895ab2665c4954;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd89d6efdd5e8552d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd85e301d79f572b1;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf1ab34bf1a75e24d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3d3c5c4e1cd73fc8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1c504542d3f235ef;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hdc4925e0b24c9447;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hcd7d3e24d686468c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hba6b2830be6c44be;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hba82e70a22c34adc;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he4203b34416355b4;
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
        keygen_cycles_7 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc5261503c26e1d8b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h710fa5fd2fb12a8d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000724976e1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h172a31fbb150b3a8);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0f98c17705ef7528);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000762e2582);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000082);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9858aabf6ccf2dd4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h166b75f5eaba03fa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h5503fc66d018c24b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h86e050dd463f76e6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h20dd7ae9ac7f72b7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf71809e6f6546b35);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf1b9f13a2b8b63d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4dff20f591ac880f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h226164a17a045849);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbf2b1ed353ea9632);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3f2741fddef4d465);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc522cdc01abfa32c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h20dd7ae9ac7f72b7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf71809e6f6546b35);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf1b9f13a2b8b63d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4dff20f591ac880f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h47f6027a068e9b9e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3d7625ecce1ae54a;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h031c001c35ca70a7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4be3c194285c38b4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8fa637a0e4201daf;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3509feea8f6c1b53;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h94db71fe9f3d3bbe;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h613160290311154c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h21e751fbb9c07dcb;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h9940788d7ca6575f;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0d298d92bf582875;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0ca12cd7c21a200e;
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
        keygen_cycles_8 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h942c660af197e4b9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc2a740fdcb217116);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f01606df);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc1a7e0236328e2cf);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h72c7d9e88f53586d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000b336063b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000bd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3b1fdbce69bea4e9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hcadb0ab5a46449fe);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9a5cd283bf9ce8c1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3cb5c8a61486d988);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7b00dc608f4a98c9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h468fc7626d9aaf58);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbbdcc297ac5f0c95);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb03952e74bd3d8d4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7f5ccf3ec9e57113);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0b9dda6426ce0ee8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h6e5bed7ab9f9a760);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0879b4da03e42525);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7b00dc608f4a98c9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h468fc7626d9aaf58);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbbdcc297ac5f0c95);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb03952e74bd3d8d4);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h7470b403784bca7a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd236d81f47a248b7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he40b2df48a98ce0a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb4fb6c2fe7349be8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h696e003772a49a68;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha96b421c951f22f2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he86394b62d843580;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd7b3ba3479df176c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he87ecdbae92d0559;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h68bf45e5a73580f8;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h209dfe7efb42f0b4;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h913eaa691b58e526;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000009a;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h58e0a6d4107ad5f9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hdc59303b64fef32e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000064e107f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9b75b58101fbe545);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h563f55e0f7ce2841);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000855ca66f);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000024b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1e6b8be2dcfe5f65);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h91c69d34d883e10c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf7562360b3d5da7c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h36f2a210c85f692e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha77dbd2a898673ec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h38adbc26c7b7e695);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha701b9f676eea7f6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e18a9b16fec9f18);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2f580020bfad1cfa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0c2e78cb0f130198);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbfb9cc0a4b52fbed);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h180e655a8322ca6d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha77dbd2a898673ec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h38adbc26c7b7e695);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha701b9f676eea7f6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9e18a9b16fec9f18);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2f8a7d9f40c53d27;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h641a99fa40f266f7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5427231922f06da0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1f7be25faafa03cb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5a2dd746b69dc7cf;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2555a090f6edb4cc;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf898476e7baebbdf;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5ff5b64add1b0ab0;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hcc3e3c9610cfd7c4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc96f03d922c56807;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h9c8fd7c9005d6a80;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7d9278704c538cde;
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
        keygen_cycles_10 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h903fc9445a73719b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h71c3e985d2d24879);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000047170fef);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h54c8438cb33e359b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5b46c19c99448b68);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000fcd86207);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000007f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hc3738e9a8ee99000);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h90ee2669f334320b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1aa8d258e81beace);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'heb1c7e8aac4ae59a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1e0d082c7211c555);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb73d88402bf315fc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha65b0b01d6aa2e9b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1e8c177c80483104);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd000b9b95622d20d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4ac90960f3281f7a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hab9b7c8c113a2593);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hdb612b9217425707);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1e0d082c7211c555);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb73d88402bf315fc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha65b0b01d6aa2e9b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1e8c177c80483104);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4cb86ff7a3da9832;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb49980a06ddee5f0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf8271adbe4c2f64a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h27784f034bbe7fdc;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h93c58220cb75729d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3757e6e05eb2ea21;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h334c076fbe5602ec;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h529e3ca52300ff8f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4b52978be3043164;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h875d06e361c04306;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8a603f26fcb84064;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4d654c9fbab754b3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000039;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc04d05ed0c8a912d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he9f61d32b2ae16cd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000a7772818);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5c92fd67c865065a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h2b9e0f8d6e43560c);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000005651e136);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000027c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3b15e10adae8acf7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hde01292bc0956a2a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd63ccf8b6b928180);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3cc3e79e6ffb633e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6ae29873428e0c3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb3d1c9dca8b25d4f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6e7a14a5aed5e1e1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h527d66865a70d4a6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd8d613e3cb55bbbc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf4e9ef872673c58a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd98f61f0cdf3fdd9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6ab31d38a56f2833);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6ae29873428e0c3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb3d1c9dca8b25d4f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6e7a14a5aed5e1e1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h527d66865a70d4a6);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hd3200d5459d96f0f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he73648fd973e937d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'haa81ee210851af78;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9985bfbd0f3878bd;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hade47a8892ac44dd;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3c1354fbc2ac23d8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2452c86a58a38bbf;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h9c7b52c4fb012500;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h35e367b2e4d6f2f2;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h70a535582f634cec;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8862083da7809efa;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h9e65477165003a83;
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
        keygen_cycles_12 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h74b5880c54ffd52b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he467e4e77784b5bb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f40ed38f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2e2c1c5ed795cd1f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hfd78803abfa75b1d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000f77e140c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000003e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h925746903fecfc12);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h07011ea91861a0bb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hb607e1bdd94ab02a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h019cecab35753f8c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h70cd101b1a57321a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1c6bf1264f5c1786);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h370a70d64087f169);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h497eb6ca263c58df);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8b7cd8cafd75a146);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0ad5e1b4db382ddb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hab8987f1f575e8ca);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h01f9a206546148c1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h70cd101b1a57321a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h1c6bf1264f5c1786);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h370a70d64087f169);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h497eb6ca263c58df);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9b549588a6a2c332;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf29461d3693fd6cc;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h48219f2e49032aa0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h27078019c4514256;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfd380a86c16845dc;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hebaefad4b1e851cb;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8a7f9893df7fe147;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h921e14484c6f2f27;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h951818d2f8ef8ee4;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'haf6b0a78ff075f81;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h564548fe9cb8e832;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h758295a3963680cc;
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
        keygen_cycles_13 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he4cf0074bdf0cfcf);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he96ba854b192d7fc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000009a9e5fc1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf4accb44ab237625);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hfb338efc2cdd5c23);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000ab2e552c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000004ab);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7f6da4927e374fec);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd62f6c0491d55e1a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2d1995288e8ccaaa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h4401af39e37223bd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb6489552b8532571);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h09641c2259c787ee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd9c76d92b1eaa0eb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h039529dabd813a7b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h874b7201f062a531);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfbbc412f7b5f9d87);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb42aa402c387bb5a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h89ef77313569c1e9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb6489552b8532571);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h09641c2259c787ee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd9c76d92b1eaa0eb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h039529dabd813a7b);
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
        start_time = $time;
        start_comm = `START_KEYGEN;
        @(negedge clk);
        start_comm = 2'b0;
        wait(done);
        end_time = $time;
        keygen_cycles_14 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h30e9e030af4822c3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h15f7f9c9816408fb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000fed37457);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h820452c97c29ca82);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5e06eb421cec13b6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000f660affd);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000156);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h96a2eb1c01f02ab7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0e39f1a747b961df);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h12981d8403993695);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd0c0ecd812794114);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf9ccd16260619195);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5887053b5b2528df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha46cbd3058cfda9d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h762fff6052a0e627);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc69c55b0edf87765);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h558609d8820a52a9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h458a94267dd648f7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5288a346fdd85da0);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf9ccd16260619195);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5887053b5b2528df);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha46cbd3058cfda9d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h762fff6052a0e627);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8a4b68d1422d6fa2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h153d1b203c03faf2;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h42d6c6dbb489dbf6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h97aca2d20f202379;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5bfe9329ccf2f09a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9107b59c63f88ad6;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0d341ea9626e30fe;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4db30ad866e98385;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hcd8d78e7734e8f52;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hcd7a47191a933626;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h74b2a093acebd4a8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h03c64f4472f0f455;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000056;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5ac8ac33260200e6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb886afe28286b933);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000bf5f09b8);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb85960acfeae3245);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h37b8ddfcc1fa6d3f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000c40e1544);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000169);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdb076a41ec4cb237);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdcd8adb1b9f16128);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8f27935af91a63ec);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0ce3a6818c223f67);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h34f0b7d4bc8626ab);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha014c09b18535f8e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h86247676c0ee7a55);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd9ab86e74ceda89d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9a0ba7bddc3483a7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc5a797a433c6283f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h95e8ce083f77c13f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb14612bd1a8f0de5);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h34f0b7d4bc8626ab);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha014c09b18535f8e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h86247676c0ee7a55);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd9ab86e74ceda89d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4d5e73ec485bf546;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1d94e1d9393666e2;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9c65707e30550559;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4e2993335388326a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8efb1b9f798228d0;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h15fd413b6714529c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6dfc9710feb5eb6a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h83d5d170e7671b80;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb6b4f3158eed7655;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h103a20af5bdee33d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7866e81941c3b265;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h232d5fc9526b67bd;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000bf;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc3ada98c7e5bf69d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h977b86fe3f21be87);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000b8d28aa3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd7ca358bd5cadb9b);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5a8c335c04ad4cbe);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000c969f3a8);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000049b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'had3035bd2bc038d2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hac821ba238de7168);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h817a732c14b5e28f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5c77cfa7c6aff3ff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5161ead6ae3524b2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfd15e2029ad7997f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h861721b3fbe9bfc6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbefd3727859dd79d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf2ebdc0f963539be);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h16f565d9503f0cbc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h6215001c13d4d001);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8a4cbca42a38a15f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5161ead6ae3524b2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfd15e2029ad7997f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h861721b3fbe9bfc6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbefd3727859dd79d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h50a22d1385360ffb;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hdbfd454a61e80343;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3f3adf42a4c17a15;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h173a87769ac75359;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf6a9e9af11e15320;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc33ec971b7176776;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hadbef997437abee7;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he889ace1fcc1fcb3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4ae5f4738ee5e164;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb0e6255669599f9c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he32622a95e913b96;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc31e4835bcf70e4c;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000042;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha6cca56c23e1f7ba);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h41995e86c9438d43);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000003991f22e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb46c640586adb4b2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1ddc5a83aa0f8f0a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000e3e57a45);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001e8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb0e073d549ad28ee);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h263a2e0a46b64673);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9774e0f7d85e21a7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h4e5060a8772b0543);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h489ff953e5719b88);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h652a311845813cb3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3a1220f831f4a90a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb10583dfe9486c32);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h6e3bad456d784e1a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h614e6bde5a189d73);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hc532dafddeeac546);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hdf86bb695508c6ab);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h489ff953e5719b88);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h652a311845813cb3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3a1220f831f4a90a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb10583dfe9486c32);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h764592f99be53045;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8be7f485133fc08b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h08aca769002292a0;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hbbe34edb7ac5b0e8;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8a501564e63d8a37;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb5c55c82324d52f2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb1a1c2c897027036;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'ha02576e37be03f99;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h595b559b9d202408;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he9c25390750d7f30;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h56e843a2a05cce04;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he8cebbeebbfd66b1;
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
        keygen_cycles_18 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he46875332182c220);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2577ad01360f49db);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f676add3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h63b8682734f5e799);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha9812c7260de843f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000007d26d2e7);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000035);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h17ee73f7c541c26b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hfdcc520e26c1ee44);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hdab8a7b4f183624f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h27c34ed70066c37c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hddd8b205db2e0bf2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd2c862366c0ce6e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8e97271db69919b0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3763808c1da4d592);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h510147cd972e921b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf260683904ec3dec);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0a496c38d4200d6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0e7e2c8b8ce166cf);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hddd8b205db2e0bf2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd2c862366c0ce6e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8e97271db69919b0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3763808c1da4d592);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdb263f019a448afd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h07785d842b41bb09;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc1c4b7d5d1b13ef2;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf886aa740cba9795;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he30d13f27d38d246;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h0810bcc9f5914c74;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h574e4e4e321aa998;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h636edbfdb322a986;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1e11e2d8093bc85a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf63ac0dca3077a46;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h77bc185e8491c017;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hee401a94e76f19f8;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000061;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hf57b48bdf3765e74);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he97ce8a1f4ebb5ef);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000ced45542);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h56b50ccd04963be6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h14e5236be9f80fe1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000052b2705c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000077);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb5b1a08caba8fa79);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc292baefede52cf3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1f5d0d46ed4eb831);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h20470f822b6323c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hecbf48b1e02b25ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc03e462fc5c4ac1b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8337900d5904e08a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h10305f32de953be2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfbeaef1b1ba6054c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc1d24bdb04cf9c4a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfdf04267d2af9c9e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc8116f86fe8cba4b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hecbf48b1e02b25ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc03e462fc5c4ac1b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h8337900d5904e08a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h10305f32de953be2);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hbd1ac812fa99bb3e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2698f809fe1018d2;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8c6118cf9668d8cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hcf9b9789a269d7a3;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h40539cb28c262130;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h23140375c5458022;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6f033bd7e60316ed;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf25e405d9c477dbc;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf194586bc2708338;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf7541c14c61dbdc8;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hac1f41e835f1bc2c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hceac9b34b16c9b4c;
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
        keygen_cycles_20 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'haf6797c2df50bb2b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he0375bd4e6b7bda1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000002eaac3fe);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h284a28cbc2c97dc9);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc6f2d83106d1148e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000c26bf94d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000000e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4c378d95c505bb7a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h30681cf77f6d2d2a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h484c67960521fa90);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3b4c3992e609bdc2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hac55884411990d5d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h153c9c4e8cb3383c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2dd353a513a3f60f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc16dd82c6a36da99);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1cce928275b4a1ae);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h946f2ae9264db55c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h5cf37da30e3b37e3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha85c81cc6c263229);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hac55884411990d5d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h153c9c4e8cb3383c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2dd353a513a3f60f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc16dd82c6a36da99);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h47f2af7325db1c90;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3835c059621d6bf3;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf30f793fad82c21f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb85aed78f6cdc0af;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h043089da224dc34e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h49130c5df5113cdf;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h82042901dc736698;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h718c593371625f09;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h72f460b6ba73786c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h64451742f737d662;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h39c1f0f106b26ac2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcba859df9edc6fc4;
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
        keygen_cycles_21 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h96c2fc104e6567ac);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h739e1383a2dc0d5b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000002b337839);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6035791d7fa24288);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc290346b770e6599);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000451db050);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001bf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9d4a54117a3c955d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h7fed331234872845);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h02a8e876d46756cb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb1e4c130b920844a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcce0f1b643b9c600);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he9950794d73c796e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc166c661323908d4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4aed00fe5cd9eb40);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h82c3927cb8027b18);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h834c7ccf2c79ea04);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h5f329911eec06c7e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h0d3f1721aebfd4f9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcce0f1b643b9c600);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he9950794d73c796e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc166c661323908d4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4aed00fe5cd9eb40);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h43bc2e38fad8ac0e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h16ee85a931444fbe;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h540693145bc79f23;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2f603005b5e0353b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h9ecb7c27b46657a0;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h97813605395b44af;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h9ccbddfba153553c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6fec80ee1da43319;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'ha36c36808b9c20bc;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb2d4577935f85c71;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf5e6a303d00d49c0;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7954989382508ce0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a2;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc1f8224f1b7ab168);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf5057ca7582315e9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000004ca10d50);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he65e474842d5bf45);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h16cf716cb77e27cf);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000aaf02c3d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000dd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h98bc7136becd6e6a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc1492392b785bd2a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hb7db2ff3803064a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h915d0e9bd6493f4a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2ca70fef2f841d74);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf5a3f02848f27b8e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h901f4bd11d162a67);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h11f7b969632e8c9f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf0dc05476691c4b4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h39ecb4aecfc2bbb5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hde77cccc8f241375);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2629cfe35ebce37a);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2ca70fef2f841d74);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf5a3f02848f27b8e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h901f4bd11d162a67);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h11f7b969632e8c9f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h832e1a6bbcc951eb;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h79474d8a8ddde21e;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4d15c635dff75ed6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h0fc42757f9c44d15;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4383db418dd4868d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h1678432c4fb84cff;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h89bd5fdeb6e13d6d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hc675542456202d04;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0fee47bea40f3585;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h212768563165f894;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h578cbc6e46c3ce04;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0547451c7692215e;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d7;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc99a44fa1b14b809);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hda5666558fc6660c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000001449642f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'ha20bc1508372e231);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb84eafedba510056);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000ce86c8d9);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000000b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h501ba7b05089737d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1980cc8d26a759bf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1fd7f6082482e5d2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h8a877c7971541f83);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h18114d6f050a7dc7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf380146a8f77377d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3e3b158b5e8ed8a3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4d07edc4802930d7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7abdae7b27d64cb4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h29c27f46d00958bb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h312f577478494d06);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hdd2dea107f95b772);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h18114d6f050a7dc7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf380146a8f77377d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3e3b158b5e8ed8a3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h4d07edc4802930d7);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h04ce3c33ced0f372;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h5adbb5b577d91601;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9c658c029b06eb95;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6f5addaead623278;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc7a34435fac54600;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h91bcd22961b8dba0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6478d4ff24999937;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hc7cbc847a1d55c4d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h92accfecbeb1fb59;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h66d35064c299d3ad;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h582df9e852a664ad;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf444293b920e941b;
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
        keygen_cycles_24 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h08cdc5dc86fcd0b0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha7d22859ee991dca);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000e8433639);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd7aa5a0230f5c8e3);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hef5cc9f94ead660d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000092a06fa8);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000100);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf38437a500e513e6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h22afc592609a5b22);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha625aee51f43aee3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf45882139cd51bc9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h43ef9ab058064248);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h05aab380283b25f2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd55b452655ee8012);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5acdc24355d2504b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd3645bd69dfb1236);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hef259759ee6ad681);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h3f70f2803e73744c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h97923c1aaa5f1145);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h43ef9ab058064248);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h05aab380283b25f2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd55b452655ee8012);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5acdc24355d2504b);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hfcd0cfd2cf7af006;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd170504fb65d54d0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h31d1dd616004aba2;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9f0ff89a64cc298c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h2f66458578128557;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h918ba359d046c12c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h7fad64b1364825c5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hca7c5ce0f197ed95;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfa40f830e13451a7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h406b4a07755c51f2;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf9c45db0f126b729;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h43ee275e981045d5;
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
        keygen_cycles_25 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h362c251bd15016c6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h4ed804c3c5012fa4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000004aad015a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h301548e7ae836193);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3ff220fde6bf8f97);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000ed6735b1);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002ed);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3f3b465ab53da02c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h94ee03359400e505);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h780bb496d54589f9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h2443377b1775e169);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9ab48a5440bbd8d2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5765a4c147f33e45);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0da6288a90d64f87);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h80d6e5f5564774db);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h83c094f8b9b750d8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h8072170e65a67305);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h73ef2db8a2d72802);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h82635db657c8f2f4);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9ab48a5440bbd8d2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5765a4c147f33e45);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0da6288a90d64f87);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h80d6e5f5564774db);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h54696828a4e96a28;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hce4610210759ee34;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h6c6b51947645e453;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h18396a5da48dc4c2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h861938c9d94d8ef2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb3df8fcffceb06e2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h44bb72249db2ff28;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb6506e3906996a54;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7eaf59835f8c76c7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf27a9cac14b7f086;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hab678031320a25ad;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbb25740b2d183242;
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
        keygen_cycles_26 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h74065b116a9cb782);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h497c585d856b53bc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000001d926f00);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0b338d52c24db977);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h635aee0b80796e1f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000b14ba809);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000177);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h55f4ede874d2c178);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h38377926a5ee47ca);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h297ad8d7d4f3f748);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb855094975aa44da);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he4c69d35a935e1a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6315ca0e13da2ea1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha20bd27740875b33);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcf128e2bde20ccd0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h947caef21b7278b7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hb40ab626233239ea);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfaf98b1a001a75f0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h2c98d4aedd5969f1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he4c69d35a935e1a0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6315ca0e13da2ea1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha20bd27740875b33);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hcf128e2bde20ccd0);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4a833e4370ab99d8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hcf73e7d4dbfc7cd8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc0784c2b7feade9e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4335f48b234e43ae;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hccedfb600402984f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h266a27d9ea06fa5d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h30a8c3d0704f4300;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3975892bccc6d6ad;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9605f916aeb2b512;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8188b875f400657a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h01e140705726af9c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0171b9581e263d08;
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
        keygen_cycles_27 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h6b7b5c9c0031d435);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hdd2e1832b8e53f19);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000dafb55a0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h57dcf6537659f4d6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h721129302184d31d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000cbcd17c6);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000060);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hefc48efe426091bd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hfe0e77dfd52b751c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h06be0831b8190f7b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7b0d1f902605a952);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb86f747da2cfe13c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4ccb9e73f502c2ac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h89c77cc005cd3ace);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0c2af5b52de7ebd2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb5bb203640d25fcd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h07f080e9e920ebbf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9f11ec9a309e20ef);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8a8b2822a57a2b10);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb86f747da2cfe13c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4ccb9e73f502c2ac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h89c77cc005cd3ace);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h0c2af5b52de7ebd2);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h251d5d0eec86ca7a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7732cd9ce7d19f43;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h851dc91dfdcc09e8;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h69b0e916e50b6498;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h202ebb04aee06938;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'he93432cf32351eb1;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h488678d1a55f0291;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h9a89bdfae652258b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h3dc76c5175628eba;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6f3f9b10be96c8cb;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h97323fe04822907e;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3cdc932cb2961fe6;
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
        keygen_cycles_28 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h7c1153f12aaf450c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h6c57b2d551d8d93b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000005d74c1b6);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hfaa1b222ba5eb845);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h2a81c305c740f166);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000009540b0e8);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000044);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2c7fe21b6b206ff0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h09e2aecf316db499);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h733f9f5877ce8295);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb04e3c6b90a920e4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha6dd294c3353fca3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3df7d4d8025c1036);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd377fcffa4f54907);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd9a733fca6c2a392);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4d787ab4c1f3b307);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hed3b569ee2a199f0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'haf14f376822d3af9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h98abaa50a13c14e2);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha6dd294c3353fca3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3df7d4d8025c1036);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hd377fcffa4f54907);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd9a733fca6c2a392);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h0a3aea3483bc8e59;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h02841e32e6351290;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hf17826e40aa1bd07;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hce8a54520696b65f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb499d2b07a456436;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hfa8b2dca9f14711f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hafa8976a5b520850;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf0e8f4c0c296cac7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hbfe5d5257a742e6f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb10853759742d4cf;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6a076ec4ac7e2823;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hdf23a092a22001d6;
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
        keygen_cycles_29 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he1a527c58596c370);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h90857fcb24b83445);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000000ea999c6);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9a5977e0cbe97e99);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h30516f6168379647);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000025d6a8b2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001f4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdfbafbe5b3ec763c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hadf3d555fe1e1917);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h10875026255e09f6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hdedb5011b569e107);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h76e3c63808d45a24);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd3077500e01e2ce4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h80a49be0602648c9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha3107b89d25262de);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1df2da9591ddfbeb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h76d368dca72ed505);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h34d913b9cde3d933);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h66b2c3201ef63bce);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h76e3c63808d45a24);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd3077500e01e2ce4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h80a49be0602648c9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha3107b89d25262de);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h40c019e059fb2d91;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h67bf202827dd23c8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h05e79b2a40fd444e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9530ded7e71f4008;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hdb562d0278d85c17;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hbed4eccbc8aca657;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha21e4c536e31b22c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3667f7cedef0cef7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf1ea2e4950d760fb;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha64dc8588d75468a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha37033ed1b126f5b;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hea1199c23881ac76;
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
        keygen_cycles_30 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hfc9a3dbc61a32094);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hdbebf903a834748f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000006fa2a3d1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hdd62e946323e84e9);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h7ab41cd31f08e3af);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000ae038078);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000547);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4a7ce202bbcc5d86);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h094d0b4200553254);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hc331fd4d116b69ec);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hafdc31ce637e8b48);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h601e70f151a2ad4d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7e4ad489384053e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h637afa9d30a81fdf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8109849c24a59626);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hcf41799f0a2aff4d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h097db71b7536fd44);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd1e5493c989d2921);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1684c848e01a33fa);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h601e70f151a2ad4d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7e4ad489384053e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h637afa9d30a81fdf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8109849c24a59626);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h885222f82b226134;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf6db7dd544f1ddcd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4d44da2952e2c7b5;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4a0b1f388bcc0dc9;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h915d4c4073ba0fed;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h025e2a47e7b3c11f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hea42477c78acd0ea;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h532ba383857d8f22;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2e196b43e87816c3;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb48c9ec1b67a5221;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h513ad043f3298675;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0bbabd61e1d4fbe3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a2;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h6d4bfac6dc6d476f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h0d735680a412b0d5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000042587e16);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h228677d3bd45c087);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8ce5b8afe6bb9fdb);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000f81267e0);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000010b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h70d5684c373e98a6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5221c5e531a93cff);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1ec7dd517e090109);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3367de972584d671);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h191b4f26e656edcd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7c092ed853cdbbfc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf7861543333a4872);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf1e48a5ddca13f95);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf9bb4c4acc693091);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfdc93aa92378c961);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h22c2d394460ee188);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6b1330e26dd3d150);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h191b4f26e656edcd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7c092ed853cdbbfc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf7861543333a4872);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf1e48a5ddca13f95);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h15fbe0923de9ee8c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h13e3f8d40cecbc2e;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h63fb61c37ec6259f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha5c8831ab9472a6d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb22b43fdb40170f1;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h525f3ae8e401c721;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h70b4d6d15bac07f4;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5c5ff573156d2714;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hba0e0e7e5b6d5192;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5351517a75e0f264;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h46eafb9f61cda6e3;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1310f1654f5a85d7;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000031;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h0a18ead0ecd993b5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8e0776fec89f231a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000212b7212);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h11dc3e5d4d1d47f9);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0bcecbdcd1cfcb16);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000043af912c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000024f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0bdd72366c2d7ac0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd6febf9b1d9ffef7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd36f736852a2dd88);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he94a1a90f80d3ea3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h79757d387a72b06d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h97985ab7525f2009);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hef91f8416d510585);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb83711c479b87e43);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9d043c31a501cf41);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he65451082a37d99a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8500e01ee2450684);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h4797e42d664c8a69);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h79757d387a72b06d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h97985ab7525f2009);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hef91f8416d510585);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb83711c479b87e43);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h868d18c5b81a215c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1a7914d63c9185cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5bf736af88b58014;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3b81e879ab4eca7c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'ha14eccf2f310b681;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9b610d8a57525591;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb63d9872b75940b8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he74addbf256a68af;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9fe979c7c56b0b54;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd236fd28094dfeb2;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h71776357a3e3f302;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb57b6345ee8cd32d;
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
        keygen_cycles_33 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9ee78962f3286a8d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h71da57c3382bcaf3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000070748ba1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h60c6d9805ca51db2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0032de6864dc8ee0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000005e3ffc72);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000015d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h637d45aae7452024);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5639841e41f655be);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h579a1fddeee1f5a0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7138c64c9caf4059);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5df6b3e63f7afa1b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfbf936d4b94433a8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h05b57f8bb3740a39);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf5c7b3c4af1fb1c1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h3caec7fba5f40763);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h56298294ab604e60);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hbdfac92361c62fc4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h64f90f6953e0a591);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5df6b3e63f7afa1b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfbf936d4b94433a8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h05b57f8bb3740a39);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf5c7b3c4af1fb1c1);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9499f43d27be5e36;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hcb0bcf26366ee682;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hca4a1f6fddd005f7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hfbcc0918e5098f1d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h6300e349b85017ac;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha1aa556585c72afe;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1a6835caa3a6a7db;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h43cbc67f4b09821a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h2c0ecb5751b249d9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h61c7c8b6b0fc1c34;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h83262f7204a669a1;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he175bd475279159b;
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
        keygen_cycles_34 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h13c6fa05ba635add);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'had348985de163bce);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000042b2691f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h07b7d46ebf23bc1a);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5392351748f11c5d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000bc187874);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000007d6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hffbc705cb33f00fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd66115945c46191d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3bd1b3638a1c1065);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0d4ce19f2690d36c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfa163c2ee846fdff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfebc2ffc2d428dca);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3703d5894a738167);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he572932f2bef2dd8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1302296a650d01d1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hdff3fa7ed743b216);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h77a209de5c09d813);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb7869f74c7c6d059);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfa163c2ee846fdff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfebc2ffc2d428dca);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3703d5894a738167);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'he572932f2bef2dd8);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h52d231aaad9d354b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h85cacd2597df8484;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfa136742392e5c9d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc2723e4f4ec7e90f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd2ce2a4a6a59eebe;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha8f1d2b3feeec59f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h10c80bd1c360dc1e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7c810a083db63068;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h963e96e1b9092c3f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h70e40faae3bb6ca3;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha71fc447bf4701fb;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8348d49e9ddb9038;
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
        keygen_cycles_35 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h55bd8bf5a494edbb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha90ced145d4205f3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000007ca194ac);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf8ed13dcc5430936);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h51e1775df7eecb48);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000dfd45175);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000c7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h64946ab61c9ac9f2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hea65efcc1715ff91);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he5ded099f3082b8a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf9e16b5e816abe4d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h24dd82cf6d166edb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcda3e104e606ba79);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6ef95cc144a8d881);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h504cb81ac1d10b6d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hfcdfee832a534659);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h233e844469d15032);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h9937abc093aa9841);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hfa2ac7079ccf5a32);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h24dd82cf6d166edb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcda3e104e606ba79);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6ef95cc144a8d881);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h504cb81ac1d10b6d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h10a2fb44c74440bc;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h966d588c417ba3f9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3377802650c0179b;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb8405ecd9f1f9245;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h734572699b309b4b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2ca29b961aa7a5a3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h02befc33604c9bc1;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h652275bfc75cec5c;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h12ef1919f6baba15;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hae96283d29ca3c7d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he19b9bafe52c89d5;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6faad985ccbd5bf8;
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
        keygen_cycles_36 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h371bdd540465bd5c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf611938376f1678b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000b1816da2);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h23b97d72e90c68f9);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h2287bab3712f2b97);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000d422036a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h8d472b7f328850f2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h68ce884134ae6c69);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he229d5eea4280973);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd5f9946c5f4048bb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfef710574fb94ed8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf4c483b63985d30c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6e654f0ab913627f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf37f77c41678a6e4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7552e422fa331562);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h479d51455f59cb12);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h926c8d7aced97c1d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h80d837605e0983a7);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfef710574fb94ed8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf4c483b63985d30c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6e654f0ab913627f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf37f77c41678a6e4);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h933e17db4b43545c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2781e1892453b9f1;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hdb6eeed0ecdbb977;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h377b420be385ed74;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h808f496e71c7a6c4;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf401349bf25af2a8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hc0b82e6ce5979f07;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hc929434f94470657;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h87ba971808945b54;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6bd0c3990b32817e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h600c5e61fdb706c4;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h09aa79a1d36d68c7;
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
        keygen_cycles_37 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1d6a63f2951eca08);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h715ce0e7fece1ca3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000000df401ec);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5933950b7886e954);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8405c712923050f8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000c93ae615);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000372);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb80eadac65b9c445);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd4a21060e6c45a00);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he422d425908b6d9e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5ce86a352f1b5b0a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hef20e88c7c9f67f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h88b4941053800b3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2585e530f72319a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha589e356ad41ab7f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5c61e582aa612abf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h46fa4e43a291b95c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf46634f5c621006f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h411d53c2579f9fd1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hef20e88c7c9f67f4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h88b4941053800b3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2585e530f72319a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha589e356ad41ab7f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha493a987d5942ef1;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd1ac3eef4f54786b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7e92ae43c583cc4d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h143cfde7b1e2b84f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h809d783b5c738cd2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h001f04dbbb6a13b6;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf35b85be75ca3708;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2c9f4f44fc11d76e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4a140b46467df896;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf2f1b83d4c8133fb;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb320db79bb06af6d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h909d05f541c850aa;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000002e;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4e5c767280d7cec2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd51917e7414bae7f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f7d193f3);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4b60e2b656670bfb);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h82a59b79daa98770);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000014f0bcd8);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000002a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7ae8a75b946e8ea9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9d8f83dbc008106f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h09c8a80d55fec647);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha8d1eb909e7ff65d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfa2628363a6afedb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5031bc98bb14f9b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hed491eb795c10ff4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h80038ab9234cfc04);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he70ac8add1a41b11);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h5cd91fb7c8b9ac39);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0cde37725df67056);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc69eb28ca4a4fdc0);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfa2628363a6afedb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5031bc98bb14f9b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hed491eb795c10ff4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h80038ab9234cfc04);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6e008542870bacfe;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h5fe650fbb82a634b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h92d051955f8d5ec6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1833a949257394e2;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h05655a7c3fbec43a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2097c866bcfc4227;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h721a5119fb20ef19;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hdc3a73624c93b7d4;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h761e797e672ffe89;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hba354ea8247badeb;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hfefbf3e5d4d24259;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h26c57a27c7646cb7;
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
        keygen_cycles_39 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h833ed0090b7eea2f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h92aafadaff988740);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f30d691d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4a8232319d35bfa7);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h0a9bedc416df1a02);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000f5671928);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000174);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h222269fd7001e501);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hada81bc37478fc73);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hbabbbc8a94065b36);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h779a66c65ad9d290);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9df7555e97930978);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9f57d7bcf669adde);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hcf70f39703e23593);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3619d949266b51bb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h64131773421be374);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h83f111e9103f8ee9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h29c5c574b83569c5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7fb72bf645c09ab7);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9df7555e97930978);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9f57d7bcf669adde);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hcf70f39703e23593);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3619d949266b51bb);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h96039e7b3e88679a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'habf24f39dc127ba5;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h965adec564262ff4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf280a3a368f571c0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h0d188517014e9e13;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h176051412be9e3c7;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hbd50be1101bcfca3;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h683b8a7a7c9544b0;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he107e9211626993d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd58c38cc6749ce4c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hec29c51f29536c0f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbce0baf67e4d65bf;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000038;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h117a2a8d2c113333);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc266c37f7b1790a1);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000085e09480);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5243299fb004af41);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9a0b2e4419828ad5);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000b9e890bd);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002d4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'heb29d92442933392);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha9aa258effdf8bf3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h179a7aac8ed943a3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h07942132af95b5ee);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfe57cc1ef19d4d3e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfbe998e88587a1a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha3a3d167f577db8d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h373a2bb21078cdb0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h758c413e152ae5b8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0ecdf9cef0464225);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd85bf58e184b6033);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc10525a23b6c8f89);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfe57cc1ef19d4d3e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hfbe998e88587a1a5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha3a3d167f577db8d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h373a2bb21078cdb0);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb10a8e5e4626cd80;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9ace0101604a4792;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8948bf2d4c98558d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb8ad960f6a3c83f4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h446d9903b1f44f61;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h0fb9371081452050;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h5fdb2c69416bcfbc;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7753f4974547cdd8;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'ha93ae5001854763b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7feee0cfe42c4748;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hbb568a3340572241;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb21d83d98a1214a6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000c1;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2e5539a04d59de6b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9df63008dac11e72);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000001acf53);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc0d8b8df3f8941f0);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf2304363e5ca3cb3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000005b81dcd1);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000014);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hd2f4f0b5f77f92ce);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he9adc10300ea61e6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2166404ec5fe3b22);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hbd11c8475458f6b3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h501b2cd462147046);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5e60390bd36d6861);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3b8cc414fdabbaac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h32bb0b8f8d3a5e6b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc566261fa0f386f0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'haa760aece3db3b57);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'haedc8ac86bbfb346);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h197c556f70bcc393);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h501b2cd462147046);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5e60390bd36d6861);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3b8cc414fdabbaac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h32bb0b8f8d3a5e6b);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha7ccda8f139fff63;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha9c405bc36ab3efa;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7c829b9f5cff2ceb;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h478235dca2af545a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h9c2c957f442967d4;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hbd6503e25eec82ca;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h492ef1f4a89b675b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h869c6d5867b826b4;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hd669ba2f7eeebd6c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h709a16211b760dfb;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h9bf3d3b869f7d984;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb147a684a58f4053;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e0;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h34fb9823c1f8c578);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc5d368ac7697ea4d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000aae4bb3b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5931a58b4f7ed0d8);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h386981a9073b7ab5);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000945b25b2);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001ae);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb149dc3693dbcee2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf209fb4921f5268c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hbd69b4a31de557ea);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf5f3f4892c9b9109);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9fec249ee73a6152);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5ab24292704ed294);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h00009a307823ede3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7c091b89f8a9bed2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h00531d479eaa37cc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd719d03e449edfee);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd5ebb49d25237651);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb7474b75717089b2);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9fec249ee73a6152);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5ab24292704ed294);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h00009a307823ede3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7c091b89f8a9bed2);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2402852652556e60;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9b580e21529e4ada;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h93ea94a153e583aa;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9d2de86f074d22cb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h2ecf9175adec320a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'ha594133d17761a6c;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h01d5e4e20f8e54ef;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h46dd3f770ddd7f91;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h76ce54bede97e83a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h84ce10c7cd755b45;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he1e4be9f6481e850;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h713731b51db6a18f;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e0;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h280524c87aa28900);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8adb7534b440b715);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000cd0231c7);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4b6cdcd33f9770de);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h90a07136f9448669);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000000d42b7c7);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000111);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h46813ff210fb8029);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0a25ccadf496ad70);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h84d4aac72a72d6e3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf22a84ae59565e56);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h930efe35b192f024);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h03922bd97e0111bd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb91507aa0329868d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8504acfbc96cd7ea);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h96dc3db3d2b6b6c3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h21c525af2ec0a2c6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h693d34198912433f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6e5bf2cf17200bcd);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h930efe35b192f024);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h03922bd97e0111bd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb91507aa0329868d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8504acfbc96cd7ea);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h38f7acbaee9f32a2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he0a1e84b42ff47a3;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8437661a6c5a0ffd;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h909a8a62bae25cc6;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h22354c29de50e090;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc1bcfdd415c7d1f3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6cc64ae8f746a2f5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7edfeeacdd7a21fc;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1b1e5099e9fb5dea;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8b795aa034dd1c85;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h55dd3bd1af3d535f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcc0303ad99856b80;
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
        keygen_cycles_44 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h40faadec657a0523);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd79dc4f6bf9c4e48);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000001a7f382);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h6a25ecddb2197d3e);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1bf301999cc4eae0);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000005c8e0fa8);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002b3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2998ac1f8220449e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0d0f44d5577bc211);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hc3d54708b7163e41);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h63707ef2ef77ffae);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6e5b416e6723d074);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he04ef3ffda99d19c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0b095461c7853719);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1fef6c09e706d1df);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7fa6ee5ee369c4e6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6548c0c6fc941a46);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h4bafdf961246d1d8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h44f3c470f884790c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h6e5b416e6723d074);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he04ef3ffda99d19c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0b095461c7853719);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h1fef6c09e706d1df);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2f8ad451cd0d2af2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb24edf5624766cce;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h778927790e22c634;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h371dc4eb297efd72;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb93f3c5142c74689;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h041173d0bcb52d30;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb518c071a3945f2b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h214455a417808993;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'he0d4edb5b8c16378;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3ad7124f580e3445;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h60f62dc8c3de1997;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc1772e9e31f99d11;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000002;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9910fec7b55508df);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbfa58ac83376d3ec);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000b0355fce);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hee5c11ed2b4f7edb);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h7f409a429e205e4a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000d3b4d91b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000016e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h91dcc9b2639ecdcf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd0a614452fecf294);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h03dc7569d75934e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0d5d1fcfe4b8c36f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0bdf8ad03721685e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2f3e4480daaab6a3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha9201597d90bae66);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5397496f69a55f26);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hee5cd9c4950b8154);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha88737fd378921ac);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h708913cea20a211c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h49f98ab4da37648f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0bdf8ad03721685e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2f3e4480daaab6a3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha9201597d90bae66);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5397496f69a55f26);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h61511e7302ddc5e2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h079e9ec01a46a271;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h0e1e32c134556160;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3a21218faeb91390;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfb2d7a455d6c8326;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9ad68665de5245a5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0a7f99d5b1c67c7d;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h837bd3810ddc8739;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hdaf7aafdb2fef22b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hab845b303afd4ae5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h62456b695a212551;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'ha2acdde77368df7d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d7;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h068fbf56e2d11f18);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9766617bcea70e81);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000a5533c15);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h8cb77e71c95781cd);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h690e0437fbcc7d77);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000619fbc06);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000005);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdf5521b5158cffba);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h63cc48c60f578dfe);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h1787185e96768860);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h0f64ff2b332e2ac9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h02c686c2bf34bead);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h04f6a018687b18d1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0b1784b5be77a604);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8cca84e3a178052f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h3555cdc0a07634e3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h62b2d72adfe681a0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hae1bab11c64b071a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h184ea276bf39443c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h02c686c2bf34bead);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h04f6a018687b18d1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0b1784b5be77a604);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8cca84e3a178052f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h62ea25d6e85ed93b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfca4c81c2dae67c6;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc8b40d5862841b77;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h97278df963387e26;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd4c5dd8adc3880df;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6fd52a925693cb02;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4adafa7ef3d8877f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h762dfe9fa38f475a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hf09cac6566c1a41d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hafcf606ceb371ead;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd3ac3d3722e4ab8a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h08295122c5a30812;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000046;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h652140004894d20f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'had9d7804374ba593);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000b3202b49);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h08d971e0261aa399);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hf28413334e082594);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000000ca65b96);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000002e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hd0d703fad8a3c039);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd7ddbca399afe84e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h5410b3993fd08cc8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h20cf7020f947bbcc);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5ee16a9c7addfd72);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb1c601898f8b723b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h93b7d963da2cd836);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha5fba4c446209c7b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h8c30810d087e32ea);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf1e35e236712bf63);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h51974f3b836f48f7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hd9a2a1c36f0bd810);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5ee16a9c7addfd72);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb1c601898f8b723b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h93b7d963da2cd836);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha5fba4c446209c7b);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h35c02ffe930274b4;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hafafbfa58501d2f9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h958c1b06cd516e07;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hefb58ee6cac7f1af;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h575dda8930a44626;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h2956864286ce9e28;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h5ecc4ff8a089b004;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'ha4289c7cce44a8e9;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h462a6e4c0cd3ded6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h25bd3eef681fdf1c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h98a21d7778aa58ae;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd8607d9b8c7629a4;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000033;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h81e5311c128eb756);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he4e0d2c7dc91b3bc);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000002b880561);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0bbb885feba0445c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he5501a3a1c26a09e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000002b4780e0);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000612);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h6f6e413bd91da5f9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h4b4d568a1ae7e8df);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hcb9f91e587278c1a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h14642b0fab9ffd45);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfdddbaf58f6e4563);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf9b6b06ae57fca9d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he486a95e3f6903b0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h040dc81be6174d3d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5c2e695323ae0cbe);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h25c8ba2f647763fc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h04caaeb5eabb5d38);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8619a175c32bbfae);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfdddbaf58f6e4563);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf9b6b06ae57fca9d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he486a95e3f6903b0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h040dc81be6174d3d);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h15276a28fde73542;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha17d7b4179f63816;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hea78ba0e07e01bda;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8bd7f4f0ae197c0b;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h5c605193061b6c63;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h1cfa11b6f5d7db25;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hfa89b5a3aca8f118;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h54ee320b096b665e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0be5fa00176f6d81;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1e65e4637d649463;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h64d40e88b1174f3f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0b64e34b6a66012b;
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
        keygen_cycles_49 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2052abe09d9c202d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha278a68de9f8bdc9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000fbd3421e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd0fc43f5d9c6010f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h005baa806306270b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000000907376a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000273);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4aeb6bd5b85eb560);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc80375eebc1fac09);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hf930b36b0dcfaaea);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9b9e61df9c04167c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0e3b5806c7a35896);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h50afb93336d5fad4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hcc49a9a079f9328b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7e736f9939b646b7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h89dd37f9e6b4af4a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h35cc78b9662305af);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h07ead26d6171ef88);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6e00e1544d4e5d6c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0e3b5806c7a35896);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h50afb93336d5fad4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hcc49a9a079f9328b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7e736f9939b646b7);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h227541d412c84ad7;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h05493427f502bcaf;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8c40c720eee04ce2;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc2775c7e5fcea61d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'haf56bc2015827170;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc87e34fa638c7638;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0a1ccfef6166afc4;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7a2d2a63ae2ea41f;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hbe2f7e726166c8cf;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h472eb14d0715aafa;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h3d9fa7da1e92d37f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h43d8675ba01b49ab;
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
        keygen_cycles_50 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hb5ad6a8221d2e5c7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb5b1716aebbe54fd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000800ae272);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h224f59a115aebe5d);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h6411e6f4304fad80);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000009ebc0e0);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002d8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7bbfdc6fec015fab);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h292c2cc3c054159b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7f8bf47df0ddf89a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h88b07841a799fe85);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h445f16c03de53282);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf24795be24563762);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2a4a436274d35caa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb1aa89493fbbe17a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h32c22c63aed7fc99);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h465c036e9d4e18bb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8d13cd0db5d06451);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hbdbaa0276e701a8c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h445f16c03de53282);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf24795be24563762);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2a4a436274d35caa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb1aa89493fbbe17a);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hed82e1dbde41221f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9a385f4a9a5d8fe8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1111d3a3d34d2034;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h270f820758173145;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4e43a4e49bbedb78;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h340664ebe00285ed;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1e71ceaa3bcd841e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h189a931cd6d044dd;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h06d1aaac411e8792;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hfb5dd9f514b4ed2c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he73033eb30cea3df;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1da9b1eed96ab4e3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000000c;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'heedac207b911dcc0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hae9620fd7807fd3c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000627548ae);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9e9b507ec21a9f9f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h59173d1c7e98f5da);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000014ca1abf);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001d4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9d1bf1d0521d4ddb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf898154a94c650a7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6ad4af80dcb33591);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc11cdbe4a313e789);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h303d53c63b74ba91);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h95630c5253704069);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5e2b6754f21afea7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hea90959d2220944f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2ffdcc06603a68bd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h540877bd84a7eddc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hff14581f4e300cfa);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hdf5d3dc3f41210b4);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h303d53c63b74ba91);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h95630c5253704069);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h5e2b6754f21afea7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hea90959d2220944f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha7d5a07c87aae810;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hea15269e6ac8266b;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9c41552b3ae49a81;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h68cd100a2a4c707c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc36e57ba9487b7bd;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf58d53873c649ae6;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3e28530bb13489d7;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hf781d6f288b5c9b1;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfb7f9fa3c3d1d7f6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h2ad40274936514da;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hfc2abb3564f65693;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8c0f6015a30866f2;
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
        keygen_cycles_52 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h90573dd624cdf2d3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h8c0d3904dc9f43f0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000c971a41b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9801a5696e7077da);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h97c9568bec4e4ea2);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000001719a0eb);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000418);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1d11a2a8d2aff85b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h68248a6fc8b5f807);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h00ab1113074509cc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'haa482fb495493dc1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'haba4b166b5a7235d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd5875073afc5d737);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he6c3e44b857c490b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f1ff14b113b25fb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9cc6851e336cf16e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h493052a008884175);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h262d5c8ee9ffb463);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h34ea1b9e6de7de77);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'haba4b166b5a7235d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd5875073afc5d737);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he6c3e44b857c490b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h6f1ff14b113b25fb);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h1f63e5adf5ea19de;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h4c0a7a880f6363b6;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h0a2cf28f49ac6382;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hdcbddab5bbf2c8f4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h307a31b27dcbc0ad;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h05e013a972f82078;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hfc160f14b0603ac3;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd958beb292506adb;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h788bd7837ea4b8c8;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1786c3a39eda7626;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd157397485e3a6b8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h29fd047e856c01ae;
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
        keygen_cycles_53 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h511234e601a0e763);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbff8d8b2c28c2935);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000004695be1a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h9116d4129de1fe2d);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h28cb1c1778ff0854);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000860ed2d7);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000094);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h1d52dfbdba7bf897);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5c6da1330012879d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hae7139731b168982);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hbe9575509899c849);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha2c7445e5bbb6425);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h847409f6b3f48782);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0b5e918b9e7fb60a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7686251cbd897a77);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hdfee0ca55c545791);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd8fce8d1dcbcab6c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h0660b9fa199d2b15);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h358cb354683df950);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha2c7445e5bbb6425);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h847409f6b3f48782);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0b5e918b9e7fb60a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7686251cbd897a77);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'haeb4c89eb1f9e980;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h14fd4387bdd8a439;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h62969159fee80df3;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hdae00c79007e7031;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4f2e3d3d44593228;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h274a5f3166cc48da;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h7f40954d39602e43;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6a92c757b7936cf3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hab5e411f89e0a4c1;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h5daa36cca5f74d7e;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h71c2d998c12222eb;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3ef0484a2bdf3d07;
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
        keygen_cycles_54 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4bfe4135e76e6aa3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbdec5797b3721e5d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000fcea2711);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hfd636cc3b0784aeb);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h520ba029838c33ec);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000005d9ff5b6);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000c2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4900f79429d36e83);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb4d577d7bfe39d57);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h793277ee4f4e1b18);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h93f9147aaa61244c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he70d519571bdcfd6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5890ccc1b877bdf4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf71b734fc8677cb2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'haf4e7aee83203a31);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h93f34e27128525ee);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h84793c90bb1981c1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hff7233534bacf74c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7fa71d80c3cd6255);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he70d519571bdcfd6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5890ccc1b877bdf4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf71b734fc8677cb2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'haf4e7aee83203a31);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h32c9a832659496ed;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8282156cfe9af7c0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc83e2f50f2ff35f5;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h8097307987894244;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hcf98fae590efeab2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h48f8fbfe7bad05b9;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h4d85559030dac23a;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6a1e84071bb563e9;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h55cf79c4a126d058;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf406e257adc6ec45;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h667f18fbc219984f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4962995f7cf3ae20;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f4;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha52016a58fc7d32a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hf20ada10732d004a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f74be85a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf3d341546d95c7ad);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha4a5cb841c8b6236);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000a662d98e);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000024);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha84b56628ca84c02);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hbd7eec6ef3007b4d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h44c7301efd705a05);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h5a9c12b6795502f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7eec06e0569f03a6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4f3936c158e2f496);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9ae93ba2aeac19f3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha8bb7fbbb4c63b69);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hdc4f7d097e195585);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h49a12edaa08affe9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h580d83ab6f855df4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h9230e612116e9413);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7eec06e0569f03a6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4f3936c158e2f496);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h9ae93ba2aeac19f3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha8bb7fbbb4c63b69);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h3716b6af0747173f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hdaf74c0a43eb1818;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h9547718f7114ec1f;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6c9ca134b9094f58;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h7f76ce7e9c757cdd;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h982cf479456e433d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'ha9022811d644ec66;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h17ebe7c06b6ac041;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h6c55e27d0da6c204;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he80d9d475aeb1f73;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'haf6dc67044882a33;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h162289eac1a38ea8;
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
        keygen_cycles_56 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha31d356dddd33283);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hfec91c1d65420def);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000008aff047d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hfe2b0d29d9e2e071);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he4253c5c92963dbf);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000092f6453a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000012a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hd0c3a734eee31b47);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h1d6cda72a33924f1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h2e80e555821a6af7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hba48ef0772516df6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he93094341693655a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hda7e665e214bf818);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc0bca17e68b6ddf5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h195e8a2a9a753640);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hd39378262961861d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2e3d2ac0a11bc206);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h561adc4935d81bd5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1f95b5b543618f9b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he93094341693655a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hda7e665e214bf818);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc0bca17e68b6ddf5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h195e8a2a9a753640);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h14a1c2ea0610a015;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfab64ceece7ec52f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2171619fc3f227d6;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h937329e2659bc4e9;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h38ef940f82dc5dfc;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h11e00e5d9247d9f1;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h13878e94c6c1cbe9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hbac127e5f8e525f8;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h772208a326926e0d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd8b27b114ec4edc0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h077f32268c6889f8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcffdb1fd7e42cdab;
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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9c5294898c6444b9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1216fdb8087857c7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000af5deb1f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h10bd6581dd997c27);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h04bd55ec7e1a01e6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000009dda4380);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000053c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h44d5e505c748b6f4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h0b645d233b5c4ca0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3bb0f1b8ddc25728);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h6e7e7cb8b8aa3f30);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha6846ee6a556b617);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc35e458a200d3792);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'haeefa78ff10aec9a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha0a98d316e17b72e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h3fa6f11ac7c4a909);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hec0bedcf1635328a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h874ba96a853483d4);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha3c83c696e10fd8c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'ha6846ee6a556b617);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hc35e458a200d3792);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'haeefa78ff10aec9a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha0a98d316e17b72e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2ba03f56bd0b9afc;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h21ff81f2d9cf1101;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hebf3eb3896e177cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6ff30d373d5b84a5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hbef002195e23350f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h4baa81f733516a78;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h83b7c1c36051dfed;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h51f45e1cc58f748e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h4e5e9d8b1a5a0778;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hb3f7e0e9734f73e3;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hac3f9ea0814f955a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'he9581bf68bf91877;
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
        keygen_cycles_58 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h01a440edda020cfd);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2b6095d05bbca193);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000004926185e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb5d7fe9375a58568);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h486e6768f5b866a8);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000012985538);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000128);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h8db5eb652bf11796);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'had3525da889c4582);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he1dc830e03b526b1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h33c15a8d16430cb5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb5ee66d132010147);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h07ca948ffef2e1b0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb2d9d4ab61747e09);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h71d7a5239473c5cf);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'haa47264651871d71);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h672bbffabe5fa8f3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h495d9fcacd6cf5e2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hcc11bbff5cda2052);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb5ee66d132010147);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h07ca948ffef2e1b0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb2d9d4ab61747e09);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h71d7a5239473c5cf);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h499643b450dbbbff;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hbdbf3249d14d7478;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hfc0ae7f5cfc26d3c;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hca5910cfb509b9b7;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf11ffac6c793b897;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hfd03fdc67963260d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h11ed77e0b0211692;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd4156c29e4be1a1d;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb2d13eee16e39e3f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h262350dc36684811;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb3052476f9446a42;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hba53b95f2fcbc2ab;
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
        keygen_cycles_59 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h92843661e3e0f049);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h936bbec257009315);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000006899d66a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h0ed954be2a3f84c2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hddf52277753e867f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000d52f9fb1);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000377);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h08b55c0d658413aa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf3d7aa784c1ec053);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h225f757c00184b91);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h09ce6eeceb569aaa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfc353d536dae12c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h880f03dd43519302);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2f1f5e00af20b76c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8355a2f4569b94ac);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h91ae97229a6b2c7d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'ha729a4588869f6fc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h01b2f3beba72c4ba);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hb0ebff2801cd44ff);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfc353d536dae12c6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h880f03dd43519302);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2f1f5e00af20b76c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8355a2f4569b94ac);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2b1018b1eff9c0c8;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3130f6aec199bc23;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1dbfc4bf7a710b43;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb8643930aa6fab3f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h3948b9e01ea8aeef;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h23f98fdc43b9a69b;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he97ed67602416671;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hcf1fd88ec93c6dcc;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h356cba2e92b48b8d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h51b31feba15ddee2;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hcbc3501ab3abf153;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6a47d604dd60a9a3;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000a2;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h7a89538e9b41a219);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h01959fa4f41bde74);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000025cce22d);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he73298ae39da8a9e);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h4bdb416d19dc0a4d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000008e6ab541);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000021b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2137d3395cec6b42);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h98f974285983c9fc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h33f90a6937237f1b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha93fe43e37c9350b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8fbe5d3ee391a720);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he75ad84bb2c80ffe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hec1a84ce06481341);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h03fa5ba2ce219230);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h957f610fec2c0542);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h39fa29eb7350eaf9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h723deb9173507033);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h82474991ca450f34);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8fbe5d3ee391a720);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he75ad84bb2c80ffe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hec1a84ce06481341);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h03fa5ba2ce219230);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha5af16ac74071c0a;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h471dae116399ec7c;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he20734da778fd967;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd3dfea7d7494968a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8d0a89f78b20b096;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h88688f41709927be;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h55af8096ab487c03;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h678acacf6f3e405e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h08162b7ac94a991e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdf795faba45ea831;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h122686e0abff6325;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h784c5e0916813af6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e2;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h27fc8ee20149294e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h2aa81c69958a4907);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000009e5b9f6a);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2036efc1f9f68695);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h57943a5a3e6dcd93);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000facb4ec0);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000143);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hf193acef1900edac);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h52580a6ec41a9597);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h833e95b50cf29269);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'heb818618bdc807a1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1590f0ef12ae66ac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4b627169c553d37c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha5bc6e5d067967d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h23ee762e7e00d984);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf25afd1968d48b63);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h03744b6f99319af1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h40bcd08b77d2ad2d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hffe26760c414e85d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1590f0ef12ae66ac);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4b627169c553d37c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'ha5bc6e5d067967d7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h23ee762e7e00d984);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h7961ec563e4cc215;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2c86ab1b9d696c61;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd105910987c93e34;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h55a2cf05dbaf97e4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h95732d579106fa05;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h87ef2cd6e07d5e4f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h83218569c87c7382;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1f433af82ff35097;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h058d7d26aadf7f15;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hba30c9f9a4e8f818;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hbd910dec73d0d5db;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h2a52e751eb7a344a;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000005d;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha0429d3d79410273);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he78c99c6046199a6);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000006cdba6dc);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1d9ef281595415ad);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h421578b558ee756f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000094e004cd);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000024f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h810ac4f62652e067);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd101ab4f79eeb160);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hcc93b9075b53f322);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h154faaf6df003a4e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc41f5198c335d2bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2a08eb44ed3d0e90);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc3a53979c534d7c4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9b42876e905f40fe);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hc92f7b2b76f661e7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0054cc0d23c46c73);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'ha707dd9d96113647);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h35f31ea042c8bff2);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc41f5198c335d2bf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h2a08eb44ed3d0e90);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hc3a53979c534d7c4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h9b42876e905f40fe);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h81a75cb2a878896f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hef86da52e0ff3c91;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h54489853693080fd;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb17184f70695082f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8ff314c2f625cdd7;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h262986bb847623a2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h556bc194189fb1a2;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h21de8c6dd6a7a7b9;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0591e62dae47733c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3a85f6533324066c;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'he14f6ebea4612449;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h7d03725582c7d515;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f6;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h0ecb2541a506f2fb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9260920077e75c82);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000ba381782);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hfdef2e1c635f4ddf);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8fbfc57e9f47d870);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000d6ec49ce);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002bb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hda2648f09d6c4ee7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h59ffc3cb4fd54628);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h31689374179c120c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7a764571f140b623);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7a8e03671734a817);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h48244f385b4b9970);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h404c465ca45a1f09);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha795a4502543d54f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h53396bae74a47935);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4670bbc0712a65f9);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h35723d9ef76b43f1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1de3338459b53bd2);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7a8e03671734a817);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h48244f385b4b9970);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h404c465ca45a1f09);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha795a4502543d54f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hfd8162d89994e13d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hdb9e47f55b2a18e8;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he8691a06373bc46e;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hea2d3fa37c2d2297;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hed3553ae7c12b7e2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hded4705c2d1ff697;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h52d3a3b4e540b8a0;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h7eef1cd7533e5309;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h94c34d837173471e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h0fcbc147af366ed6;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0125a699b59f2780;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h1a20fed69b0743f3;
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
        keygen_cycles_64 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h175a35850efbd6c9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd912668192a77142);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000004ccf8676);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hda34519ec8b110a1);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb8d71db6fcd6eecc);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000a6f00bf3);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000105);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hea80d6a0ccdf1382);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6f6c0c67b9909226);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hb858365905c04235);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc15b1f244b3f3bff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcc96f569f5349d9d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5e6c7ba4af14592c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbf8ccc3a262034eb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8e4072e5d03f528f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7d8a581dec925023);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9fc07d13f19c156d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h35fd673ae1471173);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h129365ac0f4e7888);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hcc96f569f5349d9d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h5e6c7ba4af14592c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbf8ccc3a262034eb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h8e4072e5d03f528f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'he829558663b9a1d1;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h254ca53453b7d450;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hdb96a4d7253b3623;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc5149fe6ba9a5f6d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he8192ad0f6907a35;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd25bb38ccbca2d76;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'haebd42e6d02d1fa5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1b69bf5f504c2cc5;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h5d81b7df23b479a9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h966bfc660ca83eac;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'ha860d9e887dc80e6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hda84e4a489bb98da;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f6;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd6e2f572b899d303);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he947645abd529c9c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000395a5e78);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he429f3ef803bc7df);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h51e05de7570340fb);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000031087ebf);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000109);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hb5fe5cbc372d8200);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hf5dac6bbceb2d668);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7551b2a6e3bb70e7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h51354dca488d6cd3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5748d952e6ea54ec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h112ca79fef13b276);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbac8fdc8d01636cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc5e8f842cbf41367);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h75c768f338b94ff3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbb944c53181ce74c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h960efab29f8d3271);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hfbe03aa2e38ff6db);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5748d952e6ea54ec);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h112ca79fef13b276);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbac8fdc8d01636cf);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc5e8f842cbf41367);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hd1383a893b76380b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha0c6ef0348680ff2;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hb3d697806689d86a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h52a9c7199b1f5817;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h70ae2934847d1161;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h876cc1205860e988;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8949a9d8f57ba738;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hafd03240f26215ce;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7f5aef82d2d79a95;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf0b6873df8e1f7ec;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h60dd5ec2d02ef6d2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h6fb9247fe80ce96d;
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
        keygen_cycles_66 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h033c0a4126cdfc34);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h4d3167850dcfe44a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000092b195ec);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h4f60cd2ce217ea10);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9aaa5e9a27ef07c6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000000f00be84);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001f7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h861bc2390483d291);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hef146aab06ccb030);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h631ed4cc417d86f6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc64016aafec10fc7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f54e6eefed32813);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf7fffa6a26bfc2ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he3d691e3ec2aea92);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h597185f50c5a1fea);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2a3b67fe802db7bc);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h89d82b85fb079a40);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfc49b3a671bec249);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h42e139cf4465c814);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2f54e6eefed32813);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf7fffa6a26bfc2ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'he3d691e3ec2aea92);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h597185f50c5a1fea);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9e6b7ab59491d39b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd991492c6b795e10;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2d2537781dc13ad7;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hb26e2498e73ab4d5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hb80a9c1e19000947;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h50f0f83d7226b49f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h99281eabc9de0650;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hc01c1707de371787;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h8ec7cc8b991e5a3c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h1706fc080755bdf2;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6216042a1c9f5b9b;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h573484a531358166;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000d1;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h7ef73a99defe7da3);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h85923b1f6f6348e2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000072940616);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h40bfcf123b726c9c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h3068fb21f90cd474);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000a7a6733c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000007c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he997fff183774450);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc917f93492ce7b97);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h3f60c5a19cedbfa6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h1dc8b006c538c321);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc14f9b0b34d52b6f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf4efc407730739b1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7a22e44f2a4a5ba2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h22bbe3e7bce3d8d0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha2da935aa85e7cdd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3514fb600aaa39d5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h7bb7f276efa4a61c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h768dc9a994df9ebb);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc14f9b0b34d52b6f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hf4efc407730739b1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7a22e44f2a4a5ba2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h22bbe3e7bce3d8d0);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h7ba2db676903c637;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hccfd219b89f62858;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he0a0f3f0b51a7d16;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h02f1b10097fa0b0c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hcc593caf012fe63b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd3b56e9367a75a5a;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'heee1f12ea165dba7;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h5f458b3da45e80f6;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hdf0ffb3ec244f00a;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h50a52c9afc8564aa;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hd8efe038fdcf10d6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0b35289c3b5c05b6;
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
        keygen_cycles_68 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h534c4079ca8e9692);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h6be90b31be9c1b70);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000007f26e894);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hbc28021da74a5870);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hef54d3f58805d611);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000086d86f11);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000016);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h548585b2c2b7584c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd81c5bd49e377221);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h6551bd4dac390b36);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h2ea41774d35b1016);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf3007ac9a222c7d6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3a6bcbc3ae91fd9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1de15282ad478515);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7afb3dc5112cf919);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h233510e974fae1f7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hb17f352e9335e25c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hf608524b207365f6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'ha3495ec5957c6b34);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hf3007ac9a222c7d6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h3a6bcbc3ae91fd9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1de15282ad478515);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h7afb3dc5112cf919);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h546c256ba788f7ce;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h27a02c25f531ea55;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h95bc99672ab5ccdf;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hcabc306303a47f8c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h04447351fbb247ac;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8f25ae69464605fc;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb40025ff948be3cc;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd8dde79a382113e8;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h00e776fa772178ff;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h281c74e379871508;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hbb31df26d8ff814f;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h99f8aa88edf9d405;
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
        keygen_cycles_69 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hbd548dcfb25952b9);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb8b7814cca67d95e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000b1ef66bc);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h40536506b143c771);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'ha438a1c1bef133f3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000002626de4a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000005f0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0a72ef162b8a340a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'haa9283740a19856b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7f9228e3ab6e668f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7ade2d70215a7abe);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb19e1e008459562b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h912535c2586a0f11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1b8b5153ab6e3bf0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf5351396b8200c5a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5d19810743d345cb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h778b66989290228d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'ha4d0a242bd6d5d1e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc60a51730a2a33e8);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb19e1e008459562b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h912535c2586a0f11);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1b8b5153ab6e3bf0);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf5351396b8200c5a);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h326709da46b54eb0;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h0e26c053e7ccabe1;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h141715138d7f83f4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h079f9a17604f2c50;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd27d82caad8c0aae;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h602166dcb0fe65f7;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h637dae8a67f68929;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he1b2b90db51f0e58;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h224dd4ea901aceea;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h6c2c02236eb41ad1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h18ef6f22695f5969;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hc232f0d559c6dc90;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000006c;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9102fd494d96db4e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h671e7cf379e750b7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000c976c8ea);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1bece76fab3f76a6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hca3f2cf424e78a1e);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000016d23f5f);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000058);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he8d0c8c0bb580787);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hb1a13983416d4f3a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4010d8c53db72982);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h7768559de12facd3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h919ec86466a31f31);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h99790fe1ecc24f1e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3836aede42fa747f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3f41e741f9372a9b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4a41115db686a497);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0009865527291671);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'ha696be3d3329fb74);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h982552e47ebb8ecf);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h919ec86466a31f31);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h99790fe1ecc24f1e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3836aede42fa747f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3f41e741f9372a9b);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8ad6fc550a3902b5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hea40500acabe9d92;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h8707ea4287edf529;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hfd6bd71606d1b2b1;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hdb4fbccee6218ae0;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h187f6e3132219648;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd39cedfb7e2e7d87;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1cd86246efb211ab;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9ce1fc3bae2fb7b5;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc3a5a21b2d55bbc4;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2d3d3c4b1a48cfa4;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h760e4ccb18769b9c;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000066;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1d4073b8dc785e3e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1f41437571c5ff6d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000c8b22bf8);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'he186e45b1fa99dba);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h9495bfcc1a10d0fe);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000ba74be5a);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001da);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h3f10b79e3603dd0b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdcae9b11621e27eb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h5e3a4c4a544b6f18);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h55cdda5f9bd1b043);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h00834d1a197ee0c1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4c0f765685618bd7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdaf8a218fc198181);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha1ca22440397d8f2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h598f0ca01e24aab3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfc60416fe11f3679);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb6fdb67a327b237c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc196ce946a19a5b6);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h00834d1a197ee0c1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4c0f765685618bd7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdaf8a218fc198181);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha1ca22440397d8f2);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hce68a139faf6088c;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9e959d4b9f03025d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1fd41b627bda1313;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'ha601d757882afe63;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h863afa44b765eb66;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb9f8439b84ac66f5;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h953a5127ea71bc96;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h889b66589e50952b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hfa66593f5ae70277;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha5508b4f1cf7e8ad;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h834a60d0a2e06c2c;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h2956849e8f710e72;
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
        keygen_cycles_72 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h193b39f7b53d8cbb);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h6d06c07a18896b31);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000baf13e64);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h009b7aaa2dcba223);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb12b8451f110bea3);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000c0a754dc);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000fb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9ed6451e8b93e311);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h510ad318dcff9486);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h573fa69697426192);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf8cfe0c379f711bb);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1733c228bef3078d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd64dcd0b30bdba38);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h010730a86bbe4f63);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h49b2dede627e3b25);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h81c2a64bf0e9943f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2bd96e05403d4862);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8f585ccfb64f5df1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h91545fdeb129ec38);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1733c228bef3078d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hd64dcd0b30bdba38);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h010730a86bbe4f63);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h49b2dede627e3b25);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8637e1bad50e5a83;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2a119a23c821cbe7;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1dd6285ff92372b4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h4bef1af94d50fe4f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4c586a626cb820a8;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd630468b0fe27f31;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hefce80db44317739;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h8a1635dd752df94e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hde41fbefba36fee2;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h7cea0c11afa78c94;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h2cd922e54afceced;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hbda870f2dfa6225b;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000056;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h9ad8b2e518f7c3d7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h4f70e3a340c007a2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000005e8bd235);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3ec743455b68ad7f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h070c4e95a279535b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000003141a42c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000017f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4086715395f8971f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6ab080428a31d29e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hb5ccce6bb3a61077);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3d7885dc156c1b38);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h63469f667ba22a32);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7e8e96095974db2f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7a93f53d0fb46195);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5a619099b15f2c1e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5fa51ab424a7e40e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0c3fcf37d35ab155);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h202544dd03f73728);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hafc4b82c59a8d552);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h63469f667ba22a32);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h7e8e96095974db2f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h7a93f53d0fb46195);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h5a619099b15f2c1e);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb38e21aa5e89cff6;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb7e7915b4b8163cd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1f9f3e2c8d15e801;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2ca6b0c881b715b5;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hccb0218c2c531824;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hd2c32c6bf942bd72;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2a3cdf23ddbaa0c0;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h36f9d8a9bb3e339e;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb3cc72a1742f8c0f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h948f53bb80da72a5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hb3d5974ecfae8815;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb50ead21490b9e33;
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
        keygen_cycles_74 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h24e3a57095d26d31);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h397a599d9a9d64be);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000050398dee);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd31b3185547b6534);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h8159487397310a35);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000054ab3fbe);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000083e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he601bb26c3c94317);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hc80971219fde0c67);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h10fc8ee967dacccb);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hff624c5370d6f894);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1e213c33e1327694);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb12e6bfdbe088db1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1e6161138e1d4324);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3d2ba831169eacb7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h4b8f0f9d822a8391);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd8c1ae6dd72f04f6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2a8b965185efcb9e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h62869b5cdadb7a1f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1e213c33e1327694);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb12e6bfdbe088db1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h1e6161138e1d4324);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h3d2ba831169eacb7);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb18b46c0558cd52f;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hf257fa3c074166df;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha5749fd3028a189c;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h01a16a2814b74b85;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h048c4fd309f0c3c3;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9864acdea85f1121;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hebb57fd7add93392;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h0bf6789dbffd4c71;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h7810a0fbaa7b5061;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h080770408b082475;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h11566612d831c856;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hf903d081d6eff693;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000045;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hae4357fc14ab26e8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hcbd0ace0c2fc232a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000003963381c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h804d847380452b0f);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h56b59a9005dde299);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000000eff6fdf);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000661);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h7985a6c3f978828a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hcfe4aa9aa7923a6d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4fa052d8f04ee0b2);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb255ae1b4fc468e1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h41ab2710dd70fd34);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h36f983f88ed18be7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h26b6a3c0bcac2764);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h213127e5523f7357);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h9437b29fd2226eb2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h7b1e1d436ea47a6d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h80ef22de41721622);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hccc22faedc6d7ace);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h41ab2710dd70fd34);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h36f983f88ed18be7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h26b6a3c0bcac2764);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h213127e5523f7357);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h5cc93359974670e2;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'heecb55cd57926700;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h2b105f74ef2a6370;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hf3bcd9b3fe338869;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8dba7ecbb08e585a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf6d58cbc74280f74;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h8f15afcdba69f81e;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h551897b79d4a94d8;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h016af6e6ba5bd4fd;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h0535948aadb3cfb7;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h4e0e7850bb54d686;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3137ef518b0fdd48;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h000000000000007e;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3244d7367a6ec4d2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hfa2905a206ca8777);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000adfcf869);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h958b569cb53078d4);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hb8f25355126f6c63);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000004c54af93);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000021a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h11de8e81d6991264);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h501256da7df5176a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hbc961c58a080a446);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h688ba6bdb844cbd2);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8f5ef10086f0f9ce);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h24f11c337e04c134);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6441babd20dd3d81);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h724b34d02880b628);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h7c7d8ea25003e1a6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd5b4cfc46cd562ab);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb47db39ed5af2c0e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hbe631f3408682254);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8f5ef10086f0f9ce);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h24f11c337e04c134);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6441babd20dd3d81);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h724b34d02880b628);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc4401a4e6e1a0dc0;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he968d033afaacc41;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd74ee1816b122f22;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h203d80a7d4287d65;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc43ae1eb2888b613;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6e93dd01884b4ac8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h795e8d65234ca0af;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he46a22782ea469e6;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h66a1d4650e059bde;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h169cabf16870ca2d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h40be56446f8e8346;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hcdfc2541c56437ab;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000fa;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hcb99ba792cdb6741);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hc5ef927f3381d619);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000094e7eee6);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5af68ab3a8dfc245);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'heba8141a806ed76f);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000ba8f9aaf);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000001ec);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h75e585d56bae4911);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hac10004989e51c5d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hcb04d3cc6f3216d8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h67ec5cb07bde8c5c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hedc74cf8af047509);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he4214da7dfd6f709);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb2953bfdbaa8616c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hceb044e8becd5a36);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h87f6ee4493185d57);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3229868801935d1c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hfcfcf729f23b0ac1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h467946080f63a317);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hedc74cf8af047509);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'he4214da7dfd6f709);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hb2953bfdbaa8616c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hceb044e8becd5a36);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9f37eedb31b9cfb7;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9f1b198fd4ec7e11;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4dd2504d70605480;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h2e1ec9df0b6ad912;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hfb864ba18b64a60e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h63da86b434b757d3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf49f443a2d8845ea;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4eb370139d8af240;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hc15cc453b883fd21;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h131d27f56f3315b6;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h1aaf798a2a7d87b6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hfa622a869a6dd186;
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
        keygen_cycles_78 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hc001ba14f1d6a10b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'heca93c93548dfe91);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000028dc81f0);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hba396b9183857e03);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd229f344cd323711);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000005d500035);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000003e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h82344ea5ab09ae66);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9e14fc8ccbd9f3aa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h669e21b047320b06);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc7746ab1109f8b5d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h87c1ecf2553fac79);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h32b75a44927d1774);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3c8603477a86f516);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf641063c86d2d3ef);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5898d429f08681e3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h3df81d2ef0c89306);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb00f5f6290a14fab);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h249cd039609c6919);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h87c1ecf2553fac79);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h32b75a44927d1774);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3c8603477a86f516);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf641063c86d2d3ef);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h2ff5ac05f001b108;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h27833ba20d825e1f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h219d7649813c276d;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hec7214a0908f0140;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hc12ae071daec1307;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hcaa73babbae391fa;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h10c871e2e6b67c48;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h3d6756d3f472f66b;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0ea47990a3fa700c;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h3c7dc1effd932ee8;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h04e188e18879a865;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb2268b03f95b6645;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ac;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h2202fb0db7a4e377);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h1373b1831f5a2a77);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000002a13ed98);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hee68e4189e5a7cdf);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h739a82704190d103);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000b112f50c);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000063);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2ce9154e31acbdee);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'he485bea3411f854d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8ccee9b033b59f25);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hc0e541ef91523708);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9033d23e83ff78c1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdaa4fdab59b00dff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h61b3b918f7e95dcd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd69aa78885584cb6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha9bf360004d17655);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd71ae7981a851d27);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2f9db12ba9093138);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h9d688e499760f2c1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9033d23e83ff78c1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hdaa4fdab59b00dff);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h61b3b918f7e95dcd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hd69aa78885584cb6);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h40dd39d96f83df17;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h270b0dac35fa36fd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h539394b57ebb9ef3;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h57976f40e802fdc0;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'haa449a93a0984cd2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hb3f5aeaeafd218f0;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h1604cc5ecf0e74ca;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6183e22e1615110a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h286820105d1352dc;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hec81cc636d900de5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h729a01adf153f3bc;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h19d5fee46a646fc1;
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
        keygen_cycles_80 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hda86fb873f835ba7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hed52f2e6ae40a660);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000cc0f7ce1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h33684c48380c5231);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h55c408e06919e52a);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000cdd2e509);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000139);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h13d087083d056967);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hbe2d73f951a65351);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7266486f20869948);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he46d76ecfe41da68);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h58dd3979fe1c1153);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4dad45686771ec9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf39cdcf345f65c0f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h33587b82cb68807f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1d272c4fd927f167);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9664c1b7a8475906);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h442faa8b5b6dfec3);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7f3b3f55c1b59d02);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h58dd3979fe1c1153);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h4dad45686771ec9c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf39cdcf345f65c0f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h33587b82cb68807f);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9df935e1a51832be;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h498b01692aeae1fd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h4b40202c13539ef5;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h6636c0876c8bf16f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'heb2c34cc71a4e44a;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h8762530a1feed37f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h3a9b8f7cd42c7f6b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2193a60bbe5973a4;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hc4a961012338841f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h51c8c64bd99a2809;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8d173ee4e5b3d28d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h9049eb7b87f2b3a6;
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
        keygen_cycles_81 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h284187c92846aff4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hb7e8141e228f310a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000b070bf73);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h663438f41eb5d525);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h5ae0b8160ce09ce1);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000026174259);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000012);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h2e3c49f99dfad1d4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h5a996e13bec4634f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'ha2b6bb20e6772882);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha13e957de4285b9a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h607cb0c563adf027);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hccf20286f9953d16);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2a3ea710e056a80e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h816be91bd5d437bb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1e3685e6a726ad47);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h0a5fd3a5c783323d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h7fff49986026f1d1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hfb59d1507bb5091b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h607cb0c563adf027);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hccf20286f9953d16);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h2a3ea710e056a80e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h816be91bd5d437bb);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hc05667fd8290c276;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hbbfa0c260469d607;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h411c875af8102fab;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h3b9837ca5c12bf7d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'he7c64ff59fdfb260;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h7b44037c2127e1c2;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hbe035e31c4d149e4;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h4bbc210afae48dac;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'haf074a293d83dbb6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hdff55ae890f841ee;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h0f7bb501b728f742;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h0ca1a59afaa94b86;
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
        keygen_cycles_82 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hd8e7677f88ea4142);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h683afb09f3efd7b0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000009d306fd4);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h2c8d3948a53cfe08);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h7c69b1ddf1d50975);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000008ce14c19);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000006a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h4bf003aa438312d8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hd8fb8e4a17c44dcf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hc4008b34ec5ac458);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hf9c982e5d5bc33b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3c1b7ffdeb8964fa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcd7127c7328b0972);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h16fa30039941b76b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb86925b66f15e9bb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he2fcde027d595e9d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h4ac3f3cad1da5d0d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb6db6cfb23824eb0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc1387065e3c2390b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h3c1b7ffdeb8964fa);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcd7127c7328b0972);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h16fa30039941b76b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hb86925b66f15e9bb);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'haa48da27b7442300;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hfc60d4bfb95e18e9;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hd0fbbd74e5fcd512;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h318b22ee48318d77;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h12c1ba55f7881bd1;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h3e8b4d72d9014887;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hdab1b9c18d0afd12;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h24f83618782d3dad;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h6aaaf3cb756132d7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h931e183beeaf30b5;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h67d668fb9f98cbb2;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h8dbabf1af8424ca0;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000056;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h774bf9c30892eb36);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h4d12ea97632e93d5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000006996297b);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd9abf8e327d91a1d);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'he676c00043d7247b);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000001a56aa2d);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000194);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he62d4d6ff56660e0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'heffaf952f50d41f5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h4c9a931b895a24b9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9b7cd3740a4783ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0e8e0312b65c4474);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h099bfacdc1cff4af);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h908a56a9f327edb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf367eceb2989cf94);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha72112c5459a9682);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h9bf70e24d0dcc60c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hb45b95c670de2d26);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6268d29d67a066fb);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h0e8e0312b65c4474);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h099bfacdc1cff4af);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h908a56a9f327edb1);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hf367eceb2989cf94);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hdf16949f0ae8a32b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h400befb8d4140a84;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h7e983d9d54ee5167;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h1265dfc614cc5f3c;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd9a6702ea159191e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'heaf64c84251e34f3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h528b825b837f5546;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hce189bee242f1948;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h3efd5898f42f1fd1;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc169a7dbdf9d39cc;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h7a6b78cf3a830ca6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h64a86a58fc80f8b9;
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
        keygen_cycles_84 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h826b4fd55c3b54e8);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'he1b372d67f0d7d62);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000009fb9782e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h431dbc49033a2817);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'heb37fd32c5367c8d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000590181c3);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000016e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h80194d6e7a64eb1c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h8dc8f2bb743d8e46);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9c5ab8831bfce38c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h881bd4590f796fbd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7dd96853a480f253);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9bf5f3a7e690dd9f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h53787485a03153ae);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h41f1eba7e99f02d5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hf32fc2bb475db412);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hcc4a2be80d146344);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h1fa49b664ca31327);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h73d49a339930c5f5);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7dd96853a480f253);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h9bf5f3a7e690dd9f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h53787485a03153ae);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h41f1eba7e99f02d5);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h9c3619482980d6e4;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hd3678182de1b120f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h86a4564ce952f9b4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'haa4b89426bfb098d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd33139ff9238da4e;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h01dc9b2d505b6c84;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h88849a6621548fe5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'ha72bb14bbc071232;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hc97b2742e3e0511f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hcfd399b379560d5a;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hc49d2256a60613a8;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h70ccb72abdaa8d34;
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
        keygen_cycles_85 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h99c4acaac625be26);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h4001146a4fa035d4);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000b6c4b73e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h421520ee01022b3c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h349b2a8cc07eb8df);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000e192b8ff);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000185);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha106d4d8141998dc);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'ha6cb5f2c2b38812f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h709ab1ff6e415231);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h93703675737006ad);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2cc2751135ef962e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h88a190ddd09ab9b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbaf1a182aab47392);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h03668be746c31874);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h747d294cf2fbb6f1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hbac2d63f0387d7d5);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h75feb0c20683c142);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h972902a421643971);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h2cc2751135ef962e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h88a190ddd09ab9b9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hbaf1a182aab47392);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h03668be746c31874);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h54a7746259b5556d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha6d92bbc883d169d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'hc98b97e7d6f40eed;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h9b483155a58413eb;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h76280643f083cf6b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h439a7f052cd57081;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hbfbfc10fdbe4a45b;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h26b81a371e8e9061;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9e401a2b6538686e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h83ee302277812827;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hed95bd4446a4ec76;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h5f6aa4a52fb4b771;
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
        keygen_cycles_86 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h4e17be3fc40a8d7c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h31e29f0266c32815);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000005e43ac1c);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h5a55e5c107f6d463);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hc61cb4ed82761862);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000678adef6);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000136);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h0f13bc123ea25a30);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h03057b6f08655935);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h379ba5d5fee92d52);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h9183e4f4292384f7);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c5e86e90dcf5360);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hbf19001ce6ba843b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h34bf7716e5331982);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2267f92712e3fa81);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h59dc9d72de20e5b8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h2fe3f43fd805ba9e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'he7f8ca1626f0ff3e);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf3d961ed264ede3e);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9c5e86e90dcf5360);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hbf19001ce6ba843b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h34bf7716e5331982);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h2267f92712e3fa81);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h72be81600ec2d319;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h3c415c7ac2b1d913;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h3647587126b60862;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h60f8dcfa9614f172;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8644cb11abb8c040;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc6ec271ac07d422f;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hd59b7ad7658d23be;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1edcede3941bd179;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h10b79cdd710b991f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h8c117bc12ada448d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h615cba957d21165b;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h05921885a63ff78d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000f4;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'hac4c48ff8f3921f7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hd6249096253cee50);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000fe3f3a09);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h1329ca9f221b620c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h458518efdad11ba6);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000fe523f8b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000145);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h86fbc0e169e287e9);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2e5943799970ef0f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9101c8d4ad53f30b);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hacb6319899876ba6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h96222cc73c67bde5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha0cde2c8890c4667);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3664581c936366ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha950e5e65ff2bb75);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb40da6a9083b5069);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hf9736290b3880530);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd6b25d9bc04ac1a2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h79a6fc6341201f10);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h96222cc73c67bde5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'ha0cde2c8890c4667);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3664581c936366ed);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'ha950e5e65ff2bb75);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hb17f24a0a67f3a3e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h7abe6c9435f92da4;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h34d5d9070df066de;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hcb4c31b13beaba51;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hf55552ba9035d3fe;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h36ccae3dec9afbd8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6e388e104aaa4202;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hfe1bf55aa062a608;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hb34cf130ba99dd1f;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h54678da8ffcf97c1;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h71f584d3cfa27ed0;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h3970f2a110d4276e;
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
        keygen_cycles_88 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h524f926ae915295a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'ha17b668bc9fae22b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000eaaaaf78);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3091edb285305222);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h4d271df8f163289c);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000b55e5574);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000001c);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h68d444b0de77a09e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h030318c59fb0f29a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0c3e90a1d53898b0);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h41824c8639f82b12);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he6013d10ae82875f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6baac9ce3bd37a3e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h09422aef6e6d9e94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc14fbfc9ab810b23);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h2f0932d330f9968f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hb980079f3a1a15b0);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h20b7abcbbcb9c0b7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h7caee89cf7d2855f);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'he6013d10ae82875f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6baac9ce3bd37a3e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h09422aef6e6d9e94);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hc14fbfc9ab810b23);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h257441c9892892d3;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2ef6df3c3c400583;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h1c46441da1ac3b53;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hd85f29899d87701a;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h8cf7236c1b84f101;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h6147ea3be9bc5fa1;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hf79169bac9018278;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hae9cd732a88348d3;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h9ab9cee4b67a8ba9;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h97e34ef5af293203;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h38ed3551d39d1436;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h760a9257cf32f4d7;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000bf;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5351bee9b03a39bf);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h6b67ce53de65e07a);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000002c2d27fd);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h71362312ac7ddf00);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h47ad46a3bfd45292);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000078acf7ac);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000003dd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h53130c6c242610ba);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h2dd41ba69f015b16);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h0a7df399bc83a9e4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hd0505ab8268a1842);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb9830b58ea9a5d46);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8ab1d781924d0409);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3fd29897dcba1ad9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbd6c902162a73423);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'had19361d7df4d4af);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h24f0bdbbd5ef7118);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h638baa6abb578d1a);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hc26aa6bfccc813f6);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hb9830b58ea9a5d46);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8ab1d781924d0409);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h3fd29897dcba1ad9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hbd6c902162a73423);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h04ac838929fedebd;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'hb28ac1f4c45c3b95;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he033a2bb7f1a38a4;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h87e773448b2c7176;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hbebce8d44ad90783;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h9c5d1371a6341ee9;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h24a669d3a30a410f;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2dfc0ac440046515;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h07aa867307b620fd;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h01d5a2dec9755d7d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6f6abc23ac069585;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h4a4c7813b303131e;
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
        keygen_cycles_90 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'he89e0b641ad3ab8e);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h3794cd1ebe33e16d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000ce337ce8);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hc84790b4a4a042f2);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h4478f8d79dda0c74);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000d4347d6b);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h000000000000009f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha6776c6f1ff0ec7f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hdae35a7d5b5c49c8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he32f963b03048cd5);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb6969dfc433baa8e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1abe5ea2df76ce3b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8d0ef67af386741e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdb9f235b63617c52);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h703be749fa2c7a19);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h938576f45dbd702f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h8b5777c4e5ed7a0b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h296f41f983d869e8);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1e3bad805d002dee);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h1abe5ea2df76ce3b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h8d0ef67af386741e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hdb9f235b63617c52);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h703be749fa2c7a19);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h8548bcbcfadaa0f5;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h2d2646108af27ca0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha73236322efcc416;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hcd2e703318c7e718;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1abd2d7b8f41459d;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hc2ded57b465c5d0d;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h0914f5f253b01a41;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2057e7ec80a78823;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0df9e1e15e0452b7;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc40448a3f7f6f29d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h44e0f254baabdafb;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd9fd3d2b2fef5847;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000085;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h15b2920c975d784b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h28652a38d2b02e1b);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f67b49e9);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h82db6b7f01547a68);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h6e3ba381058b2ffa);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000001f54b550);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000002b3);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h5611233a60c39f5f);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6c712749b1495260);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h331f79eba60722a1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h3a0da9e74d4f5aef);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc12f5ff1e040e2e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0d95f385e0af421b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h47f4924025a1423c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h265f9655dded0a67);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1178d924a476d534);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hfaaa37379ddbf5fb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h7f96d812defbf907);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hefc94ad448d1a399);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hc12f5ff1e040e2e8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h0d95f385e0af421b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h47f4924025a1423c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h265f9655dded0a67);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h751ae74531bda28d;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h45885bdaac6b2ffd;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h689d4b50c184101b;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hc74d8e32cb94205f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h23507ba48919cbaf;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'had8a730c76db24e4;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h72cdc4a6f752c41c;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'ha5d1d796bb0feaa7;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hff1db338c981d987;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'he72cdd0bf0cdac46;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h1288d05695a7137e;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h782026ec2a0d7b29;
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
        keygen_cycles_92 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1c0f5bccbb2776d5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hae98e8771dcb88e0);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000931746a5);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hb7f3c82b5a404c49);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hbd9e98fb1cb6bb60);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000069afa8e1);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000463);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'he65b8d5de1a199ed);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h21791972d9f15abf);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h82b0ac0c0abc9633);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h30e4d65d97ac3018);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8dac274bad08e5a8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb929fb392434e2d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h954e809ca67b949f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h091a6878697adaa6);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'hb631c4477470c59b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h640b1221daea08cd);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2e6902b1c95b5526);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h8f762755b8cff627);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h8dac274bad08e5a8);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hb929fb392434e2d3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h954e809ca67b949f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h091a6878697adaa6);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4be05eee024968e1;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1a97b2c05b1a852f;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'he8388149d78e95fb;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h60adb0e4fe3ee79d;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd5a5e10ced977eff;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h024ea37ba85781a4;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h2cb63d357efdd927;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'he9377395af4784f4;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1b8269d419913aa2;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hc950fd44965313c9;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hdf256b5ec2cd50e7;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h2560779929530e86;
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
        keygen_cycles_93 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h09cceffec666eb2d);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h31168afe531f1299);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h0000000041783889);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h35c63d5f070ea955);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1443d24f4658dc2d);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000c49c1b30);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h00000000000000fa);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'ha17977af3b8d9d84);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h6910b1caf1742ecd);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h8dd3ec01ea5dd6d6);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h24b998d3d5e40e64);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7c1bbcde13facda6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h053f941dbde7df5b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf0ace6a2ebed308d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h92d93e5481599142);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h56d9e6a0f5ffa099);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'he4cbd8979d582cb7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hd0652591f0349624);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'hf20e129c0416dd42);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h7c1bbcde13facda6);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h053f941dbde7df5b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'hf0ace6a2ebed308d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h92d93e5481599142);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6bdec6297bdc6cfa;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'he52920773b19db38;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5874def527ccc878;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h31f359cc194c7a2f;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h1fe61218c6c79cac;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h56738762e4691e31;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'he419693c68a417a8;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h6c97db89791ad1ab;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h353c191fc9c5572b;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'h0cace21860238b44;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf2fed2b88904c58a;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd28d7e1dbee9a84a;
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
        keygen_cycles_94 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h0d0351d6edba41af);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hbd057977bc75e6ff);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h000000000d57a5a1);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h97f79f39fd84612c);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h1c245cbab553ad83);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000003df3d5de);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000059);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hbdea5cd95579fc56);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h3893660c4f2668f1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hffc73a9759426f41);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hbaf4fa0794bc948e);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9bfe341cd9c78154);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6e29624b9f414e84);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h363fa2295b78a891);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h45982f5d39b481ee);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h1c776c2bf12b9792);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h6e56553088dbc3eb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h5ee3c54863d8c432);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6640f8c724fec594);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h9bfe341cd9c78154);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h6e29624b9f414e84);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h363fa2295b78a891);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h45982f5d39b481ee);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'hec7fbf13ac97247e;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h1bd179ec29eaa6e0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'ha078be2cb947aa6c;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h36f6431d0f4399e3;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h345562013535bc76;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h43c3c2aac1ebdd2e;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h55ec3da7b94591d9;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb9dd0cad37b1911a;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hdd4582efd65ad94e;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hffddad090d8be6d0;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h6f540ab7bb97fe9d;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h697600bbc7aabccc;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000ac;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h602dfb53603e864c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h90da70ec652e3ed5);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000128bb283);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h7df75c461c7e6f22);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hbfecdedf46670838);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000ed9c0a19);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000545);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h9415e7191206bf30);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'hde2a69e6ae513035);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h7d6d4e97791dfce1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'h2b069029d4e01819);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfc17d0285a8f8ed9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcd133e34764532ef);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6611482224655895);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h33594280f1f6da21);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'ha0ec4d4e2dca0564);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hc9d36b98c7c23feb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h5689324d9b2f0250);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h966cc16bf9d6a37b);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'hfc17d0285a8f8ed9);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hcd133e34764532ef);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h6611482224655895);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h33594280f1f6da21);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h4f905c273d721787;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h5c3bd8a86254b377;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h347f77e0722f4865;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hea002a8d8ef3c096;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hdaf4b7e2c802452b;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'haa21076c0d9e4035;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'hb9dc23c7c6205512;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h1997487e3ff7dbbd;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h0e40afe91624c94d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hcce345009af3bb00;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'hf3657f92a8accba6;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hd5e29557880c69f6;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h0000000000000082;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h3353734d09fafdfe);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'hcf77b92fcffdb3a7);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000ef08fa9f);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h834ea90f006b32d5);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h51f8952e75409661);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h00000000fb8c4e91);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000077);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h99eafe25c04ad52a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9f9736b8ccb8f27d);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd2d3ae66488f3c37);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'he0b6275c729dbc01);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h25163fa3dd75317f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hacfd042ca10a62dd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h596c3b031eb506a4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h39e9baec7a47e9e1);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h6431aec5a299e83f);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h7bc632aaae83fafb);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'hadd748195e31e072);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h86ff8f27677f22b1);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h25163fa3dd75317f);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'hacfd042ca10a62dd);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h596c3b031eb506a4);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h39e9baec7a47e9e1);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'h6eee161659cfc239;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'ha96bbb554a60221d;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h080eb39046b0a069;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'hfea9425c3db2f7fe;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'hd9a4b367a568945f;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'h47cf53f6dc0d87a3;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6a8c77096a3a4e26;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hb0e76614157c7610;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h96a933574b2bcc11;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hd7a4fbbfa5089ff9;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h1d52772719442099;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h117aee430dbd6c28;
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
        keygen_cycles_97 = (end_time - start_time) / CLK_PERIOD;
        err = 1'b0;
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h5b3a18e7fd1a963c);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h35f1a73d4dbcb0a2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000f0215087);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hd5cb9f49837509ed);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'hd98169764460ce83);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000006039ff70);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000167);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hea64313b559d783e);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h59af72b85c48fea7);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'he8d0930924bfe33a);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'ha1724649a544cc3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h729db44a0675ae48);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h28eadc5ee1faa44a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0ac3261d31326502);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h550bc99c2f263cc7);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'he4b8e671b2890504);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h654810758d7af5b2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h8bdc220ad801e709);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h5585b722e8cc1d8c);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h729db44a0675ae48);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h28eadc5ee1faa44a);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h0ac3261d31326502);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h550bc99c2f263cc7);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha44617354de094ca;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h8e77704767f6dcd0;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h5035d2f940cc8c9a;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'he6170de9b34d3325;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h4815742527430ff2;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hf2bb3ca2b58e93a6;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'haa7003787a67b4a5;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'h2691c7baf9054461;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'hc975741e5ffe9ee6;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'hf3575b36520db14d;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h5a11ae4be25213f0;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'h39267233a0df4c0d;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000e6;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'h1cdb61b31a5f303f);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h9ad892d52e581961);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000e648bf20);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'hf4dfb8e52bfdcf22);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h21f1de9341f40388);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h0000000058993c57);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000172);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'hdc5111c7e44db392);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h72fd46d27ad190b1);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'hd6edd60f23660d12);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'hb08074ae2096aa3d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h70cf00e230d3ff3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h10b40bf3e2bf090d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h436c4fd041b248c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h67da5a8a65a57942);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h429299d585f8f896);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'hd5ec862512c0759c);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h37db36207de45649);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h1e3ce28d26d0d07d);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h70cf00e230d3ff3c);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'h10b40bf3e2bf090d);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h436c4fd041b248c3);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'h67da5a8a65a57942);
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
        dut.main_mem.mem[`SEED_KEY_ADDR+0] = 64'ha3feade8cbf0442b;
        dut.main_mem.mem[`SEED_KEY_ADDR+1] = 64'h9e6eab03ded9f907;
        dut.main_mem.mem[`SEED_KEY_ADDR+2] = 64'h98ffc63dc1d988a9;
        dut.main_mem.mem[`SEED_KEY_ADDR+3] = 64'h312069337b9204f4;
        dut.main_mem.mem[`MSEED_ADDR+0] = 64'h69193ca5868199da;
        dut.main_mem.mem[`MSEED_ADDR+1] = 64'hced6ff9e85357fb8;
        dut.main_mem.mem[`SALT_ADDR+0] = 64'h6982d6b10399b3e4;
        dut.main_mem.mem[`SALT_ADDR+1] = 64'hd93b9d96f0da80af;
        dut.main_mem.mem[`MSG_ADDR+0] = 64'h1c6c95adab33ba7d;
        dut.main_mem.mem[`MSG_ADDR+1] = 64'ha1f83397ff91c5ef;
        dut.main_mem.mem[`MSG_ADDR+2] = 64'h8cf169d1243f19c3;
        dut.main_mem.mem[`MSG_ADDR+3] = 64'hb212f0510a75def7;
        dut.main_mem.mem[`MSG_ADDR+4] = 64'h00000000000000de;

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
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+0] != 64'ha2de544a78b0b554);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+1] != 64'h26613e9a3b0db1f2);
        err |= (dut.main_mem.mem[`SECRET_X_ADDR+2] != 64'h00000000bd29ae5e);
        err |= (dut.main_mem.mem[`Y_ADDR+0] != 64'h3ddb895aaae4f4d6);
        err |= (dut.main_mem.mem[`Y_ADDR+1] != 64'h849ecbf48fe0e8c4);
        err |= (dut.main_mem.mem[`Y_ADDR+2] != 64'h000000008b5f5376);
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
        err |= (dut.main_mem.mem[`GRINDING_NONCE_ADDR] != 64'h0000000000000291);
        err |= (dut.main_mem.mem[`COM_1_ADDR+0] != 64'h698643ecbfeae5e4);
        err |= (dut.main_mem.mem[`COM_1_ADDR+1] != 64'h9236fde6d2fe13d8);
        err |= (dut.main_mem.mem[`COM_1_ADDR+2] != 64'h9ae4bb041d322004);
        err |= (dut.main_mem.mem[`COM_1_ADDR+3] != 64'haaed513866478839);
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5e4cdfacc4af8002);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf10766f0ac58ab5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4e1ac7ff4ecc2a2b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfab1a49835e3eb30);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+0] != 64'h5498c5cea013175d);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+1] != 64'h56e7a121f1e81e8b);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+2] != 64'h2ac198d2d57fffa2);
        err |= (dut.main_mem.mem[`LAST_HASH_ADDR+3] != 64'h6ac4ae0224521dc9);
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
        err |= (dut.main_mem.mem[`COM_2_ADDR+0] != 64'h5e4cdfacc4af8002);
        err |= (dut.main_mem.mem[`COM_2_ADDR+1] != 64'haf10766f0ac58ab5);
        err |= (dut.main_mem.mem[`COM_2_ADDR+2] != 64'h4e1ac7ff4ecc2a2b);
        err |= (dut.main_mem.mem[`COM_2_ADDR+3] != 64'hfab1a49835e3eb30);
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
