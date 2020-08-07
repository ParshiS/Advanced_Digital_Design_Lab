
//ECE6370
//Author: 8179
//Random Number Generator Testbench Module
//Test cases for RandNumGen Module
//Trial #1, 3/3/19

`timescale 1ns/100ps

module RandNumGen_tb();

	reg clk, rst;
	reg ButtonInp;
	wire[3:0] RandNum;

	RandomNumGen RNG_1(clk, rst, ButtonInp, RandNum);

	always
		begin
			#3;
			clk = 1;
			#3;
			clk = 0;
		end

	initial
		begin
			rst = 1;
			ButtonInp = 1;
			#10;
			rst = 0;
			#15;
			rst = 1;
			#10;
			ButtonInp = 0;
			#500;
			ButtonInp = 1;
			#10;
			ButtonInp = 0;
			#450;
			ButtonInp = 1;
			#10;
			ButtonInp = 0;
			#400;
			ButtonInp = 1;
			#10;
			ButtonInp = 0;
			#600;
			ButtonInp = 1;
			#10;

		end
 
endmodule
