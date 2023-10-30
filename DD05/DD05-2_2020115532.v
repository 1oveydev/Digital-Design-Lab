`timescale 1ns / 1ps

module BCDtoDecimalBeh(DECOut, BCDIn, CLK, nRST);

output reg [9:0] DECOut;
input [3:0] BCDIn;
input CLK, nRST;

initial begin
    DECOut = 10'b0000000000;
end

always @(posedge CLK) 
begin
    if (nRST) begin
        DECOut = (BCDIn < 10) ? 2**BCDIn : 10'b0000000000;
    end
end

endmodule
