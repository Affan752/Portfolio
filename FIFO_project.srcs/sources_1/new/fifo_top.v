`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 17:14:19
// Design Name: 
// Module Name: fifo_top
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


module fifo_top(
    input clk, rst, input [7:0] data_in_top,
    output [7:0] data_out_top
    );
    
    
    wire [7:0] data_out_temp;
    wire wr_enb, rd_enb;
    wire [7:0] data_out_fifo;
    wire full, empty;
    
    mod_a m1(clk, rst, data_in_top, data_out_temp, wr_enb);
    fifo_8x8 fifo1(clk, rst, wr_enb, rd_enb, data_out_temp, data_out_fifo, full, empty);
    mod_b m2(clk, rst, data_out_fifo, rd_enb, data_out_top);
    
endmodule
