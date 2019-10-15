`timescale 1ns / 1ps

module multiplication_blk(
    input [31:0] a,
    input [31:0] b,
    output [31:0] out
    );
    wire [61:0] result;
    wire sign;
    assign result  = a[30:0] * b[30:0];
    assign sign = a[31] ^ b[31];
    assign out = {sign, result[46:16]};
endmodule
