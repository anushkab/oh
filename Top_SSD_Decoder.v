`timescale 1ns / 1ps
//////////////////////////////////////////////_SSD_Decoder
//////////////////////////////////////////////////////////////////////////////////


module Top_SSD_Decoder(
    input clock_in,
    inout [3:0] Row,
    inout [3:0] Col,
    output [3:0] De,
    output [7:0] LED_PMOD
    );
    wire [3:0] units,tens,hundreds;
    wire [7:0] binarynum;
    wire [6:0] output_cathode;
    topDecoder dd(clock_in, Row,Col, De);
    assign binarynum=De;
    bcd b(binarynum, units, tens, hundreds    );
 sevenseg_PMOD p(clock_in,units, tens, anode,output_cathode       );
 assign LED_PMOD={anode,output_cathode};
endmodule
