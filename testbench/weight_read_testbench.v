`timescale 1ns / 1ps

module weight_read_testbench();
   reg clk,rst;
   wire [7:0] dout;
   wire [7:0] dummy;
   wire [11:0] wout;
   integer f,i;

  
 final_code dut( .clk(clk), .rst(rst), .dout(dout), .dummy(dummy), .wout(wout));
   
always #10 clk = ~clk;   
   
 initial
   begin
   f = $fopen("output.txt","w");
   clk=1'b0;
   rst=1'b1;
   #5;
   rst=1'b0;
      for(i=0;i<=1000;i=i+1)
    begin
        @(posedge clk);
        $fwrite(f,"%b,\n", wout);
      end
   $fclose(f);  
   $finish;
   end
   
   
 
   
endmodule