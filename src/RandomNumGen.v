//ECE6370
//Author: 8179
//Random Number Generator Module
//Generates Random Number
//Trial #1, 3/3/19

module RandomNumGen(clk, rst, ButtonInp, RandNum);

	input clk, rst;
	input ButtonInp;
	output[3:0] RandNum;
	reg[3:0] RandNum;
	wire ButtonInpInvert;
	wire[3:0] count;
	assign ButtonInpInvert = ~ButtonInp;

	Counter Counter_1(clk, rst, ButtonInpInvert, count);

	always @(posedge clk)
		begin
			if(rst == 0)
				RandNum <= 4'b0000;
			else
				begin
					if(ButtonInpInvert == 0)
						RandNum <= count;
				end
		end
endmodule

