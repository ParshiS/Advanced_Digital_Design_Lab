//ECE6370
// Author: 8179
//Game Control Module
//Password Controlled access
//Trial #1, 3/20/19
 
module GameController(SuccessAuth, clk, rst, LoadRndNum, LoadPassNumber, LoadPlayer2In, FTout, LogOut,  LoadRndNumOut, LoadPlayer2Out, StrtOneSec, StrtDigTimer);

	input clk, rst, LoadRndNum, LoadPlayer2In, FTout, SuccessAuth, LoadPassNumber;
	output LoadRndNumOut, LoadPlayer2Out, StrtOneSec, StrtDigTimer, LogOut;
	//output [3:0]PwdDisp;
	reg LoadRndNumOut, LoadPlayer2Out, StrtOneSec, StrtDigTimer, LogOut;
	//reg [3:0] PwdDisp;
	reg [3:0] STATE;
	//reg SoFarSoGood;
	reg OneSec;
	wire timeout,CounterOut;

	
	TimerOneSecondWD DUTTimez(OneSec, clk, rst, CounterOut, timeout);

	parameter  AUTH_STATE=4'b0100, STIMER=4'b0101, WAIT=4'b0110,
TIMEOUT=4'b0111, STRTOVER=4'b1000, PAUSE = 4'b1001, RESUME = 4'b1010, BEGINAGN=4'b1011, LOG_OUT=4'b1100, PWD_WAIT=4'b1101;
	
	always @(posedge clk)
		begin
		if ( rst == 1'b0 )
			begin
				STATE<=AUTH_STATE;
				LoadRndNumOut<=1'b1;
				LoadPlayer2Out<=1'b0;
				//RLed<=1'b1; GLed<=1'b0;
				//SoFarSoGood<=1'b1;
				StrtDigTimer<=0;
				StrtOneSec<=0;
				LogOut<=0;
				//PwdDisp <=4'b1111; //Displays F on Seven segment, indicating reset
				OneSec<=1'b0;
			end
		else begin

		case(STATE)
			AUTH_STATE: begin
				      StrtDigTimer<=0;
				      StrtOneSec<=0;	
				      if (SuccessAuth == 1'b1)
						begin
							//RLed<=1'b0; GLed<=1'b1;
							if (LoadPassNumber == 1'b1)
								begin
				 					STATE<=STIMER;
									LoadRndNumOut<=1'b1;
									StrtDigTimer<=1;
								end
							else
								begin
									STATE<=AUTH_STATE;
								end				 		
						end
				      else
						begin
							if (rst == 1'b0)
								begin
								STATE<=AUTH_STATE;
								LoadRndNumOut<=1'b1;
								LoadPlayer2Out<=1'b0;
								//RLed<=1'b1; GLed<=1'b0;
								//SoFarSoGood<=1'b1;
								//PwdDisp <=4'b1111;
								StrtDigTimer<=0;
								StrtOneSec<=0;
								LogOut<=0;				
								end
							else 
								begin
								STATE<=AUTH_STATE;
								end
						end
				
				end
			STIMER: 
				begin
					StrtDigTimer<=0;
					if (LoadPassNumber == 1'b1)
						begin
		 					STATE<=WAIT;
							StrtOneSec<=1;
							LoadRndNumOut<=LoadRndNum;
							LoadPlayer2Out<=LoadPlayer2In;
						end
					else
						begin
							STATE<=STIMER;
						end
				end
			WAIT:
				begin
					OneSec=1'b1;
					LoadRndNumOut<=LoadRndNum;
					LoadPlayer2Out<=LoadPlayer2In;
					if (FTout==1'b1)
						begin
							StrtOneSec<=0;
							STATE<=TIMEOUT;
							LoadRndNumOut<=1'b1;
				 			LoadPlayer2Out<=1'b0;
						end	
					else
						begin
///////////////////////////////////////////////////////////
							if (LoadPassNumber  == 1)
								begin
									STATE<=PAUSE;
									OneSec=1'b0;
								end
							else
								begin
									STATE <= WAIT;
								end
						end
				end
			PAUSE:// PAUSE State, Author:8179
			begin
				StrtOneSec<= 0;
				LoadRndNumOut<=1'b1;
	 			LoadPlayer2Out<=1'b0;
				OneSec=1'b1;
				if(timeout==1)
					begin
						STATE<= RESUME;
					end
				else
					begin
						if (LoadPassNumber  == 1)
							begin
								OneSec=1'b0;
								STATE<= BEGINAGN;
							end
						else
							begin
								STATE <= PAUSE;
							end
					end
					
						
			end
		    RESUME://RESUME state, Author: 8179
			begin
				StrtOneSec<= 1'b0;
				if (LoadPassNumber == 1)
					begin
						OneSec=1'b0;
						STATE <= WAIT;
						StrtOneSec<= 1'b1;
					end
				else
					begin
						STATE <= RESUME;
					end
			end
		    BEGINAGN://BEGINAGN, Author: 8179
			begin
				StrtOneSec<= 1'b0;
				OneSec<=1'b1;
				if (timeout ==1)
					begin
						STATE<= TIMEOUT;
					end
				else
					begin
						if (LoadPassNumber  == 1)
							begin
								OneSec<=1'b1;
								STATE <= LOG_OUT;
							end
						else
							begin
							STATE <= BEGINAGN;
							end
					end
			end
		    LOG_OUT: //LOG_OUT state, Author: 8179
			begin
				STATE<=PWD_WAIT;
				LoadRndNumOut<=1'b1;
				LoadPlayer2Out<=1'b0;
				//RLed<=1'b1; GLed<=1'b0;
				//SoFarSoGood<=1'b1;
				StrtDigTimer<=0;
				StrtOneSec<=0;
				//PwdDisp <=4'b1111;
				OneSec<=1'b0;
				LogOut<=1;
			end
//////////////////////////////////////////////////////////////
			TIMEOUT:
				begin
					if (LoadPassNumber == 1'b1)
						begin
		 					STATE<=STRTOVER;
							StrtDigTimer<=1;
						end
					else
						begin
							STATE<=TIMEOUT;
						end
				end
			STRTOVER:
				begin
					StrtDigTimer<=0;
					if (LoadPassNumber == 1'b1)
						begin
		 					STATE<=WAIT;
							StrtOneSec<=1;
							LoadRndNumOut<=LoadRndNum;
							LoadPlayer2Out<=LoadPlayer2In;
						end
					else
						begin
							STATE<=STRTOVER;
						end
				end
			PWD_WAIT:
                                 begin
                                      LogOut<= 0;
                                      STATE<= AUTH_STATE;
                                 end 
			default: begin
				 STATE<=AUTH_STATE;
				 LoadRndNumOut<=1'b1;
				 LoadPlayer2Out<=1'b0;
				 //RLed<=1'b1; GLed<=1'b0;
				 //SoFarSoGood<=1'b1;
				 StrtDigTimer<=0;
				 StrtOneSec<=0;
				 //PwdDisp <=4'b1111;
				 OneSec<=1'b0;
				 LogOut<=0;
				 end
		endcase		
		end		
		end
endmodule 


