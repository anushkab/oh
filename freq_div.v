`timescale 1ns / 1ps


module freq_div(
    input clock_in,
    output clock_out
    );
    parameter width=26;
    reg [width-1:0] count;
    always @(posedge clock_in)
    begin
        count<=count+1;
    end
    assign clock_out=count[19];
endmodule
