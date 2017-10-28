`timescale 1ns / 1ps

module DSP_four_ssd(
input clock_in,
input push,
input clr,
input [3:0] LED_in,
output [3:0] unit,
output [3:0] ten,
output [7:0] LED_PMOD
    );
    
 wire [3:0] units,tens,hundreds;
       freq_div o(clock_in,clock_190);
       clock_pulse se(push,clock_190,clr,out);
       wire [6:0] output_cathode;
       debounce d(clock_190,clr,clr_de);
       wire [7:0] lol;
       wire [3:0] De;
           assign De=LED_in;
        DSP_top p(De,out,clr_de,lol);
        assign unit=units;
assign ten=tens;
         bcd b(lol, units,tens,hundreds    );
          
    
          sevenseg_PMOD ppo(clock_in,units, tens, anode,output_cathode       );
          assign LED_PMOD={anode,output_cathode};
    
endmodule
