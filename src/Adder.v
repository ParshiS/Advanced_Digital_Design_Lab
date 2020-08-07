//ECE6370
//Author: 8179
//Adder
//Four bit adder module. Inputs 2 four bit numbers and outputs one 4 fit sum.
//Trial #1, 1/31/19

module Adder(inp1, inp2, sum);
	
	input [3:0] inp1, inp2;
	output [3:0] sum;
	reg [3:0] sum;

	always @(inp1, inp2)
		begin
			sum = inp1+inp2;
		end
endmodule
