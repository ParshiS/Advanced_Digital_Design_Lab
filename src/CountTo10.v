//Course: ECE 6370
//Author: 8179
//Title: CountTo10
//Description: Counts values from 0 to 10 when the counter input 
//is high. Produces single cycle pulse when CounterOut reaches 10. Retains the CounterOut value when 
//CounterIn becomes low.
//Trial #1, 3/18/19

module CountTo10( CounterIn, CounterOut, TimeOut, clk, rst);
	input CounterIn, clk, rst;

	output [3:0] CounterOut;
	reg [3:0] CounterOut;
	output TimeOut;	
	reg TimeOut;

	always@(posedge clk)
		begin
		if(rst==0)
			begin
			TimeOut <=0; 
			CounterOut <=0;
			end
		else
			begin 
			if(CounterIn==1)
				begin
				if(CounterOut>=9)
					begin
					TimeOut <=1'b1;
					CounterOut <=0;
					end
				else
					begin
					TimeOut <=0;
					CounterOut <= CounterOut+1'b1;
					end
				end
			else
				begin
				TimeOut <=0;
				CounterOut<=CounterOut;
				end
			end 
		end
endmodule 