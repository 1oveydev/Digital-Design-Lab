`timescale 1ns / 1ps


module BCDtoDecimal(DECOut, BCDIn);

output [9:0] DECOut;
input [3:0] BCDIn;

assign DECOut = (BCDIn <= 9) ? 10'b0000000001 << BCDIn : 10'b1111111111; 

endmodule
