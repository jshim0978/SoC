module cpu2(clk, pc, rst, write_data, read_address1, read_address2, read_enable1, read_enable2,
mem_write_address, mem_read_address, mux_sel, mem_write_enable, mux_data, mem_data, pc_sel,
jump_address, branch_address);

	input clk, rst;
	
	output [7:0] write_data;
	output [5:0] pc;
	output [4:0] read_address1, read_address2;
	output read_enable1, read_enable2;
	output [5:0] mem_write_address, mem_read_address;
	output mux_sel, mem_write_enable;
	output [7:0] mux_data;
	output [7:0] mem_data;
	output [1:0] pc_sel;
	output [5:0] jump_address;
	output [4:0] branch_address;
	
	reg [4:0] read_address1, read_address2, write_address;
	reg [5:0] pc;
	reg [7:0] read_data1, read_data2, imm_data;
	reg [15:0] inst_out;
	reg read_enable1, read_enable2, write_enable, mux_sel;
	reg [5:0] mem_write_address, mem_read_address;
	reg mux_sel, mem_write_enable;
	reg [7:0] mux_data;
	reg [7:0] mem_data;
	reg [1:0] pc_sel;
	reg alu_sel;
	reg func_sel;
	reg [1:0] result_sel;
	reg [5:0] jump_address;
	reg [4:0] branch_address;
	
	// rom_table 모듈 시행
	m_rom_table rom_table(clk, pc, rst, inst_out);
	
	// instruction decoder 모듈 시행
	m_inst_decoder inst_decoder(clk, inst_out, read_address1, read_address2, write_address,
	 read_enable1, read_enable2, write_enable, imm_data, mem_write_address, mem_read_address,
	 mux_sel, mem_write_enable, pc_sel, alu_sel, jump_address, branch_address);
	
	// register 모듈 시행 
	m_register register(clk, rst, read_enable1, read_enable2, write_enable, 
	read_address1, read_address2, write_address, read_data1, read_data2, mux_data, imm_data);
	
	// alu 모듈 시행 func_sel과 result_sel 값은 adder기능을 수행하도록 0과 2'b00을 대입
	m_alu alu(read_data1, read_data2, func_sel, result_sel, write_data, alu_sel);
	
	mem memory(read_data1, mem_write_address, mem_read_address, mem_write_enable, clk, mem_data);
	 
    m_mux mux(write_data, mem_data, mux_data, mux_sel);

	always@(posedge clk)
	begin
		case(pc_sel)
			2'b00 : pc = pc + 1'b1;  // 기본적인 pc값 증가
			2'b01 : pc = jump_address;  // jump일 때
			2'b10 : pc = pc + branch_address;  // branch일 때
		endcase
	end

endmodule

module m_mux(write_data, mem_data, mux_data, mux_sel);

	input [7:0] write_data, mem_data;
	input mux_sel;

	output [7:0] mux_data;
	reg [7:0] mux_data;

	always@(mux_sel)
	begin
		case(mux_sel)
		1'b 0 : mux_data=write_data; 
	    1'b 1 : mux_data=mem_data;
		endcase
	end
	
endmodule



module m_rom_table(clk, pc, rst, inst_out);

	input [5:0] pc;
	input clk, rst;
	
	output [15:0] inst_out;
	
	reg [15:0] inst_out;
	reg [15:0] rom_data[0:63];
	
	always@(posedge clk or negedge rst)
	begin
		if(rst == 1'b0)
		begin
			rom_data[0] = 16'b0000010000000001;  // R-Type(0번 주소 위치에 1 저장)
			rom_data[1] = 16'b0000010000100001;  // R-Type(1번 주소 위치에21 저장)
			rom_data[2] = 16'b0100000000000101;  // jump(5)
			rom_data[3] = 16'b0000010000000001;
			rom_data[4] = 16'b0000010000000001;
			rom_data[5] = 16'b1000110000000000;  // branch(pc+3번 위치로 이동)
			rom_data[6] = 16'b0000010000000001;
			rom_data[7] = 16'b0000010000000001;
			rom_data[8] = 16'b0000010000000001;
			rom_data[9] = 16'b0000010000000001;
			rom_data[10] = 16'b0000010000000001;
			rom_data[11] = 16'b0000010000000001;
			rom_data[12] = 16'b0000010000000001;
			rom_data[13] = 16'b0000010000000001;
			rom_data[14] = 16'b0000010000000001;
			rom_data[15] = 16'b0000010000000001;
			rom_data[16] = 16'b0000010000000001;
			rom_data[17] = 16'b0000010000000001;
			rom_data[18] = 16'b0000010000000001;
			rom_data[19] = 16'b0000010000000001;
			rom_data[20] = 16'b0000010000000001;
			rom_data[21] = 16'b0000010000000001;
			rom_data[22] = 16'b0000010000000001;
			rom_data[23] = 16'b0000010000000001;
			rom_data[24] = 16'b0000010000000001;
			rom_data[25] = 16'b0000010000000001;
			rom_data[26] = 16'b0000010000000001;
			rom_data[27] = 16'b0000010000000001;
			rom_data[28] = 16'b0000010000000001;
			rom_data[29] = 16'b0000010000000001;
			rom_data[30] = 16'b0000010000000001;
			rom_data[31] = 16'b0000010000000001;
			rom_data[32] = 16'b0000010000000001;
			rom_data[33] = 16'b0000010000000001;
			rom_data[34] = 16'b0000010000000001;
			rom_data[35] = 16'b0000010000000001;
			rom_data[36] = 16'b0000010000000001;
			rom_data[37] = 16'b0000010000000001;
			rom_data[38] = 16'b0000010000000001;
			rom_data[39] = 16'b0000010000000001;
			rom_data[40] = 16'b0000010000000001;
			rom_data[41] = 16'b0000010000000001;
			rom_data[42] = 16'b0000010000000001;
			rom_data[43] = 16'b0000010000000001;
			rom_data[44] = 16'b0000010000000001;
			rom_data[45] = 16'b0000010000000001;
			rom_data[46] = 16'b0000010000000001;
			rom_data[47] = 16'b0000010000000001;
			rom_data[48] = 16'b0000010000000001;
			rom_data[49] = 16'b0000010000000001;
			rom_data[50] = 16'b0000010000000001;
			rom_data[51] = 16'b0000010000000001;
			rom_data[52] = 16'b0000010000000001;
			rom_data[53] = 16'b0000010000000001;
			rom_data[54] = 16'b0000010000000001;
			rom_data[55] = 16'b0000010000000001;
			rom_data[56] = 16'b0000010000000001;
			rom_data[57] = 16'b0000010000000001;
			rom_data[58] = 16'b0000010000000001;
			rom_data[59] = 16'b0000010000000001;
			rom_data[60] = 16'b0000010000000001;
			rom_data[61] = 16'b0000010000000001;
			rom_data[62] = 16'b0000010000000001;
			rom_data[63] = 16'b0000010000000001;

		end
	end
	
	always@(posedge clk)
	begin
		inst_out = rom_data[pc];
	end

endmodule



module m_inst_decoder(clk, inst_in, read_address1, read_address2, write_address, 
read_enable1, read_enable2, write_enable, imm_data, mem_write_address, mem_read_address,
mux_sel, mem_write_enable, pc_sel, alu_sel, jump_address, branch_address);

	input clk;
	input [15:0] inst_in;

	output [4:0] read_address1, read_address2, write_address;
	output [7:0] imm_data;
	output read_enable1, read_enable2, write_enable;
	output [4:0] mem_write_address, mem_read_address;
	output mux_sel;
	output mem_write_enable;
	output [1:0] pc_sel;
	output alu_sel;
	output [5:0] jump_address;
	output [4:0] branch_address;
	
	reg [7:0] imm_data;
	reg [4:0] read_address1, read_address2, write_address;
	reg read_enable1, read_enable2, write_enable;
	reg [4:0] mem_write_address, mem_read_address;
	reg mux_sel;
	reg mem_write_enable;
	reg [1:0] pc_sel;
	reg alu_sel;
	reg [5:0] jump_address;
	reg [4:0] branch_address;

	always@(inst_in)
	begin
		if(inst_in[15:10] == 6'b000001)
		begin
			read_address1 = inst_in[9:5];
			read_address2 = inst_in[4:0];
			read_enable1 = 1;
			read_enable2 = 1;
			mux_sel = 0;
			write_address = inst_in[9:5];
			write_enable = 1;
			mem_write_enable = 0;
			pc_sel = 2'b00;
			alu_sel = 1'b0;
		end
		else if(inst_in[15:13] == 3'b001)
		begin
			read_address1 = inst_in[12:8];
			imm_data = inst_in[7:0];
			read_enable1 = 1;
			read_enable2 = 0;
			mux_sel = 0;
			write_address = inst_in[12:8];
			write_enable = 1;
			mem_write_enable = 0;
			pc_sel = 2'b00;
			alu_sel = 1'b0;
		end
		else if(inst_in[15:10] == 6'b 000010) // LD
		begin
			mem_read_address = inst_in[4:0];
			mem_write_enable = 0;
			mux_sel = 1;
			read_enable1 = 0;
			read_enable2 = 0;
			write_address = inst_in[9:5];
			write_enable = 1;
			pc_sel = 2'b00;
			alu_sel = 1'b0;
		end
		else if(inst_in[15:10] == 6'b 000011) // ST
		begin
			mem_write_address = inst_in[4:0];
			read_enable1 = 1;
			mem_write_enable = 1;
			write_enable = 0;
			pc_sel = 2'b00;
			alu_sel = 1'b0;			
		end
		else if(inst_in[15] == 1'b1)  // branch
		begin
			branch_address = inst_in[14:10];  // 점프할 주소 저장
			read_address1 = inst_in[9:5];  // 비교할 첫번째 주소값
			read_address2 = inst_in[4:0];  // 비교할 두번째 주소값
			read_enable1 = 1;
			read_enable2 = 1;
			write_enable = 0;  // 연산 결과를 레지스터에 저장 안함
			pc_sel = 2'b10;
			alu_sel = 1'b1;  // alu subtract 연산 수행하도록 함
		end
		else if(inst_in[15:14] == 2'b01)  // Jump
		begin
			jump_address = inst_in[5:0];  // 점프할 주소 저장
			read_enable1 = 0;
			read_enable2 = 0;
			write_enable = 0;
			pc_sel = 2'b01;
			alu_sel = 1'b0;						
		end
		
	end

endmodule



module m_register(clk, rst, read_enable1, read_enable2, write_enable, read_address1, read_address2, write_address, read_data1, read_data2, write_data, imm_data);

	input clk, rst, read_enable1, read_enable2, write_enable;
	input [4:0] read_address1, read_address2, write_address;
	input [7:0] write_data, imm_data;

	output [7:0] read_data1, read_data2;

	reg [7:0] read_data1, read_data2;
	reg [7:0] rom_table[0:31];

	always@(posedge clk or negedge rst)
	begin
		if(rst == 1'b0)
		begin
			rom_table[0] = 8'b00000000;
			rom_table[1] = 8'b00000001;
			rom_table[2] = 8'b00000010;
			rom_table[3] = 8'b00000011;
			rom_table[4] = 8'b00000100;
			rom_table[5] = 8'b00000101;
			rom_table[6] = 8'b00000110;
			rom_table[7] = 8'b00000111;
			rom_table[8] = 8'b00001000;
			rom_table[9] = 8'b00001001;
			rom_table[10] = 8'b00001010;
			rom_table[11] = 8'b00001011;
			rom_table[12] = 8'b00001100;
			rom_table[13] = 8'b00001101;
			rom_table[14] = 8'b00001110;
			rom_table[15] = 8'b00001111;
			rom_table[16] = 8'b00010000;
			rom_table[17] = 8'b00010001;
			rom_table[18] = 8'b00010010;
			rom_table[19] = 8'b00010011;
			rom_table[20] = 8'b00010100;
			rom_table[21] = 8'b00010101;
			rom_table[22] = 8'b00010110;
			rom_table[23] = 8'b00010111;
			rom_table[24] = 8'b00011000;
			rom_table[25] = 8'b00011001;
			rom_table[26] = 8'b00011010;
			rom_table[27] = 8'b00011011;
			rom_table[28] = 8'b00011100;
			rom_table[29] = 8'b00011101;
			rom_table[30] = 8'b00011110;
			rom_table[31] = 8'b00011111;
		end
		else if(write_enable == 1'b1)
			rom_table[write_address] = write_data;		
	end

	always@(read_address1)
	begin
		if(read_enable1 == 1'b1)
			read_data1 = rom_table[read_address1];
	end

	always@(read_address2)
	begin
		if(read_enable2 == 1'b1)
			read_data2 = rom_table[read_address2];
		else
			read_data2 = imm_data;
	end
	
	

endmodule



module m_alu(a, b, func_sel, result_sel, result, alu_sel);

	input [7:0] a, b;
	input alu_sel;
	
	output [7:0] result;
	output func_sel;
	output [1:0] result_sel;
		
	reg [7:0] result;
	reg [7:0] adder_result;
	reg [7:0] and_result;
	reg [7:0] or_result;
	reg func_sel;
	reg [1:0] result_sel;
	
	m_adder adder1(a, b, adder_result, func_sel);
	m_and and1(a, b, and_result);
	m_or or1(a, b, or_result);
	
	always@(alu_sel)
	case(alu_sel)
		
		1'b0 : begin func_sel = 1'b0; result_sel = 2'b00; end
		1'b1 : begin func_sel = 1'b1; result_sel = 2'b01; end
	endcase
	
	always@(result or adder_result or and_result or or_result or result_sel)
	case(result_sel)
		2'b00 : result = adder_result;
		2'b01 : 
		begin
			if(adder_result >= 0)
				result = 8'b00000000;
			else
				result = 8'b00000001;
		end
		2'b10 : result = and_result;
		2'b11 : result = or_result;
	endcase
	
endmodule



module m_adder(a, b, adder_result, func_sel);

	input [7:0] a, b;
	input func_sel;
	
	output [7:0] adder_result;
	
	wire [7:0] c;
	wire [7:0] b1;
	
	m_complement com1(b, b1, func_sel);
	
	m_half_adder ha(a[0], b1[0], c[0], adder_result[0]);
	m_full_adder fa1(a[1], b1[1], c[0], c[1], adder_result[1]);
	m_full_adder fa2(a[2], b1[2], c[1], c[2], adder_result[2]);
	m_full_adder fa3(a[3], b1[3], c[2], c[3], adder_result[3]);
	m_full_adder fa4(a[4], b1[4], c[3], c[4], adder_result[4]);
	m_full_adder fa5(a[5], b1[5], c[4], c[5], adder_result[5]);
	m_full_adder fa6(a[6], b1[6], c[5], c[6], adder_result[6]);
	m_full_adder fa7(a[7], b1[7], c[6], c[7], adder_result[7]);
	
endmodule



module m_full_adder(a, b, cin, cout, adder_result);

	input a, b, cin;
	output cout, adder_result;
	
	wire c1, c2, s1;
	
	m_half_adder ha1(b, cin, c1, s1);
	m_half_adder ha2(a, s1, c2, adder_result);
	
	assign cout = c1 | c2;

endmodule



module m_half_adder(a, b, c, adder_result);

	input a, b;
	output c, adder_result;
	
	assign adder_result = a ^ b;
	assign c = a & b;
	
endmodule



module m_complement(b, b1, func_sel);

	input [7:0] b;
	input func_sel;
	output [7:0] b1;
	
	reg [7:0] tmp;
	
	always@(b or tmp or func_sel)
	case(func_sel)
		1'b0 : tmp = b;
		1'b1 : tmp = ~b + 1;
	endcase
	
	assign b1 = tmp;
	
endmodule



module m_and(a, b, and_result);

	input [7:0] a, b;
	output [7:0] and_result;
	
	assign and_result = a & b;
	
endmodule



module m_or(a, b, or_result);

	input [7:0] a, b;
	output [7:0] or_result;
	
	assign or_result = a | b;

endmodule