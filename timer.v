`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 03:40:36 PM
// Design Name: 
// Module Name: timer
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


module timer(
    input clk,
    input reset,
    input [12:0] final_value,
    output timer_done
    );
    
    reg [12:0] Q_reg,Q_next;
    
    always @(posedge clk,negedge reset) begin
        if(!reset)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;
    end
    
    always @(*) begin
        Q_next = timer_done?('b0):(Q_reg + 1);
    end
    
    assign timer_done = (Q_reg == final_value);
    
endmodule
