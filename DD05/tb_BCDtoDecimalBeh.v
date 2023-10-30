`timescale 1ns / 1ps

module Top;

reg [3:0] bcdin;
wire [9:0] decout;
reg clock, reset;

BCDtoDecimalBeh BtB(.DECOut(decout), .BCDIn(bcdin), .CLK(clock), .nRST(reset));

initial begin
    clock = 1'b0; reset = 1'b0;
    bcdin = 0;
end

initial begin
    #10 reset = 1'b1;
    #160 $finish;
end


always
    #5 clock <= ~clock;
always
    #10 bcdin <= (bcdin >= 15 ? 0 : bcdin + 1);

initial
    $monitor($time, " BCDIn = %2d --> DECOut = %10b", bcdin, decout); 

endmodule
