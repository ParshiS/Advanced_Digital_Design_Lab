//ECE6370
//Author: 8179
//Module code for Button Shaper
// This module uses State Machines to give out a single cycle clock pulse.
//Trial #1, 2/12/2019

module ButtonShaper(BPushIn, rst, clk,  BPushO);

input BPushIn;
input  rst, clk;
output BPushO;
reg BPushO;

parameter InitialState=0, PulseState=1, WaitState=2;

reg [1:0] CurrState, NxtState;
 
always @(BPushIn, CurrState)
	begin
		case(CurrState)
			InitialState: 
				begin 
					BPushO <=0;
					if (BPushIn ==0) 
						begin 
							NxtState <= PulseState;
						end
					else
						begin
							NxtState <= InitialState;
						end 
				end
			PulseState:
				begin 
					BPushO <=1;
					NxtState <= WaitState;
		      		end
			WaitState: 
				begin 
					BPushO <=0;
					if (BPushIn ==0)
						begin
							NxtState <= WaitState;
						end 
					else 
						begin
							NxtState <= InitialState;
						end
				end 
			default: 
				begin
					NxtState <= InitialState;
				 end
		endcase 
	end

always @ (posedge clk)
	begin
		if (rst ==0)
			begin
				CurrState <= InitialState;
			end
		else
			begin
				CurrState <= NxtState;
			end
	
	end	
endmodule
