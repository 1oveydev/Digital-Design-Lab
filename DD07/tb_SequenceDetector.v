`timescale 1ns / 1ps

module tb_SequenceDetector;

wire Y;
reg CLK, nRST, X;

SequenceDetector SeqDect (.Y(Y), .CLK(CLK), .nRST(nRST), .X(X));

initial
begin
    CLK = 1'b0;
    nRST = 1'b0;
    X = 1'b0;
    #200 $finish;
end

always
    #5 CLK <= ~CLK;
    
initial
    #20 nRST = 1'b1; 

initial
begin
    #40 X = 1'b1;
    #30 X = 1'b0;
    #20 X = 1'b1;
    #10 X = 1'b0;
    #20 X = 1'b1;
    #40 X = 1'b0;
end

endmodule
