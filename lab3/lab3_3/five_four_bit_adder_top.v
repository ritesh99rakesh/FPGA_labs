`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:17 01/27/2019
// Design Name:   five_four_bit_adder
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab3/Lab3_3/five_four_bit_adder_top.v
// Project Name:  Lab3_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: five_four_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module five_four_bit_adder_top;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg pb5;
	reg [3:0] y;

	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;

	// Instantiate the Unit Under Test (UUT)
	five_four_bit_adder uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.pb5(pb5), 
		.y(y), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6)
	);

	always@(led0, led1, led2, led3, led4, led5, led6) begin
		$display("time = %d, sum = %b%b%b%b%b%b, carry = %b\n", $time, led5, led4, led3, led2, led1, led0, led6);
	end
	
	initial begin
		pb1 = 0; pb2 = 0; pb3 = 0; pb4 = 0; pb5 = 0;
		#2
		y = 4'b1111;
		#1
		pb1 = 1;
		#2
		y = 4'b1111;
		#1
		pb2 = 1;
		#2
		y = 4'b1111;
		#1
		pb3 = 1;
		#2
		y = 4'b1111;
		#1
		pb4 = 1;
		#2
		y = 4'b1111;
		#1
		pb5 = 1;
		#2
		$finish;
	end
      
endmodule

