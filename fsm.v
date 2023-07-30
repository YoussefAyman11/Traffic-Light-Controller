`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 03:46:06 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk,
    input reset,
    input sa,
    input sb,
    input timer_done,
    output reg [12:0] timer_value,
    output reg Ga,
    output reg Ya,
    output reg Ra,
    output reg Gb,
    output reg Yb,
    output reg Rb,
    output reg timer_reset
    );
    
    parameter [3:0] s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4,
                    s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9;
    
    reg [3:0] state_reg,state_next;
    
    always @(posedge clk,negedge reset) begin
        if(!reset)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end 
    
    always @(*) begin
        timer_value = 'bx;
        state_next = state_reg;
        case(state_reg)
            s0: begin
                timer_value = 5998;
                state_next = s1;
            end
            
            s1: begin
                timer_value = 5998;
                if(!timer_done)
                    state_next = s1;
                else if(timer_done & sb)
                    state_next = s2;
                else if(timer_done & !sb) begin
                    state_next = s6;
                end
            end
            
            s2: begin
                timer_value = 498;
                state_next = s3;
            end
            
            s3: begin
                timer_value = 498;
                if(!timer_done)
                    state_next = s3;
                else
                    state_next = s4;
            end
            
            s4: begin
                timer_value = 4998;
                state_next = s5;
            end
            
            s5: begin
                timer_value = 4998;
                if(!timer_done)
                    state_next = s5;
                else if(timer_done & (sa | !sb))
                    state_next = s8;
                else if(timer_done & sb & !sa) begin
                    state_next = s7;
                end
            end
            
            s6: begin
                timer_value = 998;
                state_next = s1;
            end
            
            s7: begin
                timer_value = 998;
                state_next = s5;
            end
            
            s8: begin
                timer_value = 498;
                state_next = s9;
            end
            
            s9: begin
                timer_value = 498;
                if(!timer_done)
                    state_next = s9;
                else
                    state_next = s0;
            end
            
            default: begin
                state_next = state_reg;
                timer_value = 'bx;
            end 
        endcase
    end 
    
    always @(*) begin
        Ga = 0;
        Ya = 0;
        Ra = 0;
        Gb = 0;
        Yb = 0;
        Rb = 0;
        timer_reset = 0;
        case(state_reg)
            s0: begin
                Ga = 1;
                Rb = 1;
            end
            s1: begin
                Ga = 1;
                Rb = 1;
                timer_reset = 1;
            end
            s2: begin
                Ya = 1;
                Rb = 1;
            end    
            s3: begin
                Ya = 1;
                Rb = 1;
                timer_reset = 1;
            end
            s4: begin
                Gb = 1;
                Ra = 1;
            end
            s5: begin
                Gb = 1;
                Ra = 1;
                timer_reset = 1;
            end
            s6: begin
                Ga = 1;
                Rb = 1;
            end
            s7: begin
                Ya = 1;
                Rb = 1;
            end 
            s8: begin
                Yb = 1;
                Ra = 1;
            end
            s9: begin
                Yb = 1;
                Ra = 1;
                timer_reset = 1;
            end
        endcase
    end
    
//    assign Ga = (state_reg == s0 | state_reg == s1 | state_reg == s6);
//    assign Ya = (state_reg == s2 | state_reg == s3);
//    assign Ra = ~(Ga | Ya);
//    assign Gb = (state_reg == s4 | state_reg == s5 | state_reg == s7);
//    assign Yb = (state_reg == s8 | state_reg == s9);
//    assign Rb = ~(Gb | Yb);
//    assign timer_reset = (state_reg == s1 | state_reg == s3 | state_reg == s5 | state_reg == s9);  
    
endmodule
