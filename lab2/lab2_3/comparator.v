`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:20 01/25/2019 
// Design Name: 
// Module Name:    comparator 
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
module comparator(a, b, l, e, g, lo, eo, go);
input a, b, l, e, g;
output lo, eo, go;
wire lo, eo, go;

assign go = g | (e & (~l) & a & (~b) & (~g));
assign lo = l | (e & (~g) & (~a) & b & (~l));
assign eo = e & (~g) & (~l) & (((~a) & (~b)) | (a & b));

endmodule
