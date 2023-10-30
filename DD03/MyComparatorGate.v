`timescale 1ns / 1ps

module MyComparatorGate(A_It_B, A_gt_B, A_eq_B, A, B);

// 입출력 포트 선언
output A_It_B, A_gt_B, A_eq_B;
input [3:0] A, B;

// 내부
wire [7:0] x;
wire [3:0] y;
wire [5:0] z;

and (x[7], ~A[3], B[3]);
and (x[6], A[3], ~B[3]);
and (x[5], ~A[2], B[2]);
and (x[4], A[2], ~B[2]);
and (x[3], ~A[1], B[1]);
and (x[2], A[1], ~B[1]);
and (x[1], ~A[0], B[0]);
and (x[0], A[0], ~B[0]);


nor (y[3], x[6], x[7]);
nor (y[2], x[4], x[5]);
nor (y[1], x[2], x[3]);
nor (y[0], x[0], x[1]);


and (z[5], y[3], x[5]);
and (z[4], y[3], x[4]);
and (z[3], y[3], y[2], x[3]);
and (z[2], y[3], y[2], x[2]);
and (z[1], y[3], y[2], y[1], x[1]);
and (z[0], y[3], y[2], y[1], x[0]);
and (A_eq_B, y[3], y[2], y[1], y[0]);

or (A_It_B, x[7], z[5], z[3], z[1]);
or (A_gt_B, x[6], z[4], z[2], z[0]);
 
endmodule
