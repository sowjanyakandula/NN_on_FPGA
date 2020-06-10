`timescale 1ns / 1ps

module mat_mul_using_clk(
    input [31:0] A,
    input [31:0] B,
    input reset,
    output [31:0] Res,
    input clk
    );
    //internal variables    
    reg [7:0] A1 [0:1][0:1];
    reg [7:0] B1 [0:1][0:1];
    reg [7:0] Res1 [0:1][0:1]; 
    integer i,j,k;
    
    always @(posedge clk)
    begin
    if(reset)begin
    {A1[0][0],A1[0][1],A1[1][0],A1[1][1]} <= A;
    {B1[0][0],B1[0][1],B1[1][0],B1[1][1]} <= B;
    i <= 0;
    j <= 0;
    k <= 0;
    {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]} <= 32'd0; //initialize to zeros.
    end
    else
    begin
    if(i < 2)
    begin
    Res1[i][j] = Res1[i][j] + (A1[i][k] * B1[k][j]);
    k = k+1;
    if(k == 2)
    begin
        k  = 0;
        j = j+1;
    end
    if(j == 2)
    begin
        j = 0;
        i = i+1;
    end
    end
    end
    end
    
    assign  Res = {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]};
endmodule
