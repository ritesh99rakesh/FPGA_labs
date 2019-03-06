`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:09 03/06/2019 
// Design Name: 
// Module Name:    five_bit_adder 
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
module five_bit_adder(x, y, num, sum_x, sum_y);
input [3:0] x, y, num;
output [4:0] sum_x, sum_y;
wire [4:0] sum_x, sum_y;

wire op;
wire [1:0] addx, addy;
wire [4:0] coutx, couty;

assign op = num[1];
assign addx = {num[3]&num[0], num[2]&num[0]};
assign addy = {num[3]&(~num[0]), num[2]&(~num[0])};

one_bit_adder FA0(x[0], addx[0], op, op, sum_x[0], coutx[0]);
one_bit_adder FA1(y[0], addy[0], op, op, sum_y[0], couty[0]);

one_bit_adder FA3(x[1], addx[1], coutx[0], op, sum_x[1], coutx[1]);
one_bit_adder FA4(y[1], addy[1], couty[0], op, sum_y[1], couty[1]);

one_bit_adder FA5(x[2], 0, coutx[1], op, sum_x[2], coutx[2]);
one_bit_adder FA6(y[2], 0, couty[1], op, sum_y[2], couty[2]);

one_bit_adder FA7(x[3], 0, coutx[2], op, sum_x[3], coutx[3]);
one_bit_adder FA8(y[3], 0, couty[2], op, sum_y[3], couty[3]);

one_bit_adder FA9(1'b0, 0, coutx[3], op, sum_x[4], coutx[4]);
one_bit_adder FA10(1'b0, 0, couty[3], op, sum_y[4], couty[4]);

endmodule