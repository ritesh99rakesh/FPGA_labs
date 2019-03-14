`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:29 03/13/2019 
// Design Name: 
// Module Name:    fsmROM 
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
module fsmROM(clk, x, curr_state, next_state);
input clk;
input [1:0] x;
input [3:0] curr_state;
output [3:0] next_state;
reg [3:0] next_state;
reg [2:0] mrom[12:0];
reg [3:0] drom1[3:0], drom2[3:0];
reg counter = 0;

initial begin
	drom1[0] <= 4'b0100;
	drom1[1] <= 4'b0101;
	drom1[2] <= 4'b0110;
	drom1[3] <= 4'b0110;

	drom2[0] <= 4'b1011;
	drom2[1] <= 4'b1100;
	drom2[2] <= 4'b1100;
	drom2[3] <= 4'b1100;

	mrom[0] <= 3'b000;
	mrom[1] <= 3'b000;
	mrom[2] <= 3'b000;
	mrom[3] <= 3'b001;
	mrom[4] <= 3'b010;
	mrom[5] <= 3'b010;
	mrom[6] <= 3'b000;
	mrom[7] <= 3'b000;
	mrom[8] <= 3'b000;
	mrom[9] <= 3'b000;
	mrom[10] <= 3'b011;
	mrom[11] <= 3'b100;
	mrom[12] <= 3'b100;
end

always@(posedge clk) begin
	case(mrom[curr_state])
		3'b000: next_state <= curr_state + 1;
		3'b001: next_state <= drom1[x];
		3'b010: next_state <= 7;
		3'b011: next_state <= drom2[x];
		3'b100: next_state <= 0;
	endcase
end
endmodule