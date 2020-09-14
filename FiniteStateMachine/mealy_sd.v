`define INIT 4'b0000
`define ONE 4'b0001
`define TWO 4'b0010
`define THREE 4'b0011
`define FOUR 4'b0100
`define FIVE 4'b0101
`define SIX 4'b0110
`define SEVEN 4'b0111
`define EIGHT 4'b1000


module mealy_sd (nReset, clk, in, out);

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
		`INIT:begin
			if(in == 0) begin
				NextState = `ONE;
				out = 1'b0;
			end
			else begin
				NextState = `FIVE;
				out = 1'b0;
			end
		end
		`ONE: begin
			if(in == 0) begin
				NextState = `TWO;
				out = 1'b0;
			end
			else begin
				NextState = `FIVE;
				out = 1'b0;
			end
		end
		`TWO: begin
			if(in == 0) begin
				NextState = `THREE;
				out = 1'b0;
			end
			else begin
				NextState = `FIVE;
				out = 1'b0;
			end
		end		
		`THREE: begin
			if(in == 0) begin
				NextState = `FOUR;
				out = 1'b1;
			end
			else begin
				NextState = `FIVE;
				out = 1'b0;
			end
		end
		`FOUR: begin
			if(in == 0) begin
				NextState = `FOUR;
				out = 1'b1;
			end
			else begin
				NextState = `FIVE;
				out = 1'b0;
			end
		end
		`FIVE: begin
			if(in == 0) begin
				NextState = `ONE;
				out = 1'b0;
			end
			else begin
				NextState = `SIX;
				out = 1'b0;
			end
		end
		`SIX: begin
			if(in == 0) begin
				NextState = `ONE;
				out = 1'b0;
			end
			else begin
				NextState = `SEVEN;
				out = 1'b0;
			end
		end
		`SEVEN: begin
			if(in == 0) begin
				NextState = `ONE;
				out = 1'b0;
			end
			else begin
				NextState = `EIGHT;
				out = 1'b1;
			end
		end
		
		`EIGHT: begin
			if(in == 0) begin
				NextState = `ONE;
				out = 1'b0;
			end
			else begin
				NextState = `EIGHT;
				out = 1'b1;
			end
		end
		
		default: begin
			NextState = `INIT;
			out = 1'b0;
		end
	endcase
endmodule