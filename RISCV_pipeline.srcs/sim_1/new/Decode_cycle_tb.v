`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 12:40:06
// Design Name: 
// Module Name: Decode_cycle_tb
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


module Decode_cycle_tb(

    ); 
    
    // I/O declaration
    reg clk, rst, RegWriteW;
    reg [4:0] RDW;
    reg [31:0] InstrD, PCD, PCPlus4D, ResultW;
    
    wire RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE;
    wire [2:0] ALUControlE;
    wire [31:0] RD1_E, RD2_E, Imm_Ext_E;
    wire [4:0] RS1_E, RS2_E;
    wire [31:0] PCE, PCPlus4E;
    
    // design instantiation
    Decode_cycle dut(clk, 
                     rst, 
                     Regwrite,
                     RDW,
                     InstrD,
                     PCD,
                     PCPlus4D,
                     ResultW,
                     RegWriteE, 
                     ALUSrcE,
                     MemWriteE,
                     ResultSrcE,
                     BranchE,
                     ALUControlE,
                     RD1_E, RD2_E, Imm_Ext_E,
                     RS1_E, RS2_E,
                     PCE, PCPlus4E
                     );
                     
     
     // Initializing inputs
     initial 
        begin
            {clk, rst, RegWriteW, RDW, InstrD, PCD, PCPlus4D, ResultW} = 0;
        end
        
        
        
        // Clock generation
        always #50 clk = ~clk;
        
        
        // providing stimulus
        initial
            begin
                rst = 1'b1;
                #200;
                rst = 1'b0;
                RegWriteW = 1'b1;
                RDW = 5'd3;
                InstrD = 32'h00000000;
                PCD = 32'h00000000;
                PCPlus4D = 32'h00000000;
                ResultW = 32'h00000010;
                
//                #500;
//                RegWriteW = 1'b0;
                
               #1000;
               $finish;
         end
    
endmodule
