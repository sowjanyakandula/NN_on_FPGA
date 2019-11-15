`timescale 1ns / 1ps

module Mult_with_cnters(
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
    integer i,j,k,cnt1,cnt2;
    
    always @(posedge clk)
    begin
    if(reset)
    begin
    {A1[0][0],A1[0][1],A1[1][0],A1[1][1]} <= A;
    {B1[0][0],B1[0][1],B1[1][0],B1[1][1]} <= B;
    {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]} <= 32'd0; //initialize to zeros.
    end
    else
    begin
    if(i < 2)
        begin
        Res1[i][j] <= Res1[i][j] + (A1[i][k] * B1[k][j]);
        end
    else
        begin
        {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]} <= Res;
        end
    end
    end
    
    always @(posedge clk)
    begin
    if(reset)
        begin
        i <= 0;
        j <= 0;
        k <= 0;
        cnt1 <= 0;
        cnt2 <= 0;
        end
    else
        begin
        if(k < 1)
            begin
            k <= k+1;
            end
        else
            begin
            k <= 0;
            end
        if(cnt1 < 1)
            begin
            cnt1 <= cnt1 + 1;
            j <= j;
            end
        else
            begin
            cnt1 <= 0;
            if(j < 1)
                begin
                j <= j +1;
                end
            else
                begin
                j <= 0;
                end
            end
        if(cnt2 < 3)
            begin
            cnt2 <= cnt2 + 1;
            i <= i;
            end
        else
            begin
            cnt2 <= 0;
            if(i < 2)
                begin
                i <= i+1;
                end
            else
                begin
                i <= 2;
                end
            end
        end
    end
    
    assign  Res = {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]};
endmodule
