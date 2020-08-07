//Course: ECE 6370
//Author: 8179
//Title: CountTo100_tb
//Testbench for counting to 100 module
//Trial #1, 3/18/19
`timescale 1ns/100ps 

module CountTo100_tb();

	reg clk, rst;
	reg CounterIn;
	wire TimeOut;
	wire[6:0] CounterOut;
	
	CountTo100 DUT1( CounterIn, CounterOut, TimeOut, clk, rst);	
	always
		begin
			#3;clk <= 1;
			#3;clk <= 0;
		end

	initial
		begin
			rst <= 1;
			#10;
			rst <= 0;
			#10;
			rst <= 1;
			#10;
			CounterIn <= 1;
			#2000;      
			CounterIn <= 0;
		end

endmodule 


