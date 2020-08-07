//ECE6370
//Author: 8179
//Testbench code for Button Shaper
// Trial #1, 2/12/2019

`timescale 1ns/100ps

module ButtonShaper_tb();

reg BPushIn, rst, clk;
wire BPushO;

ButtonShaper BS_1(BPushIn, rst, clk,  BPushO);

always
	begin	
		#10;
		clk<=1;
		#10;
		clk<=0;
			
	end

initial
	begin
		#3;
		BPushIn<=1;
		rst<=1;
		#10;
		rst<=0;
		#10;
		rst<=1;
		#10;
		BPushIn<=0;
		#40;
		BPushIn<=1;
	end

endmodule

		
