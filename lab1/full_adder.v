`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:37 01/25/2019 
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
module full_adder(a, b, cin, sum, carry);
input a, b, cin;
output sum, carry;
wire sum, carry;

assign sum = a^b^cin;
assign carry = ((a&b)|(b&cin)|(cin&a));

endmodule
