`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:37 03/06/2019 
// Design Name: 
// Module Name:    grid 
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
module grid(clk, ROT_A, ROT_B, z, x, y);
input clk, ROT_A, ROT_B;
input [3:0] z;
output [3:0] x, y;
reg [3:0] x = 0, y = 0;

reg [3:0] num;
wire [4:0] sum_x, sum_y;
wire rotation_event;
reg prev_rotation_event = 1;
reg change = 0;

always@(posedge clk) begin
	if(change == 1) begin
		// North
		if(num[1] == 0 && num[0] == 0) begin
			if(sum_y[4] == 1) begin
				y <= 4'b1111;
			end
			else begin
				y <= sum_y[3:0];
			end
		end
		// East
		else if(num[1] == 0 && num[0] == 1) begin
			if(sum_x[4] == 1) begin
				x <= 4'b1111;
			end
			else begin
				x <= sum_x[3:0];
			end
		end
		// South
		else if(num[1] == 1 && num[0] == 0) begin
			if(sum_y[4] == 1) begin
				y <= 0;
			end
			else begin
				y <= sum_y[3:0];
			end
		end
		// West
		else if(num[1] == 1 && num[0] == 1) begin
			if(sum_x[4] == 1) begin
				x <= 0;
			end
			else begin
				x <= sum_x[3:0];
			end
		end
		change <= 0;
	end
	if(prev_rotation_event == 0 && rotation_event == 1) begin
		num <= z;
		change <= 1;
	end
	prev_rotation_event <= rotation_event;
end
rotary_shaft RS(clk, ROT_A, ROT_B, rotation_event);
five_bit_adder FBA(x, y, num, sum_x, sum_y);
endmodule