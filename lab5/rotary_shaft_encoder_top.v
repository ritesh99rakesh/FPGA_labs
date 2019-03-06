`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:03 02/25/2019 
// Design Name: 
// Module Name:    rotary_shaft_encoder_top 
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
module rotary_shaft_encoder_top(clk, ROT_A, ROT_B, led0, led1, led2, led3, led4, led5, led6, led7);
input clk, ROT_A, ROT_B;
output led0, led1, led2, led3, led4, led5, led6, led7;
wire led0, led1, led2, led3, led4, led5, led6, led7;
wire rotation_event, rotation_direction;
rotary_shaft RS(clk, ROT_A, ROT_B, rotation_event, rotation_direction);
rotary_shaft_encoder RSE(clk, rotation_event, rotation_direction, led0, led1, led2, led3, led4, led5, led6, led7);
endmodule
