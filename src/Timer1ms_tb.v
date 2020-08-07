//Course: ECE 6370
//Author: 8179
//Timer1ms testbench
//A testbench module for Timer1ms. 

`timescale 1ns/100 ps 

module Timer1ms_tb();

	reg clk, rst, en;
	wire TimeOut;
	wire[15:0] Count;
	
	Timer1ms  DUT1( en, Count, TimeOut, clk, rst);

	always
		begin
			#3;
			clk <= 1;
			#3;
			clk <= 0;
		end


	initial
		begin
			rst <= 1;
			#10;
			rst <= 0;
			#10;
			rst <= 1;
			#10;
			en <= 1;
			#2500000;
			en <= 0;
		end
endmodule 




