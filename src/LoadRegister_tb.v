//ECE6370
//Author: 8179
//Load Register Test bench Module
// This module loads four bit input to the output when "Load" signal is high.
// Trial #1, 2/7/19

`timescale 1ns/100ps

module LoadRegister_tb();
	reg [3:0] inp;
	reg clk, rst, Load;
	wire [3:0] out;
	LoadRegister LoadRegister_1(inp, rst, clk, Load, out);
	
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
			rst<=1;
			#10;
			rst<=0;
			#10;
			rst<=1;
			#10;
			Load<=1;
			#10;
			inp<=4'b0111;
			#20;
			inp<=4'b1010;
			#30;
			rst<=0;
			#10;
			rst<=1;
			inp<=4'b0011;
			#20;
			Load<=0;
			inp<=4'b0110;
			#10;
			inp<=4'b0000;
			#10;
			rst<=0;
			Load<=0;
		end
endmodule

