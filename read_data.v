`timescale 1ns / 1ps

module read_data(
    input clk,
    input rst,
    output [7:0] dout
    );
    
    reg [9:0] addr;
    reg [7:0] dout;
    always@(posedge clk)
    if(rst == 1'b1)
        addr <= 10'b0000000000;
    else
    begin
        /*blk_mem_gen_0 your_instance_name (
        .clka(clk),    // input wire clka
        .addra(addr),  // input wire [9 : 0] addra
        .douta(dout)  // output wire [7 : 0] douta
        );*/
        addr <= addr + 1'b1;
    end
endmodule
