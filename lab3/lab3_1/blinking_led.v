`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:00 01/26/2019 
// Design Name: 
// Module Name:    blinking_led 
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
`define OFF_TIME 2
`define ON_TIME (2*`OFF_TIME+1)

module blinking_led(clk, led0);
input clk;
reg [29:0] counter = 0;
output led0;
reg led0;

always@(posedge clk) begin
	counter <= counter + 1;
	if(counter == `OFF_TIME) begin
		led0 <= 0;
	end
	else if(counter == `ON_TIME) begin
		led0 <= 1;
		counter <= 0;
	end
end
	
endmodule