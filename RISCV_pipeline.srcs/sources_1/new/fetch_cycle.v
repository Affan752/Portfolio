`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 19:41:40
// Design Name: 
// Module Name: fetch_cycle
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


module fetch_cycle(
    input clk, rst, PCSrcE,
    input [31: 0] PCTargetE,
    output [31:0] InstrD,
    output [31:0] PCD, PCPlus4D
    );
    
    
    // Declaring wires
    wire [31:0] PC_F, PCF, PCPlus4F;
    wire [31:0] InstrF;
    
    
    // Declaration of register
    reg [31:0] InstrF_reg;
    reg [31:0] PCF_reg, PCPlus4F_reg;
    
    
    // Instantiation of Modules //
    
    // Mux Instantiation
    Mux PC_MUX(PCPlus4F, PCTargetE, PCSrcE, PC_F);
    
   // PC counter Instantiation
   PC_Module Program_counter(clk, rst, PC_F, PCF);
   
   // Instruction Memory
   instruction_memory IMEM(rst, PCF, InstrF);
   
   // PC adder
    PC_Adder PC_adder(PCF, 32'h00000004, PCPlus4F);
    
    // Fetch cycle logic
    always@(posedge clk or posedge rst)
        begin
            if(rst == 1'b1) begin
                InstrF_reg <= 32'h00000000;
                PCF_reg <= 32'h00000000;
                PCPlus4F_reg <= 32'h00000000;
                end
                
            else begin
                    InstrF_reg <= InstrF;
                    PCF_reg <= PCF;
                    PCPlus4F_reg <= PCPlus4F;
                    end
        end
        
        // Assigning values to output port
        assign InstrD = (rst == 1'b1) ? 32'h00000000 : InstrF_reg;
        assign PCD  = (rst == 1'b1) ? 32'h00000000 : PCF_reg;
        assign PCPlus4D = (rst == 1'b1) ? 32'h00000000 : PCPlus4F_reg;
         
    
    
    
endmodule
