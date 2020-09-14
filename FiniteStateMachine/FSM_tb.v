`timescale 1ns/100ps

module FSM_tb;

	reg clk,nReset,in;
	
	wire out_mealy, out_moore;
	
	always
		#2.5clk = ~clk;
		
	FSM_top myFSM( .out_mealy(out_mealy), .out_moore(out_moore),
						.nReset(nReset), .clk(clk), .in(in));
						
	initial begin
		clk = 1'b0;
		nReset = 1'b1;
		
		#5 nReset = 1'b0;
		#5 nReset = 1'b1;
		
		in = 1'b1;
		#20 in = 1'b1;
		#20 in = 1'b1;
		#20 in = 1'b1;
		#20 in = 1'b1;
	#20
		#20 in = 1'b0;
		#20 in = 1'b0;
		#20 in = 1'b0;
		#20 in = 1'b0;

		#100
		$finish;
		
		
	end
endmodule