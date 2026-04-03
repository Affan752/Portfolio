`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 19:49:12
// Design Name: 
// Module Name: Mux
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


module Mux(
    input [31:0] a, b,
    input s,
    output [31:0] c
    );
    
    assign c = (~s) ? a : b;
    
endmodule


module Mux_3x1(
    input [31:0] a, b, c,
    input [1:0] s,
    output [31:0] d
);

assign d = (s == 2'b00) ? a : 
           (s == 2'b01) ? b :
           (s == 2'b10) ? c : 32'h00000000;


endmodule
