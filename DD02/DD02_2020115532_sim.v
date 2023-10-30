module Top;

// ������ ����� �޾ƿ��� �ܺ� ��Ʈ�� �ݵ�� wire
wire q, qbar;
reg d, en;

D_latch d1(.Q(q), .Qbar(qbar), .D(d), .En(en));

// ���� �ð� 0�� d�� �ʱ�ȭ
initial
    d = 1'b0;

// �� 1/2 �ֱ⸶�� ��� ( T = 10 )
always
    #5 d = ~d;

initial begin
    en = 1'b0;
    #12 en = ~en;
    #15 en = ~en;
    #8 $finish;
end
    
initial
    $monitor($time, " D = %b, En = %b, Q = %b, Qbar = %b", d, en, q, qbar);

endmodule
