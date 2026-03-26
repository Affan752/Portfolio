`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2026 14:46:02
// Design Name: 
// Module Name: fsm_1010_nov_tb
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


module fsm_1010_nov_tb(

    );
    reg clk, rst, d_in;
    wire detected;
    
    fsm_1010_nov dut(clk, rst, d_in, detected);
    
    initial 
        begin
            {clk, rst, d_in} = 0;
        end
        
    
    always #5 clk = ~clk;
    
    initial 
        begin
            rst = 1;
            #10;
            rst = 0;
            d_in = 1'b1;
            #10;
            d_in = 1'b0;
            #10;
            d_in = 1'b1;
            #10;
            d_in = 1'b0;
            end
endmodule
