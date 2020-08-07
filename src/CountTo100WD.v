
//Course: ECE 6370
//Author: 8179
//Title: CountTo100
//Description: This module counts values from 0 to 100 when CounterIn is high. 
//Produces single cycle pulse when CountOutp is 100
// and retains the CountOutp value when CounterIn becomes low.
//Trial #1, 3/18/19

module CountTo100WD( CounterIn, enable, CountOutp, TimeOut, clk, rst);
	input CounterIn, clk, rst, enable;

	output [6:0] CountOutp;
	reg [6:0] CountOutp;
	output TimeOut;	
	reg TimeOut;
	
	always@(posedge clk)
		begin
			if(rst==0)
				begin 
				CountOutp <=0;
				TimeOut <=0;
				end
			else
			begin
				if (enable ==1)
				begin 
				if(CounterIn==1)
					begin
					if(CountOutp>=99)
						begin
						CountOutp <=0;
						TimeOut <=1;
						end
					else
						begin
						CountOutp <= CountOutp+1'b1;
						TimeOut <=0;
						end
					end
				else
					begin
					CountOutp<=CountOutp;
					TimeOut <=0;
					end 
				end
				else
				begin
					CountOutp<=0;
					TimeOut <=0;
				end 
		end
		end
endmodule 

