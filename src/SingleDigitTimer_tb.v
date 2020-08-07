// Course Number: ECE6370
//Name : Parshi Srinidhi, 8179
//Single Digit Timer testbench

`timescale 1ns/100ps

module SingleDigitTimer_tb();
reg clk, rst;
reg [3:0] binaryInp;
reg InpLoad;
reg NoBorrow, Decrement;
wire [3:0] BinaryOut;
wire borrowReq, TOut;

SingleDigitTimer DUT(clk, rst, binaryInp, InpLoad, NoBorrow, Decrement, BinaryOut, borrowReq, TOut);

always
	begin
	#3; 
	clk<=0;
	#3; clk<=1;
	end
initial
	begin
			rst <= 1;
			#10;
			rst <= 0;
			#10;
			rst <= 1;
			binaryInp <= 3;
			InpLoad <= 1;
			#5
			InpLoad <= 0;
			NoBorrow <= 0;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#30;
			Decrement <= 0;
			binaryInp <= 3;
			InpLoad <= 1;
			#5;
			InpLoad <= 0;
			NoBorrow <= 1;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#5;
			Decrement <= 0;
			#5;
			Decrement <= 1;
			#5;
			Decrement <= 0;
		end

endmodule
