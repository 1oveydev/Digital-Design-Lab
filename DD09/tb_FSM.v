`timescale 1ns / 1ps

module tb_FSM;

wire y_out;
reg clk, reset, x_in;

FiniteStateMachine FSM (.Y_OUT(y_out), .CLK(clk), .nRST(reset), .X_IN(x_in));

initial
    $monitor($time, " CLK : %b, nRST : %b, X_IN : %b, Y_OUT = %b", clk, reset, x_in, y_out);

initial
begin
    clk = 1'b0;
    reset = 1'b0;
    x_in = 1'b0;
end 

always
    #5 clk = ~clk;
    
initial
    #20 reset = 1'b1; 


initial
begin
    #40 x_in = 1'b1;
    #100 x_in = 1'b0;
    #50 x_in = 1'b1;
    #10 x_in = 1'b0;
end

endmodule
