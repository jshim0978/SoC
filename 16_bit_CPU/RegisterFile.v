module RegisterFile (clk, nRESET, write_en, write_addr, write_data, read_addrA,read_addrB, read_dataA,read_dataB);
	input clk,nRESET, write_en;
	input [3:0] write_addr, read_addrA, read_addrB;
	input [15:0] write_data;
	output [15:0] read_dataA, read_dataB;
	reg [15:0] reg_0, reg_1, reg_2, reg_3,
				  reg_4, reg_5, reg_6, reg_7,
				  reg_8, reg_9, reg_10, reg_11,
				  reg_12, reg_13, reg_14, reg_15;
	wire [15:0] decode_out;
	wire [15:0] reg_en; 
	assign decode_out = 
		(write_addr == 4'b0000) ? 16'b0000000000000001:
		(write_addr == 4'b0001) ? 16'b0000000000000010:
		(write_addr == 4'b0010) ? 16'b0000000000000100:
		(write_addr == 4'b0011) ? 16'b0000000000001000:
		(write_addr == 4'b0100) ? 16'b0000000000010000:
		(write_addr == 4'b0101) ? 16'b0000000000100000:
		(write_addr == 4'b0110) ? 16'b0000000001000000:
		(write_addr == 4'b0111) ? 16'b0000000010000000:
		(write_addr == 4'b1000) ? 16'b0000000100000000:
		(write_addr == 4'b1001) ? 16'b0000001000000000:
		(write_addr == 4'b1010) ? 16'b0000010000000000:
		(write_addr == 4'b1011) ? 16'b0000100000000000:
		(write_addr == 4'b1100) ? 16'b0001000000000000:
		(write_addr == 4'b1101) ? 16'b0010000000000000:
		(write_addr == 4'b1110) ? 16'b0100000000000000:
		(write_addr == 4'b1111) ? 16'b1000000000000000:16'bx;
	assign reg_en[0] = write_en & decode_out[0];
	assign reg_en[1] = write_en & decode_out[1];
	assign reg_en[2] = write_en & decode_out[2];
	assign reg_en[3] = write_en & decode_out[3];
	assign reg_en[4] = write_en & decode_out[4];
	assign reg_en[5] = write_en & decode_out[5];
	assign reg_en[6] = write_en & decode_out[6];
	assign reg_en[7] = write_en & decode_out[7];
	assign reg_en[8] = write_en & decode_out[8];
	assign reg_en[9] = write_en & decode_out[9];
	assign reg_en[10] = write_en & decode_out[10];
	assign reg_en[11] = write_en & decode_out[11];
	assign reg_en[12] = write_en & decode_out[12];
	assign reg_en[13] = write_en & decode_out[13];
	assign reg_en[14] = write_en & decode_out[14];
	assign reg_en[15] = write_en & decode_out[15];
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_0 <= 16'b0;
		else if (reg_en[0])
			reg_0 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_1 <= 16'b0;
		else if (reg_en[1])
			reg_1 <= write_data;	
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_2 <= 16'b0;
		else if (reg_en[2])
			reg_2 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_3 <= 16'b0;
		else if (reg_en[3])
			reg_3 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_4 <= 16'b0;
		else if (reg_en[4])
			reg_4 <= write_data;		
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_5 <= 16'b0;
		else if (reg_en[5])
			reg_5 <= write_data;		
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_6 <= 16'b0;
		else if (reg_en[6])
			reg_6 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_7 <= 16'b0;
		else if (reg_en[7])
			reg_7 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_8 <= 16'b0;
		else if (reg_en[8])
			reg_8 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_9 <= 16'b0;
		else if (reg_en[9])
			reg_9 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_10 <= 16'b0;
		else if (reg_en[10])
			reg_10 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_11 <= 16'b0;
		else if (reg_en[11])
			reg_11 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_12 <= 16'b0;
		else if (reg_en[12])
			reg_12 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_13 <= 16'b0;
		else if (reg_en[13])
			reg_13 <= write_data;		
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_14 <= 16'b0;
		else if (reg_en[14])
			reg_14 <= write_data;
	always @ (posedge clk or negedge nRESET)
		if(!nRESET)
			reg_15 <= 16'b0;
		else if (reg_en[15])
			reg_15 <= write_data;
	assign read_dataA = 
	(read_addrA == 4'b0000) ? reg_0 :
	(read_addrA == 4'b0001) ? reg_1 :
	(read_addrA == 4'b0010) ? reg_2 :
	(read_addrA == 4'b0011) ? reg_3 :
	(read_addrA == 4'b0100) ? reg_4 :
	(read_addrA == 4'b0101) ? reg_5 :
	(read_addrA == 4'b0110) ? reg_6 :
	(read_addrA == 4'b0111) ? reg_7 :
	(read_addrA == 4'b1000) ? reg_8 :
	(read_addrA == 4'b1001) ? reg_9 :
	(read_addrA == 4'b1010) ? reg_10 :
	(read_addrA == 4'b1011) ? reg_11 :
	(read_addrA == 4'b1100) ? reg_12 :
	(read_addrA == 4'b1101) ? reg_13 :
	(read_addrA == 4'b1110) ? reg_14 :
	(read_addrA == 4'b1111) ? reg_15 :16'bx;
	assign read_dataB = 
	(read_addrB == 4'b0000) ? reg_0 :
	(read_addrB == 4'b0001) ? reg_1 :
	(read_addrB == 4'b0010) ? reg_2 :
	(read_addrB == 4'b0011) ? reg_3 :
	(read_addrB == 4'b0100) ? reg_4 :
	(read_addrB == 4'b0101) ? reg_5 :
	(read_addrB == 4'b0110) ? reg_6 :
	(read_addrB == 4'b0111) ? reg_7 :
	(read_addrB == 4'b1000) ? reg_8 :
	(read_addrB == 4'b1001) ? reg_9 :
	(read_addrB == 4'b1010) ? reg_10 :
	(read_addrB == 4'b1011) ? reg_11 :
	(read_addrB == 4'b1100) ? reg_12 :
	(read_addrB == 4'b1101) ? reg_13 :
	(read_addrB == 4'b1110) ? reg_14 :
	(read_addrB == 4'b1111) ? reg_15 :16'bx;
endmodule