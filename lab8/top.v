`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:21 03/24/2019 
// Design Name: 
// Module Name:    top 
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
module top(clk, rot_a, rot_b, word, lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7, pb1, pb2);
	 
	input clk, rot_a, rot_b, pb1, pb2;
	input [3:0] word;

	output lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7;
	wire lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7;
	
	wire rotation_event;
	wire output_done;
	reg input_ready;
	reg output_ready;
	reg [0:127] first_line;
	reg [0:127] second_line;

	reg [2:0] inst; // Instruction code
	reg prev_rotation_event;
	reg [15:0] regFile[31:0];
	// Addresses
	reg [4:0] write_addr;
	reg [4:0] read_addr;
	reg [4:0] read_addr2;
	// Data
	reg[15:0] write_data;
	wire [15:0] write_data1;
	wire [15:0] write_data2;
	wire [15:0] write_data3;
	wire [15:0] read_data1;
	wire [15:0] read_data2;
	reg [3:0] shift;
	reg [4:0] counter;
	reg [7:0] conv[7:0];

	initial begin
		regFile[0] = 16'd0;
		regFile[1] = 16'd0;
		regFile[2] = 16'd0;
		regFile[3] = 16'd0;
		regFile[4] = 16'd0;
		regFile[5] = 16'd0;
		regFile[6] = 16'd0;
		regFile[7] = 16'd0;
		regFile[8] = 16'd0;
		regFile[9] = 16'd0;
		regFile[10] = 16'd0;
		regFile[11] = 16'd0;
		regFile[12] = 16'd0;
		regFile[13] = 16'd0;
		regFile[14] = 16'd0;
		regFile[15] = 16'd0;
		regFile[16] = 16'd0;
		regFile[17] = 16'd0;
		regFile[18] = 16'd0;
		regFile[19] = 16'd0;
		regFile[20] = 16'd0;
		regFile[21] = 16'd0;
		regFile[22] = 16'd0;
		regFile[23] = 16'd0;
		regFile[24] = 16'd0;
		regFile[25] = 16'd0;
		regFile[26] = 16'd0;
		regFile[27] = 16'd0;
		regFile[28] = 16'd0;
		regFile[29] = 16'd0;
		regFile[30] = 16'd0;
		regFile[31] = 16'd0;
	end

	initial begin
		conv[0] = 8'd48;
		conv[1] = 8'd49;
		conv[2] = 8'd50;
		conv[3] = 8'd51;
		conv[4] = 8'd52;
		conv[5] = 8'd53;
		conv[6] = 8'd54;
		conv[7] = 8'd55;
		counter = 0;
		prev_rotation_event = 1;
		input_ready = 0;
	end

	// Input instruction code
	always@(posedge pb1) begin
		inst <= word[2:0];
	end

	// Provision of aborting an input midway and starting over
	always@(posedge pb2) begin
		input_ready <= 0;
	end

	// Call rotary_shaft module
	rotary_shaft RS(clk, rot_a, rot_b, rotation_event);

	// Read Data assignment
	assign read_data1 = regFile[read_addr];
	assign read_data2 = regFile[read_addr2];
	// Write Data assignment
	assign write_data1 = ($signed(regFile[read_addr2]) > $signed(regFile[read_addr])) ? 1 : 0;
	assign write_data2 = regFile[read_addr2] ^ regFile[read_addr];
	assign write_data3 = $signed(regFile[read_addr]) >> shift;


	always @ (posedge clk) begin
	   if (output_done == 1) begin
			counter <= 0;
			input_ready <= 0;
			output_ready <= 0;
		end
		if(input_ready == 1) begin
			case(inst) 
				3'b000: begin
					regFile[write_addr] <= write_data;
					first_line <= {conv[write_addr[0]], conv[write_addr[1]], conv[write_addr[2]], conv[write_addr[3]], conv[write_addr[4]], 88'd0};
					second_line <= {conv[write_data[0]], conv[write_data[1]], conv[write_data[2]],conv[write_data[3]], conv[write_data[4]], conv[write_data[5]], conv[write_data[6]], conv[write_data[7]],conv[write_data[8]], conv[write_data[9]], conv[write_data[10]], conv[write_data[11]], conv[write_data[12]], conv[write_data[13]], conv[write_data[14]], conv[write_data[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end
		
				3'b001: begin
					first_line <= {conv[read_addr[0]], conv[read_addr[1]], conv[read_addr[2]], conv[read_addr[3]], conv[read_addr[4]], 88'd0};
					second_line <= {conv[read_data1[0]], conv[read_data1[1]], conv[read_data1[2]],conv[read_data1[3]], conv[read_data1[4]], conv[read_data1[5]], conv[read_data1[6]], conv[read_data1[7]],conv[read_data1[8]], conv[read_data1[9]], conv[read_data1[10]], conv[read_data1[11]], conv[read_data1[12]], conv[read_data1[13]], conv[read_data1[14]], conv[read_data1[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end

				3'b010: begin
					first_line <= {conv[read_data1[0]], conv[read_data1[1]], conv[read_data1[2]],conv[read_data1[3]], conv[read_data1[4]], conv[read_data1[5]], conv[read_data1[6]], conv[read_data1[7]],conv[read_data1[8]], conv[read_data1[9]], conv[read_data1[10]], conv[read_data1[11]], conv[read_data1[12]], conv[read_data1[13]], conv[read_data1[14]], conv[read_data1[15]]};
					second_line <= {conv[read_data2[0]], conv[read_data2[1]], conv[read_data2[2]],conv[read_data2[3]], conv[read_data2[4]], conv[read_data2[5]], conv[read_data2[6]], conv[read_data2[7]],conv[read_data2[8]], conv[read_data2[9]], conv[read_data2[10]], conv[read_data2[11]], conv[read_data2[12]], conv[read_data2[13]], conv[read_data2[14]], conv[read_data2[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end

				3'b011: begin
					regFile[write_addr] <= write_data;
					first_line <= {conv[read_addr[0]], conv[read_addr[1]], conv[read_addr[2]], conv[read_addr[3]], conv[read_addr[4]], 88'd0};
					second_line <= {conv[read_data1[0]], conv[read_data1[1]], conv[read_data1[2]],conv[read_data1[3]], conv[read_data1[4]], conv[read_data1[5]], conv[read_data1[6]], conv[read_data1[7]],conv[read_data1[8]], conv[read_data1[9]], conv[read_data1[10]], conv[read_data1[11]], conv[read_data1[12]], conv[read_data1[13]], conv[read_data1[14]], conv[read_data1[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end

				3'b100: begin
					regFile[write_addr] <= write_data;
					first_line <= {conv[read_data1[0]], conv[read_data1[1]], conv[read_data1[2]],conv[read_data1[3]], conv[read_data1[4]], conv[read_data1[5]], conv[read_data1[6]], conv[read_data1[7]],conv[read_data1[8]], conv[read_data1[9]], conv[read_data1[10]], conv[read_data1[11]], conv[read_data1[12]], conv[read_data1[13]], conv[read_data1[14]], conv[read_data1[15]]};
					second_line <= {conv[read_data2[0]], conv[read_data2[1]], conv[read_data2[2]],conv[read_data2[3]], conv[read_data2[4]], conv[read_data2[5]], conv[read_data2[6]], conv[read_data2[7]],conv[read_data2[8]], conv[read_data2[9]], conv[read_data2[10]], conv[read_data2[11]], conv[read_data2[12]], conv[read_data2[13]], conv[read_data2[14]], conv[read_data2[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end

				3'b101: begin
					regFile[write_addr] <= write_data1;
					first_line <= {conv[write_addr[0]], conv[write_addr[1]], conv[write_addr[2]], conv[write_addr[3]], conv[write_addr[4]], 88'd0};
					second_line <= {conv[write_data2[0]], conv[write_data2[1]], conv[write_data2[2]],conv[write_data2[3]], conv[write_data2[4]], conv[write_data2[5]], conv[write_data2[6]], conv[write_data2[7]],conv[write_data2[8]], conv[write_data2[9]], conv[write_data2[10]], conv[write_data2[11]], conv[write_data2[12]], conv[write_data2[13]], conv[write_data2[14]], conv[write_data2[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end

				3'b110: begin
					regFile[write_addr] <= write_data2;
					first_line <= {conv[write_addr[0]], conv[write_addr[1]], conv[write_addr[2]], conv[write_addr[3]], conv[write_addr[4]], 88'd0};
					second_line <= {conv[write_data1[0]], conv[write_data1[1]], conv[write_data1[2]],conv[write_data1[3]], conv[write_data1[4]], conv[write_data1[5]], conv[write_data1[6]], conv[write_data1[7]],conv[write_data1[8]], conv[write_data1[9]], conv[write_data1[10]], conv[write_data1[11]], conv[write_data1[12]], conv[write_data1[13]], conv[write_data1[14]], conv[write_data1[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end

				3'b111: begin
					regFile[write_addr] <= write_data3;
					first_line <= {conv[write_addr[0]], conv[write_addr[1]], conv[write_addr[2]], conv[write_addr[3]], conv[write_addr[4]], 88'd0};
					second_line <= {conv[write_data3[0]], conv[write_data3[1]], conv[write_data3[2]],conv[write_data3[3]], conv[write_data3[4]], conv[write_data3[5]], conv[write_data3[6]], conv[write_data3[7]],conv[write_data3[8]], conv[write_data3[9]], conv[write_data3[10]], conv[write_data3[11]], conv[write_data3[12]], conv[write_data3[13]], conv[write_data3[14]], conv[write_data3[15]]};
					input_ready <= 0;
					output_ready <= 1;
				end
			endcase
		end
		else if ((prev_rotation_event == 0) && (rotation_event == 1)) begin
		   	case(inst) 
				3'b000: begin
					if (counter == 0) begin
						write_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						write_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 2) begin
						write_data[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 3) begin
						write_data[7:4] <= word;
						counter <= counter + 1;
					end
					else if (counter == 4) begin
						write_data[11:8] <= word;
						counter <= counter + 1;
					end
					else if (counter == 5) begin
						write_data[15:12] <= word;
						input_ready <= 1;
						counter <= 0;
					end
				end
		
				3'b001: begin
					if (counter == 0) begin
			   			read_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						read_addr[4] <= word[0];
						input_ready <= 1;
						counter <= 0;
					end
				end

				3'b010: begin
					if (counter == 0) begin
			   			read_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						read_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 2) begin
						read_addr2[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 3) begin
						read_addr2[4] <= word[0];
						input_ready <= 1;
						counter <= 0;
					end
				end

				3'b011: begin
					if (counter == 0) begin
			   			read_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						read_addr[4] <= word[0];
						counter <= counter + 1;
					end
					if (counter == 2) begin
			   			write_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 3) begin
						write_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 4) begin
						write_data[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 5) begin
						write_data[7:4] <= word;
						counter <= counter + 1;
					end
					else if (counter == 6) begin
						write_data[11:8] <= word;
						counter <= counter + 1;
					end
					else if (counter == 7) begin
						write_data[15:12] <= word;
						//counter <= counter + 1;
						input_ready <= 1;
						counter <= 0;
					end
				end

				3'b100: begin
					if (counter == 0) begin
			   			read_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						read_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 2) begin
						read_addr2[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 3) begin
						read_addr2[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 4) begin
			   			write_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 5) begin
						write_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 6) begin
						write_data[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 7) begin
						write_data[7:4] <= word;
						counter <= counter + 1;
					end
					else if (counter == 8) begin
						write_data[11:8] <= word;
						counter <= counter + 1;
					end
					else if (counter == 9) begin
						write_data[15:12] <= word;
						input_ready <= 1;
						counter <= 0;
					end
				end

				3'b101: begin
					if (counter == 0) begin
			   			read_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						read_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 2) begin
						read_addr2[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 3) begin
						read_addr2[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 4) begin
			   			write_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 5) begin
						write_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 6) begin
						write_data[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 7) begin
						write_data[7:4] <= word;
						counter <= counter + 1;
					end
					else if (counter == 8) begin
						write_data[11:8] <= word;
						counter <= counter + 1;
					end
					else if (counter == 9) begin
						write_data[15:12] <= word;
						input_ready <= 1;
						counter <= 0;
					end
				end

				3'b110: begin
					if (counter == 0) begin
			   			read_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						read_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 2) begin
						read_addr2[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 3) begin
						read_addr2[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 4) begin
			   			write_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 5) begin
						write_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 6) begin
						write_data[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 7) begin
						write_data[7:4] <= word;
						counter <= counter + 1;
					end
					else if (counter == 8) begin
						write_data[11:8] <= word;
						counter <= counter + 1;
					end
					else if (counter == 9) begin
						write_data[15:12] <= word;
						input_ready <= 1;
						counter <= 0;
					end
				end

				3'b111: begin
					if (counter == 0) begin
			   			read_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 1) begin
						read_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 2) begin
			   			write_addr[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 3) begin
						write_addr[4] <= word[0];
						counter <= counter + 1;
					end
					else if (counter == 4) begin
						write_data[3:0] <= word;
						counter <= counter + 1;
					end
					else if (counter == 5) begin
						write_data[7:4] <= word;
						counter <= counter + 1;
					end
					else if (counter == 6) begin
						write_data[11:8] <= word;
						counter <= counter + 1;
					end
					else if (counter == 7) begin
						write_data[15:12] <= word;
						counter <= counter + 1;
					end
					else if (counter == 8) begin
						shift <= word;
						input_ready <= 1;
						counter <= 0;
					end
				end
			endcase
		end
		prev_rotation_event <= rotation_event;
	end

	lcd LCD(first_line, second_line, output_ready, clk, lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7, output_done);	
endmodule
