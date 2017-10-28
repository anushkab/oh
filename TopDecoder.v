`timescale 1ns / 1ps
module topDecoder(
 input clock_in,						// 100MHz onboard clock
      inout [3:0] Row,
      inout [3:0] Col,
     output [3:0] DecodeOut    // Output data

    );
 
    Decoder deco(clock_in,Row,Col,DecodeOut);
    
    
endmodule
