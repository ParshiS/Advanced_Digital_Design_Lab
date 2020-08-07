//ECE6370
//Author: 8179
//Load Register Module
// This module loads four bit input to the output when "Load" signal is high.
// Trial #1, 2/7/19

module LoadRegister( inp, rst, clk, Load, out);

	input [3:0] inp;
	output[3:0] out;
	reg[3:0] out;
	input clk, rst, Load;
	
	always@(posedge clk)
		begin
			if (rst == 0)
				begin
					out <= 4'b0000;
				end
			else
				begin
					if(Load == 1)
						begin
							out <= inp;
						end
				end
		end
endmodule

