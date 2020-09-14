`define ADD 4'b0000 // Add
`define ADDI 4'b0001 // Add immediate
`define MOV 4'b0010 // Move
`define MOVI 4'b0011 // Move immediate
`define SUB 4'b0100 // Subtract
`define SUBI 4'b00101 // Subtract immediate
`define SHL 4'b0110 // Shift Left
`define SHLI 4'b0111 // Shift Left immediate
`define SHLR 4'b1000 // Logical Shift Right
`define SHLRI 4'b1001 // Logical Shift Right immediate
`define AND 4'b1010 // AND
`define ANDI 4'b1011 // AND immediate
`define OR 4'b1100 // OR
`define ORI 4'b1101 // OR immediate
`define NOT 4'b1110 // NOT

`define ALU_ADD 3'b0001 // Add
`define ALU_SUB 3'b0010 // Subtract
`define ALU_SHL 3'b0011 // Shift Left
`define ALU_SHLR 3'b0100 // Logical Shift Right
`define ALU_AND 3'b0101 // AND
`define ALU_OR 3'b0110 // OR
`define ALU_NOT 3'b0111 // NOT

module Decoder_OP(instr, unary, imm, aluop, setcc, rD, rA, rB, immB, wben);
	input [15:0] instr;
	output unary;
	output imm;
	output [2:0] aluop; // ADD, SUB, SHL, SHLR,AND, OR, NOT 
	output setcc;
	output [2:0] rD;
	output [2:0] rA;
	output [2:0] rB;
	output [3:0] immB;
	output wben;
	wire [3:0] opcode_i;
	reg unary;
	reg imm;
	reg [3:0] aluop;
	reg setcc;
	reg [2:0] rD;
	reg [2:0] rA;
	reg [2:0] rB;
	reg [3:0] immB;
	reg wben;
	assign opcode_i = {instr[15:12], instr[11]}; // {opcode, imm}
	always @(opcode_i or instr)
		case (opcode_i)
			`ADD: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} = 
				{1'b0, 1'b0, `ALU_ADD, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
			`ADDI: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} = 
				{1'b0, 1'b1, `ALU_ADD, instr[11], instr[10:8], instr[7:5], 3'bx, instr[4:0], 1'b1};
			`MOV: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b1, 1'b0, `ALU_ADD, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
			`MOVI: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b1, 1'b1, `ALU_ADD, instr[11], instr[10:8], instr[7:5], 3'bx, instr[4:0], 1'b1};
			`SUB: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b0, `ALU_SUB, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
			`SUBI: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b1, `ALU_SUB, instr[11], instr[10:8], instr[7:5], 3'bx, instr[4:0], 1'b1};
			`SHL: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b0, `ALU_SHL, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
			`SHLI: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b1, `ALU_SHL, instr[11],instr[10:8], instr[7:5], 3'bx, instr[4:0], 1'b1};
			`SHLR: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b0, `ALU_SHLR, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
			`SHLRI: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b1, `ALU_SHLR, instr[11], instr[10:8], instr[7:5], 3'bx, instr[4:0], 1'b1};
			`AND: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b0, `ALU_AND, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
			`ANDI: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b1, `ALU_AND, instr[11], instr[10:8], instr[7:5], 3'bx, instr[4:0], 1'b1};
			`OR: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b0, `ALU_OR, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
			`ORI: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b1, `ALU_OR, instr[11], instr[10:8], instr[7:5], 3'bx, instr[4:0], 1'b1};
			`NOT: {unary, imm, aluop, setcc, rD, rA, rB, immB, wben} =
				{1'b0, 1'b0, `ALU_NOT, instr[11], instr[10:8], instr[7:5], instr[4:2], 5'bx, 1'b1};
		endcase
endmodule 