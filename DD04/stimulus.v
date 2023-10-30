`timescale 1ns / 1ps

module Top;

reg [3:0] BCDIn;
wire [9:0] DECOut;

BCDtoDecimal btd(.DECOut(DECOut), .BCDIn(BCDIn));

initial begin
    $monitor($time, " BCDIn = %d --> DECOut = %b", BCDIn, DECOut);
end

initial begin
    BCDIn = 4'b0000;
    #170 $finish;
end

always begin
    #10 BCDIn = BCDIn + 4'b0001;
end


endmodule
