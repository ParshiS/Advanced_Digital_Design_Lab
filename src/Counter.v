//ECE6370
//Author: 8179
//Counter Module
// Counts upto 15 then resets back to zero
//Trial #1, 3/3/19

module Counter(clk, rst, CountIn ,CountOut);

	input clk, rst;
	input CountIn;
	output[3:0] CountOut;
	reg[3:0] CountOut;

	always @(posedge clk)
		begin
			if(rst == 0)
				begin
					CountOut <= 4'b0000;
				end
			else 
				begin
					if(CountIn == 1)
						begin
							if(CountOut >= 4'b1111)
								begin
									CountOut <= 4'b0000;
								end
							else
								begin
									CountOut <= CountOut+4'b0001;
								end
						end
				end
		end
endmodule
