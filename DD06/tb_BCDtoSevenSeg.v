`timescale 1ns / 1ps

module top;

wire a,b,c,d,e,f,g;
reg [3:0] bcdin;

BCDtoSevenSeg bts (a,b,c,d,e,f,g,bcdin);

initial
    $monitor($time, " BCDIn = %d --> a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", bcdin, a, b, c, d, e, f, g);
    
initial
begin
    bcdin = 0;
    #160 $finish;
end
    
always
begin
    #10 bcdin = bcdin + 1;
end


endmodule
