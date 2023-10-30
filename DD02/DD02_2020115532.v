module D_latch(Q, Qbar, D, En);

// ��Ʈ ����
// ��� ������ Input ��Ʈ�� ������ ���� wire , Output ��Ʈ�� ������ ���� reg Ȥ�� wire
output Q, Qbar;
input D, En;
wire S,R;

nand n1(S, D, En);
nand n2(R, En, ~D);
nand n3(Q, S, Qbar);
nand n4(Qbar, Q, R);

endmodule


