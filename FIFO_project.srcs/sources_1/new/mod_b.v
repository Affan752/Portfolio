`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 17:02:18
// Design Name: 
// Module Name: mod_b
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


module mod_b(
    input clk, rst, input [7:0] data_in,
    output reg rd_enb, 
    output reg [7:0] data_out
    );
    parameter idle = 2'b00;
    parameter s1 = 2'b01;
    parameter data_phase = 2'b10;
    
    reg [1:0] ps, ns;
    
    always@(posedge clk)
    begin
        if(rst) 
            ps <= idle;
        else 
            ps <= ns;
    end
    
    always@(*)
        begin
            case(ps)
                idle: begin
                        ns = s1;
                        rd_enb = 0;
                      end
                      
                s1: begin
                        ns = data_phase;
                    end
                    
                data_phase: begin
                                ns = idle;
                                rd_enb = 1;
                                data_out = data_in;
                            end
            endcase
        end            
            
    
endmodule
