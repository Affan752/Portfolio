`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 16:13:46
// Design Name: 
// Module Name: fifo_8x8
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


module fifo_8x8(
    input clk, rst, wr_enb, rd_enb,
    input [7:0] d_in, output reg [7:0] d_out,
    output full, empty
    );
    
    reg [2:0] wr_ptr = 0;
    reg [2:0] rd_ptr = 0;
    reg [7:0] mem [0:7];
    
    integer i;
    
    always@(posedge clk) 
        begin 
            if(rst)
                begin
                    for(i=0; i<7;i=i+1)
                        mem[i] <= 0;
                end
                
             if(wr_enb && full == 0)
                begin
                    mem[wr_ptr] <= d_in;
                    wr_ptr <= wr_ptr + 1'b1;
                end
             
              if(rd_enb && empty == 0)
                begin
                    d_out <= mem[rd_ptr];
                    rd_ptr <= rd_ptr + 1'b1;
                end
          end
          
          assign full = ((wr_ptr + 1'b1 == rd_ptr) ? 1'b1 : 1'b0);
          assign empty = ((wr_ptr == rd_ptr) ? 1'b1 : 1'b0);
          
                 
            
    
endmodule
