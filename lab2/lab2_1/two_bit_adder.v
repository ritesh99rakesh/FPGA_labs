`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:59 01/25/2019 
// Design Name: 
// Module Name:    two_bit_adder 
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
module two_bit_adder(x, y, z, carry);
input [1:0] x, y;
output [1:0] z;
output carry;
wire [1:0] z;
wire carry;
wire carry0;

full_adder FA0(x[0], y[0], 1'b0, z[0], carry0);
full_adder FA1(x[1], y[1], carry0, z[1], carry);

endmodule
