`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 10:40:36
// Design Name: 
// Module Name: fetch_cycle_tb
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


module fetch_cycle_tb(

    );
    
    // declaration of I/O
    reg clk =0, rst, PCSrcE;
    reg [31:0] PCTargetE;
    wire [31:0] InstrD, PCD, PCPlus4D;
    
    
    // design instantiation
    fetch_cycle dut(clk, rst, PCSrcE, PCTargetE, InstrD, PCD, PCPlus4D);
    
    
    // initializing inputs
//    initial
//        begin
//            {clk, rst, PCTargetE} = 0;
//        end 
    
    // clock generation
    always #50 clk = ~clk;    
    
    // Providing stimulus
    initial 
        begin
            rst = 1'b1;
            #200;
            rst = 1'b0;
            PCSrcE = 1'b0;
            PCTargetE = 32'h00000000;
            #1000;
            $finish;
        end
    
endmodule
