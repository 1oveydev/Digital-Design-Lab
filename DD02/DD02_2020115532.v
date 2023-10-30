module D_latch(Q, Qbar, D, En);

// 포트 선언
// 모듈 내에서 Input 포트를 선언할 때는 wire , Output 포트를 선언할 때는 reg 혹은 wire
output Q, Qbar;
input D, En;
wire S,R;

nand n1(S, D, En);
nand n2(R, En, ~D);
nand n3(Q, S, Qbar);
nand n4(Qbar, Q, R);

endmodule


