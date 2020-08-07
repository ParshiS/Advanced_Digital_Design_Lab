//Course: ECE 6370
//Author: 8179
//Timer100ms
//This module produces a timeout signal after 100ms.
//Trial #1, 3/18/19

module Timer100msWD(Count, CounterOut, TimeOut , clk, rst );

	input clk, rst, Count;

	output TimeOut;
	output[6:0] CounterOut;
	wire TimeOut1ms;
	wire[15:0] CounterOut1ms;

	Timer1msWD DUT1( Count, CounterOut1ms, TimeOut1ms, clk, rst);
	CountTo100WD DUT2( TimeOut1ms, Count, CounterOut, TimeOut, clk, rst);

endmodule 