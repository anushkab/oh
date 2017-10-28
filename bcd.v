`timescale 1ns / 1ps


module bcd(
    input [7:0] binarynum,
    output reg [3:0] units,
    output  reg [3:0] tens,
    output  reg [3:0] hundreds
    );
    reg [19:0] shift;
    integer a;

    always @(binarynum)
    begin
    shift[7:0]= binarynum;
    shift[19:8]=0;
    for(a=0;a<8;a=a+1)
    begin
         if(shift[11:8] >=5)
            shift[11:8]=shift[11:8] +3;
          if(shift[15:12] >= 5)
            shift[15:12] =shift[15:12] +3;
          if(shift[19:16] >= 5)
               shift[19:16] =shift[19:16] +3;
          
         shift=shift<<1;
    end
     hundreds=shift[19:16];
        tens=shift[15:12];
        units=shift[11:8];
    end
    
    
    
    
endmodule
