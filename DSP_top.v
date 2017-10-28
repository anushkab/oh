`timescale 1ns / 1ps

module DSP_top(
        input [3:0] LED_in,
        input clock_pulse,
        input clr_de,

        
        output [7:0] outhai
    
    );

        wire [1:0] weight;
            assign weight = 2'b01; 

    wire [6:0] dout_dsp1;
    wire [7:0] dout_dsp2,dout_dsp3;
        reg [4:0] din_dsp2,din_dsp3,din_dsp1; //reg - wire

   always @( posedge clock_pulse or posedge clr_de)
     begin
         if (clr_de == 1)
         begin
             din_dsp2 <= 5'b00000;
             din_dsp3 <= 5'b00000;    
         end
         else 
         begin
         din_dsp1<={1'b0,LED_in};
             din_dsp2 <= din_dsp1;
             din_dsp3 <= din_dsp2;
         end    
     end   
  
    xbip_dsp48_macro_0 dsp0(.A({din_dsp1}),.B(weight),.P(dout_dsp1));
        
        xbip_dsp48_macro_1 dsp1(.A(din_dsp2),.B(weight),.C(dout_dsp1),.P(dout_dsp2));
        xbip_dsp48_macro_1 dsp2(.A(din_dsp3),.B(weight),.C(dout_dsp2[6:0]),.P(dout_dsp3));
        
    assign outhai=dout_dsp3;
endmodule
