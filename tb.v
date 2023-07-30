`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 04:33:20 PM
// Design Name: 
// Module Name: tb
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


module tb();

parameter clk_period = 10;
reg clk = 0;
always #(clk_period/2) clk = ~clk;

parameter delay_10u = 10000;
reg reset,sa,sb;
wire Ga,Ya,Ra,Gb,Yb,Rb;

top dut(
    .clk(clk),
    .reset(reset),
    .sa(sa),
    .sb(sb),
    .Ga(Ga),
    .Ya(Ya),
    .Ra(Ra),
    .Gb(Gb),
    .Yb(Yb),
    .Rb(Rb)
);

initial begin
    sa = 0;
    sb = 0;
    reset = 0;
    #(clk_period);
    reset = 1;
    
    #(8*delay_10u);
    sa = 1;
    #(delay_10u);
    sb = 1;
    sa = 0;
    #(8*delay_10u);
    sb = 0;
    #(2*delay_10u);
    sb = 1;
    #(8*delay_10u);
    sa = 1;
    #(8*delay_10u);
    
    $finish();
end

endmodule
