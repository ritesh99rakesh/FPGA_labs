`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:43 01/27/2019 
// Design Name: 
// Module Name:    ripple_led 
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
`define SHIFT_TIME 1

module ripple_led(clk, led0, led1, led2, led3, led4, led5,
led6, led7);
input clk;
output led0, led1, led2, led3, led4, led5, led6, led7;
reg led0 = 1, led1, led2, led3, led4, led5, led6, led7;
reg [29:0] counter = 0;

always@(posedge clk) begin
	counter <= counter + 1;
	if(counter == `SHIFT_TIME) begin
		counter <= 0;
		led1 <= led0;
		led2 <= led1;
		led3 <= led2;
		led4 <= led3;
		led5 <= led4;
		led6 <= led5;
		led7 <= led6;
		led0 <= led7;
	end
end

endmodule
