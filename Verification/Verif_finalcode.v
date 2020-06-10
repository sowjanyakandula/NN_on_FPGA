`timescale 1ns / 1ps

module Verif_finalcode(

    );
    
   //variable declaration
        reg clk,rst;
        wire [7:0] dout;
        wire [7:0] dummy;
        wire [11:0] wout;
        wire [7:0] dataout;
        wire [11:0] weightout;
        wire [31:0] zread;       
        wire [9:0] sigread;      
        wire [11:0] newwout;
        wire [15:0] index1, index2;
        integer f,i,g,h,j,k;
        integer x = 0;                                          //for keeping track of z read
        integer y = 0;                                          //for keeping track of back prop read
        /*----------------*/
        
        final_code dut( .clk(clk), .rst(rst), .index1(index1), .index2(index2), .dout(dout), .dummy(dummy), .wout(wout), .dataout(dataout), .weightout(weightout), .zread(zread), .sigread(sigread), .newwout(newwout));
           
    always #10 clk = ~clk;   
       
     initial
       begin
       f = $fopen("verifresults/invec_read.txt","w");
       g = $fopen("verifresults/weight_read.txt","w");
       h = $fopen("verifresults/z_read.txt","w");
       j = $fopen("verifresults/sigout_read.txt","w");
       k = $fopen("verifresults/updatedweight_read.txt","w");
       clk=1'b0;
       rst=1'b1;
       //#5;
       //rst=1'b0;
          for(i=0;i<=94125;i=i+1)
        begin
            @(posedge clk);
            //$fwrite(f,"%b,\n", wout);
            if(i < 5)
                begin
                if(i == 4)
                    begin
                    rst = 1'b0;
                    end
                end
            
            if((i >= 5) && (i < 31365))                               //invec and weight read
                begin
                $fwrite(f, "%b,\n", dout);
                if(i < 789)
                    begin
                    $fwrite(g, "%b,\n", wout);
                    end
                end
            
            if((i >= 31365)&& (i < 62725))
                begin
                x = x + 1;
                if(x == 784)
                    begin
                    x = 0;
                    $fwrite(h, "%b,\n", zread);
                    end
                end
               
            if((i >= 62725) && (i < 62765))
                begin
                $fwrite(j, "%b,\n", sigread);
                end
                
            if(i >= 62765)
                begin
                y = y + 1;
                if(y == 40)
                    begin
                    y = 0;
                    $fwrite(k, "%b,\n", newwout);
                    end
                end
        end
       $fclose(f); 
       $fclose(g);
       $fclose(h);
       $fclose(j);
       $fclose(k); 
       $finish;
       end
endmodule
