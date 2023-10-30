`timescale 1ns / 1ps

module MyComparatorBeh(A_lt_B, A_gt_B, A_eq_B, A, B, CLK, nRST);

output reg A_lt_B, A_gt_B, A_eq_B;
input [3:0] A, B;
input CLK, nRST;

initial begin
    A_gt_B = 1'b0;
    A_lt_B = 1'b0;
    A_eq_B = 1'b0;
end
        
always @(posedge CLK)
begin
    if (nRST) begin
        if (A>B)
            begin
                A_gt_B = 1'b1;
                A_lt_B = 1'b0;
                A_eq_B = 1'b0;
            end
        else if (A==B)
           begin
                A_gt_B = 1'b0;
                A_lt_B = 1'b0;
                A_eq_B = 1'b1;
            end
        else
            begin
                A_gt_B = 1'b0;
                A_lt_B = 1'b1;
                A_eq_B = 1'b0;
            end
    end
    
end

endmodule
