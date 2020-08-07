//Course: ECE 6370
//Author:8179
//Timer1ms
//A 1ms timer which produces a timeout signal.
//Trial #1, 3/18/19

module Timer1ms( en, Count, TimeOut, clk, rst);
	input en, clk, rst;
	output [15:0] Count;
	reg [15:0] Count;
	output TimeOut;	
	reg TimeOut;

	always@(posedge clk)
		begin
		if(rst==0)
			begin
			TimeOut <=0; 
			Count <=0;
			end
		else
			begin 
			if(en==1)
				begin
				if(Count>=49999)
					begin
					TimeOut <=1;
					Count <=0;
					end
				else
					begin
					TimeOut <=0;
					Count <= Count+1'b1;
					end
				end
			else
				begin
				Count <= 0;		
				end
			end 
		end
endmodule 