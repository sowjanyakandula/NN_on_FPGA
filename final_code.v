`timescale 1ns / 1ps

    module final_code(
    input clk,
    input rst,
    output [7:0] dout
    );
    wire clk1;
    reg en1;                                                   // enable for invec reading
    reg [9:0] addr_q;                                          // row of invec
    wire [9:0] addr_d;
    reg [14:0] finaladdr_q;                                    // addr to BROM IP
    wire [14:0] finaladdr_d;
    reg [7:0] dout;                                            // data out from BROM IP 
    wire [7:0] dout;
    reg [6:0] j_q;                                             // col of invec
    wire [6:0] j_d;
    reg [7:0] invec [0:783][0:39];
     
    assign clk1 = clk & en1;
    assign finaladdr_d = j_q * 784 + addr_q;
    assign addr_d = (addr_q == 783)? 0 : (addr_q + 1);
    assign j_d = (addr_q == 783)? (j_q + 1) : (j_q);
    
    /*
    always @( * )
    begin
        assign finaladdr_d = j_q * 784 + addr_q;
        if(addr_q == 783)
            begin
            addr_d = 0;
            j_d = j_q + 1;
            end
        else
            begin
            addr_d = addr_q + 1;
            j_d = j_q;
            end
    end   
    */
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            begin
            addr_q <= 0;
            j_q <= 0;
            finaladdr_q <= 0;
            en1 <= 1;
            end
        else
            begin
            invec[addr_q][j_q] <= dout;
            finaladdr_q <= finaladdr_d;
            addr_q <= addr_d;
            j_q <= j_d;
            end
    end
    
    blk_mem_gen_1 your_instance_name (
          .clka(clk1),                      // input wire clka
          .addra(finaladdr_q),              // input wire [14 : 0] addra
          .douta(dout)                      // output wire [7 : 0] douta
        );

endmodule
