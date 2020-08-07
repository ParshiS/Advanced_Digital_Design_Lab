// Course Number: ECE6370
//Name : Parshi Srinidhi, 8179
//Digit Timer module
//Trial #1, 3/19/19

module DigitTimer (clk, rst, TensBinaryInp, UnitsBinaryInp, TensInpLoad, UnitsInpLoad, OneSecDec, TensBinaryOut, UnitsBinaryOut, FinTOut);

input clk, rst, TensInpLoad, UnitsInpLoad, OneSecDec;
input [3:0] TensBinaryInp, UnitsBinaryInp;
output [3:0] TensBinaryOut, UnitsBinaryOut;
output FinTOut;

wire UBorrowReq, TOut, TBorrowReq;

SingleDigitTimer Units(clk, rst, UnitsBinaryInp, UnitsInpLoad, TOut, OneSecDec, UnitsBinaryOut, UBorrowReq, FinTOut);
SingleDigitTimer Tens(clk, rst, TensBinaryInp, TensInpLoad,1'b1, UBorrowReq, TensBinaryOut, TBorrowReq, TOut);
		
endmodule
