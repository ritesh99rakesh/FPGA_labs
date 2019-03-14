`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:55 03/13/2019 
// Design Name: 
// Module Name:    fsmROM_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define clkTime 100000000

module fsmROM_top(clk, cin, ROT_A, ROT_B, next_state);
input clk;
input [1:0] cin;
input ROT_A, ROT_B;
output [3:0] next_state;
wire [3:0] next_state;
reg [3:0] curr_state = 0;
reg [31:0] counter = 0;
reg [1:0] x;
wire rotation_event;
reg prev_rotation_event = 1;

fsmROM FSMROM(clk, x, curr_state, next_state);

always@(posedge clk) begin
	counter <= counter + 1;
	if(prev_rotation_event == 0 && rotation_event == 1) begin
		curr_state <= next_state;
		x <= cin;
		counter <= 0;
	end
	else if(counter == `clkTime) begin
		curr_state <= next_state;
		counter <= 0;
	end
	prev_rotation_event <= rotation_event;
end
rotary_shaft RS(clk, ROT_A, ROT_B, rotation_event);
endmodule