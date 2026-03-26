`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 16:33:54
// Design Name: 
// Module Name: fifo_8x8_tb
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


module fifo_8x8_tb(
    
);
  
  reg clk, rst, wr_enb, rd_enb;
  reg [7:0] d_in;
  wire [7:0] d_out;  
  wire full, empty;
  
 fifo_8x8 dut(clk, rst, wr_enb ,rd_enb, d_in, d_out, full, empty);
 
 initial    
    begin 
        {clk, rst, wr_enb, rd_enb, d_in} = 0;
    end
    
    always #5 clk = ~clk;
    
    initial 
        begin
            rst = 1;
            
            #10;
            rst = 0; 
            wr_enb = 1;
            d_in = 7;
            
            #10;
            wr_enb = 1;
            d_in = 12;
            
            #10;
            wr_enb = 0;
            
            #10;
            rd_enb = 1'b1;
            
            #100;
            $finish;
        end
    
    
    
endmodule
