`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:58:34 01/27/2019
// Design Name:   ripple_led
// Module Name:   /media/riteshk/RITESH/semester_6/Computer_Organization/labs/lab3/Lab3_2/ripple_led_top.v
// Project Name:  Lab3_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ripple_led_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;

	// Instantiate the Unit Under Test (UUT)
	ripple_led uut (
		.clk(clk), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7)
	);

	always@(led0, led1, led2, led3, led4, led5, led6, led7) begin
		$display("time = %d, led0 = %b, led1 = %b, led2 = %b, led3 = %b, led4 = %b, led5 = %b,led6 = %b, led7 = %b\n",$time, led0, led1, led2, led3, led4, led5, led6, led7);
	end
	
	initial begin
		forever begin
			clk = 0;
			#2
			clk = 1;
			#2
			clk = 0;
		end
	end
	
	initial begin
		#100
		$finish;
	end
      
endmodule

