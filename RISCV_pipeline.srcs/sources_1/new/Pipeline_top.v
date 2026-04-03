`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 11:24:49
// Design Name: 
// Module Name: Pipeline_top
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


module Pipeline_top(
        input clk, rst
    );
    
    // wire declaration
    wire PCSrcE, RegWriteW, RegWriteE, ALUSrcE, MemWriteE;
    wire ResultSrcE, BranchE, RegWriteM, MemWriteM, ResultSrcM, ResultSrcW;
    wire [2:0] ALUControlE;
    wire [4:0] RD_E, RD_M, RDW;
    wire [31:0] PCTargetE, InstrD, PCD, PCLpus4D, ResultW, RD1_E, RD2_E, Imm_Ext_E, PCE, PCPlus4E, PCPLus4M, WriteDataM, ALU_ResultM;
    wire [31:0] PCPlus4W, ALU_ResultW, ReadDataW;
    wire [4:0] RS1_E, RS2_E;
    wire [1:0] ForwardBE, ForwardAE;
    
    
    // Module Instantiation
    
    // Fetch Cycle
    fetch_cycle Fetch(.clk(clk),
                      .rst(rst),
                      .PCSrcE(PCSrcE),
                      .PCTargetE(PCTargetE),
                      .InstrD(InstrD),
                      .PCD(PCD),
                      .PCPlus4D(PCPlus4D)
                      ); 
                      
                      
    // Decode Cycle
        Decode_cycle decode(.clk(clk), 
                            .rst(rst), 
                            .InstrD(InstrD), 
                            .PCD(PCD), 
                            .PCPlus4D(PCPlus4D), 
                            .RegWriteW(RegWriteW), 
                            .RDW(RDW), 
                            .ResultW(ResultW), 
                            .RegWriteE(RegWriteE), 
                            .ALUSrcE(ALUSrcE), 
                            .MemWriteE(MemWriteE), 
                            .ResultSrcE(ResultSrcE),
                            .BranchE(BranchE),  
                            .ALUControlE(ALUControlE), 
                            .RD1_E(RD1_E), 
                            .RD2_E(RD2_E), 
                            .Imm_Ext_E(Imm_Ext_E), 
                            .RD_E(RD_E), 
                            .PCE(PCE), 
                            .PCPlus4E(PCPlus4E),
                            .RS1_E(RS1_E),
                            .RS2_E(RS2_E)
                             );
                        
                        
      // Execute Cycle
      Execute_Cycle execute(.clk(clk), 
                            .rst(rst), 
                            .RegWriteE(RegWriteE), 
                            .ALUSrcE(ALUSrcE), 
                            .MemWriteE(MemWriteE), 
                            .ResultSrcE(ResultSrcE), 
                            .BranchE(BranchE), 
                            .ALUControlE(ALUControlE), 
                            .RD1_E(RD1_E), 
                            .RD2_E(RD2_E), 
                            .Imm_Ext_E(Imm_Ext_E), 
                            .RD_E(RD_E), 
                            .PCE(PCE), 
                            .PCPlus4E(PCPlus4E), 
                            .PCSrcE(PCSrcE), 
                            .PCTargetE(PCTargetE), 
                            .RegWriteM(RegWriteM), 
                            .MemWriteM(MemWriteM), 
                            .ResultSrcM(ResultSrcM), 
                            .RD_M(RD_M), 
                            .PCPlus4M(PCPlus4M), 
                            .WriteDataM(WriteDataM), 
                            .ALU_ResultM(ALU_ResultM),
                            .ResultW(ResultW),
                            .ForwardA_E(ForwardAE),
                            .ForwardB_E(ForwardBE)
                            );
                            
                            
      // Memory Stage
      Memory_Cycle memory(.clk(clk),
                          .rst(rst),
                          .RegWriteM(RegWriteM),
                          .MemWriteM(MemWriteM),
                          .ResultSrcM(ResultSrcM),
                          .RD_M(RD_M),
                          .PCPlus4M(PCPlus4M),
                          .WriteDataM(WriteDataM),
                          .ALU_ResultM(ALU_ResultM),
                          .RegWriteW(RegWriteW),
                          .ResultSrcW(ResultSrcW),
                          .RD_W(RDW),
                          .PCPlus4W(PCPlus4W),
                          .ALU_ResultW(ALU_ResultW),
                          .ReadDataW(ReadDataW)
                          );
                          
                          
     // Writeback Cycle
     Writeback_Cycle writeback(.clk(clk),
                               .rst(rst),
                               .ResultSrcW(ResultSrcW),
                               .PCPlus4W(PCPlus4W),
                               .ALU_ResultW(ALU_ResultW),
                               .ReadDataW(ReadDataW),
                               .ResultW(ResultW)
                               );
                               
                               
     // Hazard Unit
     Hazard_unit Forward_Block(.rst(rst),
                               .RegWriteM(RegWriteM),
                               .RegWriteW(RegWriteW),
                               .RD_M(RD_M),
                               .RD_W(RDW),
                               .Rs1_E(RS1_E),
                               .Rs2_E(RS2_E),
                               .ForwardAE(ForwardAE),
                               .ForwardBE(ForwardBE)
                               );
                               
                                      
            
        
endmodule 
