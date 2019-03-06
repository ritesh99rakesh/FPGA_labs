`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:28 01/25/2019 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module seven_bit_adder(pb1, pb2, pb3, pb4, y, z, carry);
input [3:0] y;
input pb1, pb2, pb3, pb4;
output [6:0] z;
output carry;
wire [6:0] z;
wire carry;

reg [6:0] a, b;
wire c0, c1, c2, c3, c4, c5;

always@(posedge pb1) begin
	a[3:0] <= y;
end

always@(posedge pb2) begin
	a[6:4] <= y[2:0];
end

always@(posedge pb3) begin
	b[3:0] <= y;
end

always@(posedge pb4) begin
	b[6:4] <= y[2:0];
end

full_adder FA0(a[0], b[0], 0, z[0], c0);
full_adder FA1(a[1], b[1], c0, z[1], c1);
full_adder FA2(a[2], b[2], c1, z[2], c2);
full_adder FA3(a[3], b[3], c2, z[3], c3);
full_adder FA4(a[4], b[4], c3, z[4], c4);
full_adder FA5(a[5], b[5], c4, z[5], c5);
full_adder FA6(a[6], b[6], c5, z[6], carry);

endmodule