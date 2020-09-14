module FSM_top(nReset, clk, in, out_mealy, out_moore);

	input nReset, clk, in;

	output out_mealy, out_moore;

	mealy_sd my_mealy(.nReset(nReset), .clk(clk), .in(in),.out(out_mealy));
	moore_sd my_mooore(.nReset(nReset), .clk(clk), .in(in),.out(out_moore));
	
	

endmodule