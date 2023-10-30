module Top;

// 내부의 출력을 받아오는 외부 포트는 반드시 wire
wire q, qbar;
reg d, en;

D_latch d1(.Q(q), .Qbar(qbar), .D(d), .En(en));

// 단위 시간 0에 d를 초기화
initial
    d = 1'b0;

// 매 1/2 주기마다 토글 ( T = 10 )
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
