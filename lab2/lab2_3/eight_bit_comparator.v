`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:21 01/25/2019 
// Design Name: 
// Module Name:    eight_bit_comparator 
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
module eight_bit_comparator(pb1, pb2, pb3, pb4, y, lo, go, eo);
input [3:0] y;
input pb1, pb2, pb3, pb4;
output lo, go, eo;
wire lo, go, eo;

wire l0, g0, e0, l1, g1, e1, l2, g2, e2;
wire l3, g3, e3, l4, g4, e4, l5, g5, e5;
wire l6, g6, e6;
reg [7:0] a, b;

always@(posedge pb1) begin
	a[3:0] <= y;
end

always@(posedge pb2) begin
	a[7:4] <= y;
end

always@(posedge pb3) begin
	b[3:0] <= y;
end

always@(posedge pb4) begin
	b[7:4] <= y;
end

comparator C7(a[7], b[7], 0, 1, 0, l0, e0, g0);
comparator C6(a[6], b[6], l0, e0, g0, l1, e1, g1);
comparator C5(a[5], b[5], l1, e1, g1, l2, e2, g2);
comparator C4(a[4], b[4], l2, e2, g2, l3, e3, g3);
comparator C3(a[3], b[3], l3, e3, g3, l4, e4, g4);
comparator C2(a[2], b[2], l4, e4, g4, l5, e5, g5);
comparator C1(a[1], b[1], l5, e5, g5, l6, e6, g6);
comparator C0(a[0], b[0], l6, e6, g6, lo, eo, go);

endmodule
