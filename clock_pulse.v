`timescale 1ns / 1ps
//code courtesy : ELD Lecture Slides
module clock_pulse(
input wire inp,
input wire cclk,
input wire clr,
output wire outp);
reg delay1;
reg delay2;
reg delay3;
always@(posedge cclk or posedge clr)
begin
if(clr == 1)
        begin
        delay1 <= 1'b0;
        delay2 <= 1'b0;
        delay3 <= 1'b0;
        end
            else
        begin
        delay1 <= inp;
        delay2 <= delay1;
        delay3 <= delay2;
        end
        end
assign outp = delay1 & delay2 & delay3;
endmodule
