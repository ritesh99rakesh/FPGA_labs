`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:55 03/13/2019 
// Design Name: 
// Module Name:    lcd_top 
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
module lcd_top(clk, x, buttons, lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7);
input clk;
input [2:0] x;
input [3:0] buttons;
output lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7;
wire lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7;
reg [2:0] a, b, c, d;
wire [1:0] min_pos;

reg [7:0] ascii[7:0]; 
initial begin
	ascii[0] = 8'd48;
	ascii[1] = 8'd49;
	ascii[2] = 8'd50;
	ascii[3] = 8'd51;
	ascii[4] = 8'd52;
	ascii[5] = 8'd53;
	ascii[6] = 8'd54;
	ascii[7] = 8'd55;
end
reg [0:127] first_line;
reg [0:127] second_line;

always@(posedge buttons[0]) begin
	a <= x;
end
always@(posedge buttons[1]) begin
	b <= x;
end
always@(posedge buttons[2]) begin
	c <= x;
end
always@(posedge buttons[3]) begin
	d <= x;
end
returnMin MIN(a, b, c, d, min_pos);

always@(posedge clk) begin
	first_line <= {ascii[a], 8'd44, 8'd32, ascii[b], 8'd44, 8'd32, ascii[c], 8'd44, 8'd32, ascii[d], 48'd0};
	if(min_pos == 0) begin
		second_line <= {ascii[0], 120'd0};
	end
	else if(min_pos == 1) begin
		second_line <= {ascii[1], 120'd0};
	end
	else if(min_pos == 2) begin
		second_line <= {ascii[2], 120'd0};
	end
	else begin
		second_line <= {ascii[3], 120'd0};
	end
end

lcd LCD (first_line, second_line, clk, lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7);

endmodule