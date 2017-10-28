`timescale 1ns / 1ps


module sevenseg_PMOD(
input clock_in,
    input [3:0] ones,
    input [3:0] tens,
    output anode,
    output [6:0] output_cathode
    );
    reg [6:0] sseg_temp;
    reg [17:0] count;
     always @(posedge clock_in)
       begin
       count<=count+1;
       end
       
       reg [6:0] sseg=4'b1110;
reg  an_temp;     

           always @(*)
           begin  
       case(count[17]) 
          1'b0 :  
           begin
            sseg = ones;
            an_temp = 1'b0;
           end
          1'b1 :  
           begin
            sseg = tens;
            an_temp = 1'b1;
           end
           
          
         endcase
        end
     assign anode =an_temp;
     
      
    always @(*)
    begin
     case(sseg)
        4'd0 :sseg_temp =7'b0000001;
        4'd1 :sseg_temp =7'b1001111;
        4'd2: sseg_temp = 7'b0010010;
        4'd3 : sseg_temp= 7'b0000110;
        4'd4 : sseg_temp= 7'b1001100;
       4'd5: sseg_temp = 7'b0100100;
        4'd6 : sseg_temp= 7'b0100000;
        4'd7 : sseg_temp= 7'b0001111;
        4'd8 : sseg_temp= 7'b0000000;
       4'd9 : sseg_temp= 7'b0000100;

        default : sseg_temp =7'b1111110;             
         endcase
         end
         assign output_cathode=~sseg_temp  ;
                              
                        
endmodule
