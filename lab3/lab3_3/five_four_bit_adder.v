`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:41 01/27/2019 
// Design Name: 
// Module Name:    five_four_bit_adder 
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
module five_four_bit_adder(pb1, pb2, pb3, pb4, pb5, y, led0, led1, led2, led3, led4, led5, led6);
input pb1, pb2, pb3, pb4, pb5;
input [3:0] y;
output led0, led1, led2, led3, led4, led5, led6;
wire led0, led1, led2, led3, led4, led5, led6;
reg [3:0] a, b, c, d, e;

wire [3:0] sum_ab, sum_cd;
wire carry_ab, carry_cd, carry_abcd, carry_abcde;
wire [4:0] sum_abcd;
wire [5:0] sum_abcde;


always@(posedge pb1) begin
	a <= y;
end

always@(posedge pb2) begin
	b <= y;
end

always@(posedge pb3) begin
	c <= y;
end

always@(posedge pb4) begin
	d <= y;
end

always@(posedge pb5) begin
	e <= y;
end

four_bit_adder FourBitAdder01(a, b, sum_ab, carry_ab);
four_bit_adder FourBitAdder02(c, d, sum_cd, carry_cd);
five_bit_adder FiveBitAdder01(sum_ab, sum_cd, carry_ab, carry_cd, sum_abcd, carry_abcd);
six_bit_adder SixBitAdder01(sum_abcd, e, carry_abcd, sum_abcde, carry_abcde);
assign led0 = sum_abcde[0];
assign led1 = sum_abcde[1];
assign led2 = sum_abcde[2];
assign led3 = sum_abcde[3];
assign led4 = sum_abcde[4];
assign led5 = sum_abcde[5];
assign led6 = carry_abcde;

endmodule
