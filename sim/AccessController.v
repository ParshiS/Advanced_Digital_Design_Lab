
// ECE 6370 
// Author: 8179
// AccessController
// ROM Based Access Controller

module AccessController(PassInp, clk, rst, LoadPassNumber, GLed, RLed, PwdDisp, LogOut);

	input [3:0] PassInp;
	input clk, rst, LoadPassNumber, LogOut;
	output GLed, RLed;
	output [3:0] PwdDisp;
        

	reg LoadRndNumOut, LoadPlayer2Out, GLed, RLed, StrtOneSec, StrtDigTimer;
	reg [3:0] PwdDisp;
	reg [5:0] STATE;
	//reg so_far_so_good;
        //reg SoFarSoGood, OneSec;
	//wire timeout,CounterOut;



	reg[1:0] ROMAddr;
	reg[15:0] ROMStoredPWD, ROMEnterPWD;
	wire[3:0] ROMData;
	
	
	parameter FrstPWDDig = 0, SecPWDDig = 1, ThdPWDDig = 2, FourPWDDig = 3, FetchFrstDig = 4, FirstWaitDig1 = 5,  SecWaitDig1 = 6,
	CatchDig1 = 7, FetchSecDig = 8, FirstWaitDig2 = 9,  SecWaitDig2 = 10, CatchDig2 = 11, FetchThdDig = 12, Firstwaitdig3 = 13, 
	Secwaitdig3 = 14, CatchDig3 = 15, FetchFourDig = 16, FirstWaitDig4 = 17,  SecWaitDig4 = 18, CatchDig4 = 19, AUTH = 20, LOGOUT=21;

	ROM Test(ROMAddr ,clk , ROMData);
	//TimerOneSecondWD DUTTime(OneSec, clk, rst, CounterOut, timeout);

	always @(posedge clk)
	  begin
	    
	    if(rst == 0)
	       begin
                 //LoadRndNumOut<=1'b1;
		 //LoadPlayer2Out<=1'b0;
		 //so_far_so_good<=1'b0;
		 //StrtDigTimer<=0;
		 //StrtOneSec<=0;
		 RLed<=1'b1; GLed<=1'b0;
		 PwdDisp <=4'b1111;
		 ROMStoredPWD <= 0;
		 ROMEnterPWD <= 0;
		 ROMAddr <= 0;
		 STATE <= FrstPWDDig;
	       end
	    else
	       begin
		 case(STATE)


		   FrstPWDDig:
			begin
			  if(LoadPassNumber == 1)
			     begin
				ROMEnterPWD[15:12] <= PassInp;
				STATE <= SecPWDDig;
			     end
			  else
			     begin
				STATE <= FrstPWDDig;
			     end
			end 

		   SecPWDDig:
			begin
			  if(LoadPassNumber == 1)
			     begin
				ROMEnterPWD[11:8] <= PassInp;
				STATE <= ThdPWDDig;
			     end
			  else
			     begin
				STATE <= SecPWDDig;
			     end
			end 

		   ThdPWDDig:
			begin
			  if(LoadPassNumber == 1)
			     begin
				ROMEnterPWD[7:4] <= PassInp;
				STATE <= FourPWDDig;
			     end
			  else
			     begin
				STATE <= ThdPWDDig;
			     end
			end 

		   FourPWDDig:
			begin
			  if(LoadPassNumber == 1)
			     begin
				PwdDisp <= PassInp;
				ROMEnterPWD[3:0] <= PassInp;
				STATE <= FetchFrstDig;
			     end
			  else
			     begin
				STATE <= FourPWDDig;
			     end
			end 

		   FetchFrstDig:
			begin
			  ROMAddr <= 0;
			  STATE <= FirstWaitDig1;
			end 

		   FirstWaitDig1:
			begin
			  STATE <= SecWaitDig1;
			end 

		   SecWaitDig1:
			begin
			  STATE <= CatchDig1;
			end 

		   CatchDig1:
			begin
			  ROMStoredPWD[15:12] = ROMData;
			  STATE <= FetchSecDig;
			end 

		   FetchSecDig:
			begin
			  ROMAddr <= ROMAddr + 1;
			  STATE <= FirstWaitDig2;
			end 

		   FirstWaitDig2:
			begin
			  STATE <= SecWaitDig2;
			end 

		   SecWaitDig2:
			begin
			  STATE <= CatchDig2;
			end 

		   CatchDig2:
			begin
			  ROMStoredPWD[11:8] = ROMData;
			  STATE <= FetchThdDig;
			end 

		   FetchThdDig:
			begin
			  ROMAddr <= ROMAddr + 1;
			  STATE <= Firstwaitdig3;
			end 

		   Firstwaitdig3:
			begin
			  STATE <= Secwaitdig3;
			end 

		   Secwaitdig3:
			begin
			  STATE <= CatchDig3;
			end 

		   CatchDig3:
			begin
			  ROMStoredPWD[7:4] = ROMData;
			  STATE <= FetchFourDig;
			end 

		   FetchFourDig:
			begin
			  ROMAddr <= ROMAddr + 1;
			  STATE <= FirstWaitDig4;
			end 

		   FirstWaitDig4:
			begin
			  STATE <= SecWaitDig4;
			end 

		   SecWaitDig4:
			begin
			  STATE <= CatchDig4;
			end 

		   CatchDig4:
			begin
			  ROMStoredPWD[3:0] = ROMData;
			  STATE <= AUTH;
			end 

		   AUTH:
			begin
			  if( ROMEnterPWD == ROMStoredPWD)
			     begin
		 		RLed <= 1'b0; GLed <= 1'b1;
                                //so_far_so_good <= 1'b1;
				STATE <= LOGOUT;
			     end
			  else
			     begin
				STATE <= AUTH;
			     end
			end 

                   LOGOUT:
                       
			begin
			  if( LogOut == 1)
			     begin
				STATE <= FrstPWDDig;
		 	  	ROMAddr <= 0;
		 	  	RLed <= 1'b1; GLed <= 1'b0;
		 	  	PwdDisp <= 4'b1111;
		 	  	ROMStoredPWD <= 0;
		 	  	ROMEnterPWD<= 0;

			     end
			  else
			     begin
				STATE <= LOGOUT;
			     end
			end
                    default:
			begin
		 	   STATE <= FrstPWDDig;
		 	   ROMAddr<= 0;
		 	   RLed<= 1'b1;GLed<= 1'b0;
		 	   PwdDisp <= 4'b1111;
		 	   ROMStoredPWD<= 0;
		 	   ROMEnterPWD<= 0;


			end
               endcase
        end
    end
endmodule 