`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2026 15:10:59
// Design Name: 
// Module Name: ele_cont_tb
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


`timescale 1ns/1ps

module ele_cont_tb;

 
 // TB Signals
 
 reg clk;
 reg reset;
 reg [3:0] floor_req;
 reg emergency_stop;
 wire move_up;
 wire move_down;
 wire [1:0] current_floor;

 
 // DUT Instantiation
 
 ele_cont dut (
     .clk(clk),
     .reset(reset),
     .floor_req(floor_req),
     .emergency_stop(emergency_stop),
     .move_up(move_up),
     .move_down(move_down),
     .current_floor(current_floor)
 );

 
 // Clock Generation (10ns period)
 
 always #5 clk = ~clk;


 // Test Sequence
 
 initial begin
     // Initialize
     clk = 0;
     reset = 1;
     floor_req = 4'b0000;
     emergency_stop = 0;

     // Apply reset
     #20;
     reset = 0;

     // Request Floor 2 (Move UP)
     #10;
     floor_req = 4'b0100;
     #40;
     floor_req = 4'b0000;

     // Request Floor 0 (Move DOWN)
     #20;
     floor_req = 4'b0001;
     #40;
     floor_req = 4'b0000;

     // Multiple Requests (Priority test)
     #20;
     floor_req = 4'b1010; // floor 1 should be chosen
     #40;
     floor_req = 4'b0000;

     // Emergency Stop
     #20;
     emergency_stop = 1;
     #30;
     emergency_stop = 0;

     // End Simulation
     #50;
     $finish;
 end

 
 // Monitor
 
 initial begin
     $monitor(
     "Time=%0t | Floor=%0d | Req=%b | UP=%b DOWN=%b EMG=%b",
     $time, current_floor, floor_req,
     move_up, move_down, emergency_stop
     );
 end

endmodule
