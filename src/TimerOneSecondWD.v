//Course: ECE 6370
//Author: 8179
//Title: TimerOneSecond
//This module produces a timeout signal after 1s.

module TimerOneSecondWD(count, clk, rst, CounterOut, TimeOut );

	input clk, rst, count;

	output TimeOut;
	output[3:0] CounterOut;

	wire TimeOut100ms;
	wire[6:0] CounterOut100ms;

	Timer100msWD DUT1( count, CounterOut100ms, TimeOut100ms, clk, rst);
	CountTo10WD DUT2( TimeOut100ms, count, CounterOut, TimeOut, clk, rst);

endmodule 