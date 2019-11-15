`timescale 1ns / 1ps

module ReLu(
    input [31:0] in,
    output reg [31:0] out
    );
    
    always @(in)
    begin
    if(in[31] == 1'b0)
        out = in;
    else
        out = {32{1'b0}};
    end
endmodule
