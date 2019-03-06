`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:27:12 01/27/2019
// Design Name:   four_bit_adder
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab3/Lab3_3/four_bit_adder_top.v
// Project Name:  Lab3_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_bit_adder_top;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [3:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	four_bit_adder uut (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.carry(carry)
	);

	always@(sum, carry) begin
		$display("time = %d, sum = %b, carry = %b\n",$time, sum, carry);
	end
	
	initial begin
		a = 4'b0000;
		b = 4'b0000;
		#4
		a = 4'b0011;
		b = 4'b0001;
		#4
		$finish;
	end
      
endmodule

