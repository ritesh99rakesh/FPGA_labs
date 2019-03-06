`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:30:52 01/25/2019
// Design Name:   seven_bit_adder
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab2/Lab2_2/seven_bit_adder_top.v
// Project Name:  Lab2_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg [3:0] y;

	// Outputs
	wire [6:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.y(y), 
		.z(z), 
		.carry(carry)
	);
	
	

	always@(z, carry) begin
		$display("time = %d, sum = %b, carry = %b\n", $time, z, carry);
	end
	
	always@(posedge pb1) begin
		$display("pb1 time = %d, y = %b\n", $time, y);
	end
	
	always@(posedge pb2) begin
		$display("pb2 time = %d, y = %b\n", $time, y);
	end
	
	always@(posedge pb3) begin
		$display("pb3 time = %d, y = %b\n", $time, y);
	end
	
	always@(posedge pb4) begin
		$display("pb4 time = %d, y = %b\n", $time, y);
	end
	
	initial begin
		pb1 = 0; pb2 = 0; pb3 = 0; pb4 = 0;
		#5
		y = 0;
		#1
		pb1 = 1;
		#2
		y = 0; 
		#1f
		pb2 = 1;
		#2
		y = 1;
		#1
		pb3 = 1;
		#2
		y = 0;
		#1
		pb4 = 1;
		#5
		pb1 = 0; pb2 = 0; pb3 = 0; pb4 = 0;
		#5
//		y = 1; pb1 = 1;
//		#5
//		y = 0; pb2 = 1;
//		#5
//		y = 1; pb3 = 1;f
//		#5
//		y = 0; pb4 = 1;
//		#5
		$finish;
	end
      
endmodule

