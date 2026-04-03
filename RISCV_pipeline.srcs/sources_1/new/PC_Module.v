`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 19:57:24
// Design Name: 
// Module Name: PC_Module
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


module PC_Module(
    input clk, rst, 
    input [31:0] PC_Next,
    output reg [31:0] PC
    );
    
    always@(posedge clk)
        begin
            if(rst == 1'b1)
                PC <= {32{1'b0}};
           
            else 
                PC <= PC_Next;
        end
        
        
    
endmodule
