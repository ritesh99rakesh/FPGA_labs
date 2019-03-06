`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:37:57 01/27/2019
// Design Name:   six_bit_adder
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab3/Lab3_3/six_bit_adder_top.v
// Project Name:  Lab3_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: six_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module six_bit_adder_top;

	// Inputs
	reg [4:0] a;
	reg [3:0] b;
	reg carry_a;

	// Outputs
	wire [5:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	six_bit_adder uut (
		.a(a), 
		.b(b), 
		.carry_a(carry_a), 
		.sum(sum), 
		.carry(carry)
	);

	always@(sum, carry) begin
		$display("time = %d, sum = %b, carry = %b\n",$time, sum, carry);
	end
	
	initial begin
		a = 5'b10000;
		b = 4'b1000;
		carry_a = 1;
		#4
		a = 4'b0011;
		b = 4'b0001;
		carry_a = 0;
		#4
		$finish;
	end
      
endmodule

