`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 17:24:35
// Design Name: 
// Module Name: fifo_top_tb
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


module fifo_top_tb(

    );
     reg clk, rst;
  reg [7:0] d_in;
  wire [7:0] d_out;  
 
  
 fifo_top dut(clk, rst, d_in, d_out);
 
 initial    
    begin 
        {clk, rst, d_in} = 0;
    end
    
    always #5 clk = ~clk;
    
    initial 
        begin
            rst = 1;
            
            #10;
            rst = 0; 
           
            d_in = 7;
            
            #10;
            
            d_in = 12;
            
            #10;
            d_in = 8;
            
            #10;
           d_in = 14;
            
            #100;
            $finish;
        end
    
endmodule
