`timescale 1ns / 1ps

module FiniteStateMachine(Y_OUT, CLK, nRST, X_IN);

output reg Y_OUT = 0;
input CLK, nRST, X_IN;

reg [1:0] state = 0;
reg [1:0] next;

always @(state or X_IN)
begin
    case (state)
    0 : if (X_IN)
            next = 1;
        else
            next = 0;
    1 : 
    begin
        repeat(3) @(posedge CLK);
        next = 2;    
    end
    
    2:
    begin
        repeat(2) @(posedge CLK);
        if (X_IN)
            next = 1;
        else
            next = 0;
    end
        
    endcase  
end

always @(posedge CLK)
begin
    if (nRST)
    begin
        state = next;
        
        if (state == 1)
            Y_OUT = 1;
        else
            Y_OUT = 0;
    end
    
    else
        state = 0;
end

endmodule
