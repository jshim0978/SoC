`timescale 1ns/100ps

module register_tb;

	reg clk, nRESET, write_en;
	reg [3:0] write_addr, read_addrA, read_addrB;
	reg [15:0] write_data;
	
	wire [15:0] read_dataA, read_dataB;
	
	register register(.clk(clk), 
							.nRESET(nRESET), 
							.write_en(write_en), 
							.write_addr(write_addr), 
							.write_data(write_data), 
							.read_addrA(read_addrA), 
							.read_addrB(read_addrB), 
							.read_dataA(read_dataA), 
							.read_dataB(read_dataB));
							
	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	initial begin
		nRESET = 1;
		#5;
		nRESET = 0;
		#5;
		nRESET = 1;
		#5;
		
		write_en = 1;
		write_addr = 4'b0000;
		write_data = 16'b1001011010010110;
		
		#10;
		
		write_en = 0;
		read_addrA = 4'b0000;
		read_addrB = 4'b0001;
		
		#10;
	
		
		$finish;
		
	end
endmodule
		