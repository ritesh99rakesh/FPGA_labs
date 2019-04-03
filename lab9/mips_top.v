`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:55:05 04/03/2019
// Design Name:   mips
// Module Name:   /users/misc/hunar/Desktop/Lab9/mips_top.v
// Project Name:  Lab9
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_top;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] led;
	wire [2:0] state;
	wire [1:0] operation;;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.led(led),
		.state(state),
		.operation(operation)
	);
	always@(posedge clk) begin
			$display("%d: ans=%d, state=%d, opcode=%d",$time, led, state, operation);
		end
		initial begin
			forever begin
				clk = 0;
				#1
				clk = 1;
				#1
				clk = 0;
			end
		end
		initial begin
			#100
			$finish;
		end
      
endmodule

