// Course Number: ECE6370
//Name : Parshi Srinidhi, 8179
//Digit Timer module
//Trial #1, 3/19/19

module SingleDigitTimer (clk, rst, binaryInp, InpLoad,NoBorrow, Decrement, binaryOut, borrowReq, TOut);
input clk, rst;
input [3:0] binaryInp;
input InpLoad;
input NoBorrow, Decrement;

output [3:0] binaryOut;
output borrowReq, TOut;
	
reg [3:0] binaryOut;
reg borrowReq, TOut;
	
always@(posedge clk)
	begin
	if(rst==0)
		begin
		binaryOut <=4'b0000;
		borrowReq <=0;
		TOut <=0;
		end 
	else 
		begin
		if(InpLoad==1)
			begin 
			borrowReq<=0;
			TOut<=0;
			if(binaryInp > 4'b1001)
				begin 
				binaryOut<=4'b1001;
				end
			else
				begin
				binaryOut<=binaryInp;
				end 
			end
		else 		
			begin
			if(Decrement==1)
				begin
				if(binaryOut==4'b0000)
					begin
					if(NoBorrow==0)
						begin
						binaryOut<=4'b1001;
						borrowReq<=1;
						TOut<=0;
						end
					else 
						begin
						binaryOut<=4'b0000;
						borrowReq<=0;
						TOut<=1;
						end
					end  
				else if (binaryOut<=4'b0001)
					begin
					if(NoBorrow==1)
						begin
						binaryOut<=4'b0000;
						borrowReq<=0;
						TOut<=1;
						end
					else
						begin 
						binaryOut<=binaryOut-1;
						borrowReq<=0;
						TOut<=0;
						end
					end
				else
					begin
					binaryOut<=binaryOut-1;
					borrowReq<=0;
					TOut<=0;
					end 
				end
			else
				begin
                               		if( NoBorrow == 1 && binaryOut == 0 )
					    	begin
						binaryOut <= 0;
						TOut <= 1;
						borrowReq <= 0;
					    	end	
                              		else
                                      		begin
						TOut <= TOut;
						binaryOut <= binaryOut;
						borrowReq <= 0;	
                                       		end
				end
			end //end of else block of InpLoad==1// 
		end //else of rst end
	end // always end
endmodule
