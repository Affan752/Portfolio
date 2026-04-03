`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 12:15:56
// Design Name: 
// Module Name: pipeline_top_tb
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


module pipeline_top_tb(

    );
    
    // Declaring ports
    reg clk, rst;
    
    // Design instantiation
    Pipeline_top dut(clk, rst);
    
    
    // input initialization
    initial 
        begin
            {clk, rst} = 0;
        end
        
        
        // clock generation
        always #50 clk = ~clk;
        
        // providing stimulus
        initial 
            begin
                rst = 1'b1;
                #200;
                rst = 1'b0;
                #1000;
                $finish;
           end
endmodule
