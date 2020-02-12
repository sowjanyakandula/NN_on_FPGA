`timescale 1ns / 1ps

module final_code_tb();
   reg clk,rst;
   wire [7:0] dout;
   integer f,i;

  
 final_code dut( .clk(clk), .rst(rst), .dout(dout));
   
always #10 clk = ~clk;   
   
 initial
   begin
   f = $fopen("output.txt","w");
   clk=1'b0;
   rst=1'b1;
   #5;
   rst=1'b0;
      for(i=0;i<=31359;i=i+1)
    begin
        @(posedge clk);
        $fwrite(f,"%b\n", dout);
      end
   $fclose(f);  
   $finish;
   end
   
   
 
   
endmodule
