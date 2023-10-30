`timescale 1ns / 1ps
module top;

reg [3:0] a, b;
reg clock, reset;
wire a_lt_b, a_gt_b, a_eq_b;

MyComparatorBeh mcb(.A_lt_B(a_lt_b), .A_gt_B(a_gt_b), .A_eq_B(a_eq_b), .A(a), .B(b), .CLK(clock), .nRST(reset));

initial begin
    $monitor($time, " A = %h, B = %h, A_lt_B = %b, A_gt_B = %b, A_eq_B = %b", a, b, a_lt_b, a_gt_b, a_eq_b);
end

initial begin
    a = 4'h0; b = 4'h1; clock = 1'b0;
    #10 reset = 1'b1;
end

always begin
    #5 clock = ~clock;
end

initial begin
   #10 a = 4'hf;  b = 4'h3;
   
   #10 a = 4'ha; b = 4'hb;
   
   #10 a = 4'h0; b = 4'h0;
   
   #10 a = 4'h7; b = 4'hd;
   
   #10 a = 4'h9; b = 4'h9;
   
   #10 $finish;
end

endmodule
