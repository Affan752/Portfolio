`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 11:36:50
// Design Name: 
// Module Name: Control_Unit_top
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


module Control_Unit_top(
    input [6:0] Op, funct7,
    input [2:0] funct3,
    output RegWrite, ALUSrc, MemWrite, ResultSrc, Branch,
    output [1:0] ImmSrc,
    output [2:0] ALUControl
    );
    
    wire [1:0] ALUOp;
    
    Main_Decoder Main_decoder(Op, 
                              RegWrite, 
                              ALUSrc, 
                              MemWrite, 
                              ResultSrc, 
                              Branch, 
                              ImmSrc, 
                              ALUOp);
    
    
    ALU_Decoder ALU_decoder(ALUOp, 
                            funct3, 
                            funct7, 
                            Op, 
                            ALUControl);
endmodule
