`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:03:10 01/25/2019
// Design Name:   two_bit_adder
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab2/Lab2_1/two_bit_adder_top.v
// Project Name:  Lab2_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_bit_adder_top;

	// Inputs
	reg [1:0] x;
	reg [1:0] y;

	// Outputs
	wire [1:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	two_bit_adder uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.carry(carry)
	);

	always@(z, carry) begin
		$display("$time = %d, %b + %b = %b, carry = %b\n", $time, x, y, z, carry);
	end
	
	initial begin
		x = 2'b00; y = 2'b00;
		#5
		x = 2'b01; y = 2'b00;
		#5
		x = 2'b10; y = 2'b00;
		#5
		x = 2'b00; y = 2'b11;
		#5
		x = 2'b01; y = 2'b01;
		#5
		x = 2'b10; y = 2'b10;
		#5
		$finish;
	end
      
endmodule

