// Course Number: ECE 6370 
// Author: 8179 
//Verification module
// This verifies and keeps score. 

module verification(clk, rst, sum, LoadRN, LoadPlayer,  ScoreT, ScoreU, GLED, RLED);

input clk, rst;
input LoadPlayer, LoadRN;
input[3:0] sum;
output  GLED, RLED;
output [3:0] ScoreT, ScoreU;

reg  GLED, RLED;
reg [3:0] ScoreT, ScoreU;

parameter WAIT = 2'b00, SCORE = 2'b01, NEXTRN = 2'b10;

reg[1:0] STATE;

always@(posedge clk) 
	begin		
	if(rst == 0)
		begin
		ScoreT <= 0;
		ScoreU <= 0;
		GLED<=0; RLED<=1;
		end
	else 
	   	begin
		case(STATE)
			WAIT: 
				begin
				if(LoadPlayer == 1)
					STATE <= SCORE;
				else
					STATE <= WAIT;
				end
			SCORE: 
				begin
				if( sum == 4'b1111 )
					begin
					GLED<=1; RLED<=0;
					if( ScoreU == 9)
						begin
						ScoreU <= 0;
						ScoreT <= ScoreT + 1'b1;
						end
					else
						begin
						ScoreU <= ScoreU + 1'b1;
						ScoreT <= ScoreT;
						end
					STATE <= NEXTRN;
					end
				else
					begin
					GLED<=0; RLED<=1;
					ScoreU <= ScoreU;
					ScoreT <= ScoreT;
					STATE <= NEXTRN;
					end
				end

			NEXTRN: 
				begin
				ScoreU <= ScoreU;
				ScoreT <= ScoreT;
				if(LoadRN == 0)
					STATE <= WAIT;
				else
					STATE <= NEXTRN;
				end
			default:
				begin
				ScoreT <= 0;
				ScoreU <= 0;
				STATE <= WAIT;
				end
			endcase				   					   									
	   		end
	  end

endmodule
