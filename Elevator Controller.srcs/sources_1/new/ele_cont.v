`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2026 13:42:34
// Design Name: 
// Module Name: ele_cont
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


module ele_cont(
    input clk, reset, emergency_stop,
    input [3:0] floor_req,
    output reg move_up, move_down,
    output reg [1:0] current_floor
);

    // state encoding
    parameter idle = 2'b00;
    parameter up   = 2'b01;
    parameter down = 2'b10;  
    parameter emergency = 2'b11;  

    reg [1:0] current_state, next_state;
    reg [1:0] target_floor;

   
    // Priority logic
   
    always @(*) begin
        target_floor = current_floor;

        if (floor_req[0])
            target_floor = 2'd0;
        else if (floor_req[1])
            target_floor = 2'd1;
        else if (floor_req[2])
            target_floor = 2'd2;
        else if (floor_req[3])
            target_floor = 2'd3;
    end

    
    // Present state logic
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= idle;
        else
            current_state <= next_state;
    end

    
    // Floor tracking logic
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_floor <= 2'd0;
        else if (current_state == up)
            current_floor <= current_floor + 1'b1;
        else if (current_state == down)
            current_floor <= current_floor - 1'b1;
    end

    
    // Next state logic
    
    always @(*) begin
        next_state = current_state;

        if (emergency_stop)
            next_state = emergency;
        else begin
            case (current_state)

                idle: begin
                    if (target_floor > current_floor)
                        next_state = up;
                    else if (target_floor < current_floor)
                        next_state = down;
                end

                up: begin
                    if (current_floor == target_floor)
                        next_state = idle;
                end

                down: begin
                    if (current_floor == target_floor)
                        next_state = idle;
                end

                emergency: begin
                    if (!emergency_stop)
                        next_state = idle;
                end

                default: next_state = idle;

            endcase
        end
    end

    
    // Output logic
   
    always @(*) begin
        move_up   = 1'b0;
        move_down = 1'b0;

        case (current_state)
            up:   move_up   = 1'b1;
            down: move_down = 1'b1;
        endcase
    end
    
endmodule
