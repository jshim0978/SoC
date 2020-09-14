`define INIT 4'b0000
`define ONE 4'b0001
`define TWO 4'b0010
`define THREE 4'b0011
`define FOUR 4'b0100
`define FIVE 4'b0101
`define SIX 4'b0110
`define SEVEN 4'b0111
`define EIGHT 4'b1000



module moore_sd (nReset, clk, in, out);

input in , nReset, clk;
output out;

reg [3:0] CurState, NextState; 
reg out; // out is reg in FSM

//flip flop start
always @ (posedge clk or negedge nReset)
	if(!nReset) CurState <= `INIT;
	else CurState <= NextState;
//ff end	

//combination logic
always @ (CurState or in)
	casex (CurState)
		`INIT: begin
			if(in == 0) NextState = `ONE;
			
			else NextState = `FIVE;
			
			out = 1'b0;
		end
		`ONE: begin
			if(in == 0) NextState = `TWO;

			else NextState = `FIVE;
				
			out = 1'b0;
		end
		`TWO: begin
			if(in == 0) NextState = `THREE;
			
			else NextState = `FIVE;		
			
			out = 1'b0;
		end
		`THREE: begin
			if(in == 0) NextState = `FOUR;
			
			else NextState = `FIVE;		
			
			out = 1'b0;
		end
		`FOUR: begin
			if(in == 0) NextState = `FOUR;
			
			else NextState = `FIVE;		
			
			out = 1'b1;
		end
		`FIVE: begin
			if(in == 0) NextState = `ONE;
			
			else NextState = `SIX;		
			
			out = 1'b0;
		end
		`SIX: begin
			if(in == 0) NextState = `ONE;
			
			else NextState = `SEVEN;		
			
			out = 1'b0;
		end
		`SEVEN: begin
			if(in == 0) NextState = `ONE;
			
			else NextState = `EIGHT;		
			
			out = 1'b0;
		end
		`EIGHT: begin
			if(in == 0) NextState = `ONE;
			
			else NextState = `EIGHT;		
			
			out = 1'b1;
		end
		default: begin
			NextState = `INIT;
			out = 1'b0;
		end
	endcase
endmodule