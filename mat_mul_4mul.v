`timescale 1ns / 1ps



module mat_mul_4mul(
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
    integer k;
    
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
        if(k < 2)
            begin
            Res1[0][0] <= Res1[0][0] + (A1[0][k] * B1[k][0]);
            Res1[0][1] <= Res1[0][1] + (A1[0][k] * B1[k][1]);
            Res1[1][0] <= Res1[1][0] + (A1[1][k] * B1[k][0]);
            Res1[1][1] <= Res1[1][1] + (A1[1][k] * B1[k][1]);
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
            k <= 0;
            end
        else
            begin
            if(k < 1)
                begin
                k <= k+1;
                end
            else
                begin
                k <= 2;
                end
            end
        end
        
        assign  Res = {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]};
endmodule
