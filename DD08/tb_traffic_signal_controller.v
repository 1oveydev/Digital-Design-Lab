`timescale 1ns / 1ps

`define TRUE 1'b1
`define FALSE 1'b0

module tb_traffic_signal_controller;

wire [1:0] MAIN_SIG, CNTRY_SIG;
reg CAR_ON_CNTRY_RD, CLOCK, CLEAR;
reg [2:0] Y2RD, R2GD;

traffic_signal_controller tsc (.hwy(MAIN_SIG), .cntry(CNTRY_SIG), 
                              .X(CAR_ON_CNTRY_RD), .clock(CLOCK), .clear(CLEAR), .y2rdelay(Y2RD), .r2gdelay(R2GD));
                              
initial
    $monitor($time, " Main Sig = %b, Country Sig = %b, Car_on_cntry = %b", MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD);
    
initial
begin
    Y2RD = 3'd3;
    R2GD = 3'd2;
end    
    
initial
begin
    CLOCK = `FALSE;
    forever #5 CLOCK = ~CLOCK;
end

initial
begin
    CLEAR = `TRUE;
    repeat (5) @(negedge CLOCK);
    CLEAR = `FALSE;
end

initial
begin
    CAR_ON_CNTRY_RD = `FALSE;
    
    repeat (20) @(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE;
    repeat (10) @(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE;
    
    repeat (20) @(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE;
    repeat (10) @(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE;
    
    repeat (20) @(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE;
    repeat (10) @(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE;
    
    repeat (10) @(negedge CLOCK); $stop;
end

endmodule
