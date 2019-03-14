`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:28 03/13/2019 
// Design Name: 
// Module Name:    returnMin 
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
module returnMin(a, b, c, d, min_pos);
input [2:0] a, b, c, d;
output [1:0] min_pos;
reg min_pos;

always@(a, b, c, d) begin
	if(a < b) begin
		if(a < c) begin
			if(a < d) begin
				min_pos <= 0;
			end
			else begin
				min_pos <= 3;
			end
		end
		else begin
			if(c < d) begin
				min_pos <= 2;
			end
			else begin
				min_pos <= 3;
			end
		end
	end
	else begin
		if(b < c) begin
			if(b < d) begin
				min_pos <= 1;
			end
			else begin
				min_pos <= 3;
			end
		end
		else begin
			if(c < d) begin
				min_pos <= 2;
			end
			else begin
				min_pos <= 3;
			end
		end
	end
end
endmodule