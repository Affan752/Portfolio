`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 17:10:48
// Design Name: 
// Module Name: Writeback_Cycle
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


module Writeback_Cycle(
    input clk, rst, ResultSrcW,
    input [31:0] PCPlus4W, ALU_ResultW, ReadDataW,
    output [31:0] ResultW
    );
    
    // Instantiating Modules
    Mux result_mux(ALU_ResultW,
                   ReadDataW,
                   ResultSrcW,
                   ResultW
                   );
endmodule
