`timescale 1ns / 1ps

module SequenceDetector(Y, CLK, nRST, X);

output reg Y;
input CLK, nRST, X;
reg [1:0] state, next_state;

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

initial
begin
    Y = 0;
    state = 2'b00;
end

always @(posedge CLK)
begin
    if (nRST == 0)
        state = s0;
    else
    begin
        state = next_state;
        
        if (state == s3)
            Y = 1'b1;
        else
            Y = 1'b0;
    end
end

always @(state or X)
begin
    case (state)
        s0 : if(X)
            next_state = s1;
            else
            next_state = s0;
        s1 : if(X)
            next_state = s2;
            else
            next_state = s0;
        s2 : if(X)
            next_state = s3;
            else
            next_state = s0;
        s3 : if(X)
            next_state = s3;
            else
            next_state = s0;
        default:
            next_state = s0;   
    endcase
end

endmodule
