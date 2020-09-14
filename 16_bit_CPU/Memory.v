`define READ 1'b0
`define WRITE 1'b1

/* simulation model; not for synthesis */
module Memory (clk, op, addr, data);
	input clk;
	input op; // READ or WRITE
	input [15:0] addr;
	output [15:0] data;

	reg [7:0] mem [0:65535]; 
	
	/* Read */
	assign data = {mem[addr+1], mem[addr]};
	
//	always @(posedgeclk)
//		if(op==`WRITE)	{mem[addr + 1], mem[addr]} <= data;
//	
endmodule 