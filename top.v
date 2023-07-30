`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 04:28:03 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input reset,
    input sa,
    input sb,
    output Ga,
    output Ya,
    output Ra,
    output Gb,
    output Yb,
    output Rb
    );
    
    wire timer_done_sig,timer_reset_sig;
    wire [12:0] timer_value_sig;
    
    timer t1(
        .clk(clk),
        .reset(timer_reset_sig),
        .final_value(timer_value_sig),
        .timer_done(timer_done_sig)
    );
    
    fsm f1(
        .clk(clk),
        .reset(reset),
        .sa(sa),
        .sb(sb),
        .timer_done(timer_done_sig),
        .timer_value(timer_value_sig),
        .Ga(Ga),
        .Ya(Ya),
        .Ra(Ra),
        .Gb(Gb),
        .Yb(Yb),
        .Rb(Rb),
        .timer_reset(timer_reset_sig)
    );
    
endmodule
