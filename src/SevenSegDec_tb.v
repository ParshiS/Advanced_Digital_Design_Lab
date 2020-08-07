// ECE6370
//Author: 8179
//Seven Segment Decoder Test Bench modeule
//Module to test the seven segment module
// Trial #1, 1/31/19

`timescale 1ns/100ps
module SevenSegDec_tb();
	
	reg [3:0] inp;
	wire [6:0] out;

	SevenSegmentDec SSD1(inp,out);

	initial
		begin
			inp=4'b0000;
			#10;
			inp=4'b0001;
			#10;
			inp=4'b0010;
			#10;
			inp=4'b0011;
			#10;
			inp=4'b0100;
			#10;
			inp=4'b0101;
			#10;
			inp=4'b0110;
			#10;
			inp=4'b0111;
			#10;
			inp=4'b1000;
			#10;
			inp=4'b1001;
			#10;
			inp=4'b1010;
			#10;
			inp=4'b1011;
			#10;
			inp=4'b1100;
			#10;
			inp=4'b1101;
			#10;
			inp=4'b1110;
			#10;
			inp=4'b1111;
			#10;
			
		end
endmodule
