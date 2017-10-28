`timescale 1ns / 1ps
module ultimate(
input clock_in,
input push,
input clr,
inout [3:0] Row,
inout [3:0] Col,
output [3:0] De,
output [3:0] unit,
output [3:0] ten,
output [7:0] LED_PMOD
    );
    wire [3:0] LED_in;
   
     topDecoder tdlr(   clock_in,       Row,Col,LED_in    );
           
    DSP_four_ssd oo( clock_in, push, clr,LED_in,unit,led, LED_PMOD
       );
        
endmodule
