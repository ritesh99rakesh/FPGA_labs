`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:44:59 01/26/2019
// Design Name:   blinking_led
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab3/Lab3_1/blinking_led_top.v
// Project Name:  Lab3_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blinking_led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module blinking_led_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	blinking_led uut (
		.clk(clk), 
		.led0(led0)
	);

	always@(led0) begin
		$display("time = %d, led = %b\n", $time, led0);
	end
	
	initial begin
		forever begin
			clk = 1;
			#2
			clk = 0;
			#2
			clk = 1;
		end
	end
	
	initial begin
		#50
		$finish;
	end
      
endmodule

