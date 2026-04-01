`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 15:39:13
// Design Name: 
// Module Name: top_tb
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


module top_tb(
    );
    
    reg clk;
    reg reset;
    reg [4:0] address;
    reg [31:0] instruction_code;
    reg [7:0] instruction_code_2;
    reg [31:0] data_in_top;
    reg wr_en;
     
     RISCV_top dut(clk,reset);
     
    initial
        begin
            clk = 0;

         end
         
     always #10 clk = ~ clk;    
    
            

   initial
    begin
        reset = 1'b1;
        #100;
        reset = 1'b0;
        
        dut.dpu.rfu.reg_mem[1] = 10;
        dut.dpu.rfu.reg_mem[2] = 20;
        
        #100;
     end
     
       

endmodule
