`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:16 01/27/2019 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder(a, b, c, sum, carry);
input a, b, c;
output sum, carry;
wire sum, carry;

assign sum = a^b^c;
assign carry = ((a&b)|(b&c)|(c&a));

endmodule
