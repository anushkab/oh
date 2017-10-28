`timescale 1ns / 1ps


module debounce(
    input clk,
    input push,
    output clock_out
    );
    reg D1,D2,D3;
            always @(posedge clk)
            begin
                D1<=push;
                D2<=D1;
                D3<=D2;
               end
            assign clock_out=D1&&D2&&D3;
        
        
endmodule
