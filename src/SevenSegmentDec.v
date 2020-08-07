// ECE6370
//Author: 8179
//Seven Segment Decoder modeule
//Module to convert four bit numbers to seven segment display inputs
// Trial #1, 1/31/19

module SevenSegmentDec(inp, out);

	input [3:0] inp;
	output [6:0] out;
	reg [6:0] out;

	always @ (inp)
		begin
			case(inp)
				4'b0000: begin out = 7'b1000000; end
				4'b0001: begin out = 7'b1111001; end
				4'b0010: begin out = 7'b0100100; end
				4'b0011: begin out = 7'b0110000; end
				4'b0100: begin out = 7'b0011001; end
				4'b0101: begin out = 7'b0010010; end
				4'b0110: begin out = 7'b0000010; end
				4'b0111: begin out = 7'b1111000; end
				4'b1000: begin out = 7'b0000000; end
				4'b1001: begin out = 7'b0011000; end
				4'b1010: begin out = 7'b0001000; end
				4'b1011: begin out = 7'b0000011; end
				4'b1100: begin out = 7'b1000110; end
				4'b1101: begin out = 7'b0100001; end
				4'b1110: begin out = 7'b0000110; end
				4'b1111: begin out = 7'b0001110; end
				default: begin out = 7'b1111111; end 
			endcase
		end
endmodule
