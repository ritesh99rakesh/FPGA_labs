`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:51:51 01/25/2019
// Design Name:   full_adder
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab1/Lab1_1/full_adder_top.v
// Project Name:  Lab1_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_top;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.carry(carry)
	);

	always@(sum or carry) begin
		$display("time = %d, %b + %b + %b = %b, carry = %b\n", $time, a, b, cin, sum, carry);
	end
	
	initial begin
		a = 0; b = 0; cin = 0;
		#5
		a = 0; b = 0; cin = 1; 
		#5
		a = 1; b = 1; cin = 0;
		#5
		a = 1; b = 1; cin = 1;
		#5
		$finish;
	end
      
endmodule

