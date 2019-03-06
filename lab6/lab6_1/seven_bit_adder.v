`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:02 02/27/2019 
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
module seven_bit_adder(clk, ROT_A, ROT_B, num, sum, overflow);
input clk, ROT_A, ROT_B;
input [3:0] num;
output [6:0] sum;
output overflow;
wire [6:0] sum;
wire overflow;
reg [6:0] a, b;
wire [6:0] cout;
reg op;
wire rotation_event;
reg prev_rotation_event = 1;
reg [2:0] counter = 3'b000;

always@(posedge clk) begin
	if(prev_rotation_event == 0 && rotation_event == 1) begin
		if(counter == 3'b000) begin
			a[3:0] <= num;
			counter <= counter + 1;
		end
		else if(counter == 3'b001) begin
			a[6:4] <= num[2:0];
			counter <= counter + 1;
		end
		else if(counter == 3'b010) begin
			b[3:0] <= num;
			counter <= counter + 1;
		end
		else if(counter == 3'b011) begin
			b[6:4] <= num[2:0];
			counter <= counter + 1;
		end
		else if(counter == 3'b100) begin
			op <= num[0];
			counter <= counter + 1;
		end
		else if(counter == 3'b101) begin
			counter <= 3'b000;
		end
	end
	prev_rotation_event <= rotation_event;
end
rotary_shaft RS(clk, ROT_A, ROT_B, rotation_event);
one_bit_adder FA0(a[0], b[0], op, op, sum[0], cout[0]);
one_bit_adder FA1(a[1], b[1], cout[0], op, sum[1], cout[1]);
one_bit_adder FA2(a[2], b[2], cout[1], op, sum[2], cout[2]);
one_bit_adder FA3(a[3], b[3], cout[2], op, sum[3], cout[3]);
one_bit_adder FA4(a[4], b[4], cout[3], op, sum[4], cout[4]);
one_bit_adder FA5(a[5], b[5], cout[4], op, sum[5], cout[5]);
one_bit_adder FA6(a[6], b[6], cout[5], op, sum[6], cout[6]);

assign overflow = ~(cout[5] && cout[6]);
endmodule
