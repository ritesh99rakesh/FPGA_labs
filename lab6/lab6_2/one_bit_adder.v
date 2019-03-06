`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:42 03/06/2019 
// Design Name: 
// Module Name:    one_bit_adder 
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
module one_bit_adder(a, b, cin, op, sum, cout);
input a, b, cin, op;
output sum, cout;
wire sum, cout;
assign sum = a^(b^op)^cin;
assign cout = ((a&(b^op))|((b^op)&cin)|(a&cin));

endmodule