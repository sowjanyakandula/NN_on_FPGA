`timescale 1ns / 1ps

module Verif_fc(

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
    integer ind1 = 0;
    integer ind2 = 0;
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
       rst=1'b0;
          for(i=0;i<=94125;i=i+1)
        begin
            @(posedge clk);
        end
        //assign index1 = (i == 94126)? ((ind1 >= 783)? (0) : (ind1 + 1) ) : (1000);
        //assign index2 = (i == 94126)? ((ind1 >= 783)? (ind2 + 1) : (ind2) ) : (1000);
        begin
             @(posedge clk)
            
            if(i >= 94126)
            begin
                ind1 <= index1;
                ind2 <= index2;
                if(index2 < 40)
                    begin
                    $fwrite(f, "%b,\n", dataout);
                    end
                if(index2 < 1)
                    begin
                    $fwrite(k, "%b,\n", newwout);
                    end
                if(index1 < 40)
                    begin
                    $fwrite(h, "%b,\n", zread);
                    $fwrite(j, "%b,\n", sigread);
                    end
            end
        end
       $fclose(f); 
       $fclose(g);
       $fclose(h);
       $fclose(j);
       $fclose(k); 
       //$finish;
       end
       assign index1 = (i == 94126)? ((ind1 >= 783)? (0) : (ind1 + 1) ) : (1000);
                      assign index2 = (i == 94126)? ((ind1 >= 783)? (ind2 + 1) : (ind2) ) : (1000);
endmodule
