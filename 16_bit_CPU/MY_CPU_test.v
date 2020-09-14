module MY_CPU_test;

	reg clk,nRESET;
		integer i;
	/* clock generator */ 
	always 
		#2.5 clk = ~clk;
		
		
	/* tiny cpu*/
		MY_CPU icpu (clk,nRESET);
	initial begin

		$readmemb("B:\\intelFPGA__lite\\19.1\\MY_CPU\\my_program.txt", icpu.imem.mem);
		clk = 1'b0; nRESET =1'b1;
		#5 nRESET = 1'b0;
		#5 nRESET =1'b1;

		for (i=0; i<20; i = i + 1)
			$display("mem: %b", icpu.imem.mem[i]);

		#1000
		$finish; 
	end
	
endmodule