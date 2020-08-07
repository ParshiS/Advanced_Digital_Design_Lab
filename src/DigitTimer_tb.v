// Course Number: ECE6370
//Name : Parshi Srinidhi, 8179
//Digit Timer module
//Trial #1, 3/19/19

module DigitTimer_tb();

reg clk, rst, TensInpLoad, UnitsInpLoad, OneSecDec;
reg [3:0] UnitsBinaryInp, TensBinaryInp;
wire FinTOut;
wire [3:0] TensBinaryOut, UnitsBinaryOut;

DigitTimer DUT(clk, rst, TensBinaryInp, UnitsBinaryInp, TensInpLoad, UnitsInpLoad, OneSecDec, TensBinaryOut, UnitsBinaryOut, FinTOut);

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
			TensBinaryInp <= 2;
			UnitsBinaryInp <=9;
			TensInpLoad <= 1;
			UnitsInpLoad <=1;
			@ (posedge clk);
			TensInpLoad <= 0;
			UnitsInpLoad <=0;
			OneSecDec <= 1;
			#500;
			OneSecDec <= 0;

		end

endmodule
