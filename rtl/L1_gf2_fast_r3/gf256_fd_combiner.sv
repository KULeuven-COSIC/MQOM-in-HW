/*
 * gf256_fd_combiner.sv
 * -------------------------
 * Gate-level GF(2^8) combiner for:
 *
 *   u0 = fd0
 *      ^ (x^1 * fd1)
 *      ^ (x^2 * fd2)
 *      ^ (x^3 * fd3)
 *      ^ (x^4 * fd4)
 *      ^ (x^5 * fd5)
 *      ^ (x^6 * fd6)
 *      ^ (x^7 * fd7)
 *
 * Field polynomial: x^8 + x^4 + x^3 + x + 1 = 0x11B
 */

`default_nettype none

module gf256_mul_by_01 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    assign p = b;
endmodule


module gf256_mul_by_02 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    wire r0, r1, r2, r3, r4, r5, r6, r7;

    assign r0 = b[7];
    assign r1 = b[0] ^ b[7];
    assign r2 = b[1];
    assign r3 = b[2] ^ b[7];
    assign r4 = b[3] ^ b[7];
    assign r5 = b[4];
    assign r6 = b[5];
    assign r7 = b[6];

    assign p = {r7, r6, r5, r4, r3, r2, r1, r0};
endmodule


module gf256_mul_by_04 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    wire r0, r1, r2, r3, r4, r5, r6, r7;

    assign r0 = b[6];
    assign r1 = b[6] ^ b[7];
    assign r2 = b[0] ^ b[7];
    assign r3 = b[1] ^ b[6];
    assign r4 = b[2] ^ b[6] ^ b[7];
    assign r5 = b[3] ^ b[7];
    assign r6 = b[4];
    assign r7 = b[5];

    assign p = {r7, r6, r5, r4, r3, r2, r1, r0};
endmodule


module gf256_mul_by_08 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    wire r0, r1, r2, r3, r4, r5, r6, r7;

    assign r0 = b[5];
    assign r1 = b[5] ^ b[6];
    assign r2 = b[6] ^ b[7];
    assign r3 = b[0] ^ b[5] ^ b[7];
    assign r4 = b[1] ^ b[5] ^ b[6];
    assign r5 = b[2] ^ b[6] ^ b[7];
    assign r6 = b[3] ^ b[7];
    assign r7 = b[4];

    assign p = {r7, r6, r5, r4, r3, r2, r1, r0};
endmodule


module gf256_mul_by_10 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    wire r0, r1, r2, r3, r4, r5, r6, r7;

    assign r0 = b[4];
    assign r1 = b[4] ^ b[5];
    assign r2 = b[5] ^ b[6];
    assign r3 = b[4] ^ b[6] ^ b[7];
    assign r4 = b[0] ^ b[4] ^ b[5] ^ b[7];
    assign r5 = b[1] ^ b[5] ^ b[6];
    assign r6 = b[2] ^ b[6] ^ b[7];
    assign r7 = b[3] ^ b[7];

    assign p = {r7, r6, r5, r4, r3, r2, r1, r0};
endmodule


module gf256_mul_by_20 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    wire r0, r1, r2, r3, r4, r5, r6, r7;

    assign r0 = b[3] ^ b[7];
    assign r1 = b[3] ^ b[4] ^ b[7];
    assign r2 = b[4] ^ b[5];
    assign r3 = b[3] ^ b[5] ^ b[6] ^ b[7];
    assign r4 = b[3] ^ b[4] ^ b[6];
    assign r5 = b[0] ^ b[4] ^ b[5] ^ b[7];
    assign r6 = b[1] ^ b[5] ^ b[6];
    assign r7 = b[2] ^ b[6] ^ b[7];

    assign p = {r7, r6, r5, r4, r3, r2, r1, r0};
endmodule


module gf256_mul_by_40 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    wire r0, r1, r2, r3, r4, r5, r6, r7;

    assign r0 = b[2] ^ b[6] ^ b[7];
    assign r1 = b[2] ^ b[3] ^ b[6];
    assign r2 = b[3] ^ b[4] ^ b[7];
    assign r3 = b[2] ^ b[4] ^ b[5] ^ b[6] ^ b[7];
    assign r4 = b[2] ^ b[3] ^ b[5];
    assign r5 = b[3] ^ b[4] ^ b[6];
    assign r6 = b[0] ^ b[4] ^ b[5] ^ b[7];
    assign r7 = b[1] ^ b[5] ^ b[6];

    assign p = {r7, r6, r5, r4, r3, r2, r1, r0};
endmodule


module gf256_mul_by_80 (
    input  wire [7:0] b,
    output wire [7:0] p
);
    wire r0, r1, r2, r3, r4, r5, r6, r7;

    assign r0 = b[1] ^ b[5] ^ b[6];
    assign r1 = b[1] ^ b[2] ^ b[5] ^ b[7];
    assign r2 = b[2] ^ b[3] ^ b[6];
    assign r3 = b[1] ^ b[3] ^ b[4] ^ b[5] ^ b[6] ^ b[7];
    assign r4 = b[1] ^ b[2] ^ b[4] ^ b[7];
    assign r5 = b[2] ^ b[3] ^ b[5];
    assign r6 = b[3] ^ b[4] ^ b[6];
    assign r7 = b[0] ^ b[4] ^ b[5] ^ b[7];

    assign p = {r7, r6, r5, r4, r3, r2, r1, r0};
endmodule


module gf256_fd_combiner (
    input  wire [7:0] fd0,
    input  wire [7:0] fd1,
    input  wire [7:0] fd2,
    input  wire [7:0] fd3,
    input  wire [7:0] fd4,
    input  wire [7:0] fd5,
    input  wire [7:0] fd6,
    input  wire [7:0] fd7,
    output wire [7:0] u0_elem
);

    wire [7:0] p0;
    wire [7:0] p1;
    wire [7:0] p2;
    wire [7:0] p3;
    wire [7:0] p4;
    wire [7:0] p5;
    wire [7:0] p6;
    wire [7:0] p7;

    gf256_mul_by_01 u_mul_01 (.b(fd0), .p(p0));
    gf256_mul_by_02 u_mul_02 (.b(fd1), .p(p1));
    gf256_mul_by_04 u_mul_04 (.b(fd2), .p(p2));
    gf256_mul_by_08 u_mul_08 (.b(fd3), .p(p3));
    gf256_mul_by_10 u_mul_10 (.b(fd4), .p(p4));
    gf256_mul_by_20 u_mul_20 (.b(fd5), .p(p5));
    gf256_mul_by_40 u_mul_40 (.b(fd6), .p(p6));
    gf256_mul_by_80 u_mul_80 (.b(fd7), .p(p7));

    assign u0_elem = p0 ^ p1 ^ p2 ^ p3 ^ p4 ^ p5 ^ p6 ^ p7;

endmodule

`default_nettype wire