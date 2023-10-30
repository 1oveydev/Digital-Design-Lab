`timescale 1ns / 1ps

module stimulus;

// 입력
reg [3:0] in0, in1;

// 출력
wire out0, out1, out2;

MyComparatorGate mycg(.A_It_B(out0), .A_gt_B(out1), .A_eq_B(out2), .A(in0), .B(in1));

initial begin
    $monitor($time, " A = %h, B = %h, A_lt_B = %h, A_gt_B = %h, A_eq_B = %h", in0, in1, out0, out1, out2);
end

initial begin
    in0 = 4'h0; in1 = 4'h1;
    
    #10 in0 = 4'hf; in1 = 4'h3;
    
    #10 in0 = 4'ha; in1 = 4'hb;
    
    #10 in0 = 4'h0; in1 = 4'h0;
    
    #10 in0 = 4'h7; in1 = 4'hd;
    
    #10 in0 = 4'h9; in1 = 4'h9;
    
    #10 $finish;
end

endmodule
