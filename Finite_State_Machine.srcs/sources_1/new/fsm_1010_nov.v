`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2026 14:28:23
// Design Name: 
// Module Name: fsm_1010_nov
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


module fsm_1010_nov(
    input clk, rst, d_in,
    output reg detected
    );
    
    reg [1:0] ps, ns;
    
    parameter idle = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    
    // present stste logic
    always@(posedge clk)
        begin
            if(rst)
                ps <= idle;
            else
                ps <= ns;
        end
       
       // next state logic 
    always @(*) begin
    detected = 1'b0;   // default assignment

    case(ps)
        idle: begin
            if(d_in == 1'b1)
                ns = s1;
            else
                ns = idle;
        end

        s1: begin
            if(d_in == 1'b0)
                ns = s2;
            else
                ns = s1;
        end

        s2: begin
            if(d_in == 1'b1)
                ns = s3;
            else
                ns = idle;
        end

        s3: begin
            if(d_in == 1'b0) begin
                ns = idle;
                detected = 1'b1;
            end
            else
                ns = s1;
        end
    endcase
end
                
   
    
endmodule
