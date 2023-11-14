`timescale 1ns / 1ps

`define TRUE 1'b1
`define FALSE 1'b0

// `define Y2RDELAY 3
// `define R2GDELAY 2

module traffic_signal_controller(hwy, cntry, X, clock, clear, y2rdelay, r2gdelay);

output reg [1:0] hwy, cntry;
input X, clock, clear;
input [2:0] y2rdelay, r2gdelay;

reg [2:0] y2rcounter, r2gcounter;

parameter RED = 2'd0,
          YELLOW = 2'd1,
          GREEN = 2'd2;
          
parameter S0 = 3'd0,
          S1 = 3'd1,
          S2 = 3'd2,
          S3 = 3'd3,
          S4 = 3'd4;
          
reg [2:0] state, next_state;

initial
begin
    y2rcounter = 3'b0;
    r2gcounter = 3'b0;
end

always @(posedge clock)
begin
    if (clear)
        state = S0;
    else
    begin
        state = next_state;
        
        if (state == S2)
            y2rcounter = 0;
            
        else if (state == S0)
            y2rcounter = 0;
            
        else if (state == S3)
            r2gcounter = 0;
    end
end

always @(state)
begin
    hwy = GREEN;
    cntry = RED;
    
    case(state)
        S0: ;
        S1: hwy = YELLOW;
        S2: hwy = RED;
        S3: begin
                hwy = RED;
                cntry = GREEN;
            end
        S4: begin
                hwy = RED;
                cntry = YELLOW;
            end
    endcase
end

always @(state or X)
begin
    case(state)
        S0: if(X)
                next_state = S1;
            else
                next_state = S0;
                
        S1: begin
                // NOT USE REPEAT    
                while (y2rcounter != y2rdelay) @(posedge clock)
                    begin
                        y2rcounter = y2rcounter + 1;
                    end
                
                next_state = S2; 
                
            end
            
        S2: begin
                // NOT USE REPEAT      
                while (r2gcounter != r2gdelay) @(posedge clock)
                    begin
                        r2gcounter = r2gcounter + 1;
                    end
                
                next_state = S3; 
            end
            
        S3: if(X)
                next_state = S3;
            else
                next_state = S4;
                
        S4: begin
                // NOT USE REPEAT
                while (y2rcounter != y2rdelay) @(posedge clock)
                    begin
                        y2rcounter = y2rcounter + 1;
                    end
                
                next_state = S0; 
            end
            
        default : next_state = S0;
    endcase
end


endmodule
