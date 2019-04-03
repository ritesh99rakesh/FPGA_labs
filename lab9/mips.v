`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:41 04/03/2019 
// Design Name: 
// Module Name:    mips 
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
`define OUTPUT_REG 5
module mips(clk, led);
input clk;

output [7:0] led;
//output [7:0] read_data, read_data2, write_data, num;
//output [2:0] read_addr, read_addr2, write_addr;
//output [31:0] inst;
//output [2:0] state;
//output [1:0] operation;;

wire [7:0] led;

reg [2:0] state;
reg [2:0] PC;
reg [1:0] operation;
reg [2:0] MAX_PC = 3'b111;
reg [7:0] regFile[31:0];
reg [31:0] instMem[6:0];
reg [7:0] led_proxy;

reg [2:0] write_addr;
reg [2:0] read_addr;
reg [2:0] read_addr2;
reg [31:0] inst;
reg [7:0] read_data, read_data2, write_data, num;

initial begin
	regFile[0] = 8'd0;
	regFile[1] = 8'd0;
	regFile[2] = 8'd0;
	regFile[3] = 8'd0;
	regFile[4] = 8'd0;
	regFile[5] = 8'd0;
	regFile[6] = 8'd0;
	regFile[7] = 8'd0;
	regFile[8] = 8'd0;
	regFile[9] = 8'd0;
	regFile[10] = 8'd0;
	regFile[11] = 8'd0;
	regFile[12] = 8'd0;
	regFile[13] = 8'd0;
	regFile[14] = 8'd0;
	regFile[15] = 8'd0;
	regFile[16] = 8'd0;
	regFile[17] = 8'd0;
	regFile[18] = 8'd0;
	regFile[19] = 8'd0;
	regFile[20] = 8'd0;
	regFile[21] = 8'd0;
	regFile[22] = 8'd0;
	regFile[23] = 8'd0;
	regFile[24] = 8'd0;
	regFile[25] = 8'd0;
	regFile[26] = 8'd0;
	regFile[27] = 8'd0;
	regFile[28] = 8'd0;
	regFile[29] = 8'd0;
	regFile[30] = 8'd0;
	regFile[31] = 8'd0;
	state = 0;
	PC = 0;
end

initial begin
	instMem[0] = {6'b001001, 5'b00000, 5'b00001, 8'b00000000, 8'b00101101};
	instMem[1] = {6'b001001, 5'b00000, 5'b00010, 8'b00000000, 8'b01010011};
	instMem[2] = {6'b001001, 5'b00000, 5'b00011, 8'b11111111, 8'b11000100};
	instMem[3] = {6'b001001, 5'b00000, 5'b00100, 8'b11111111, 8'b10111011};
	instMem[4] = {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b010101};
	instMem[5] = {6'b000000, 5'b00011, 5'b00100, 5'b00110, 5'b00000, 6'b010101};
	instMem[6] = {6'b000000, 5'b00101, 5'b00110, 5'b00101, 5'b00000, 6'b010111};
end

assign led = led_proxy;

always@(posedge clk) begin
	case(state)
	0: begin
			inst <= instMem[PC];
			PC <= PC + 1;
			state <= 1;
		end
	1: begin
			case(inst[31:26])
			6'b001001: 	begin
								read_addr <= inst[25:21];
								write_addr <= inst[20:16];
								num <= inst[7:0];
								operation <= 2'b00;
							end
			6'b000000:  begin
								read_addr <= inst[25:21];
								read_addr2 <= inst[20:16];
								write_addr <= inst[15:11];
								if(inst[5:0] == 6'b010101) begin
									operation <= 2'b01;
								end
								else begin
									operation <= 2'b10;
								end
							end
			endcase
			state <= 2;
		end
	2: begin
			if(operation == 2'b00) begin
				read_data <= regFile[read_addr];
			end
			else begin
				read_data <= regFile[read_addr];
				read_data2 <= regFile[read_addr2];
			end
			state <= 3;
		end
	3: begin
			case(operation)
			2'b00:begin
						write_data <= read_data + num;
						state <= 4;
					end
			2'b01:begin
						write_data <= read_data + read_data2;
						state <= 4;
					end
			2'b10:begin
						write_data <= read_data - read_data2;
						state <= 4;
					end
			default: state <= 0;
			endcase
		end
	4: begin
			regFile[write_addr] <= write_data;
			if(PC < MAX_PC) begin
				state <= 0;
			end
			else begin
				state <= 5;
			end
		end
	5: led_proxy <= regFile[`OUTPUT_REG];
	endcase
end
endmodule
