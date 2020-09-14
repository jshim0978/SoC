`define ALU_ADD 3'b001 // Add
`define ALU_SUB 3'b010 // Subtract
`define ALU_SHL 3'b011 // Shift Left
`define ALU_SHLR 3'b100 // Logical Shift Right
`define ALU_AND 3'b101 // AND
`define ALU_OR 3'b110 // OR
`define ALU_NOT 3'b111 // NOT


module ALU (result, cc, valA, valB, aluop);
	input [15:0] valA; 
	input [15:0] valB; 
	input [3:0] aluop; 
	wire sub; 
	
	output [3:0] cc; // N, Z, C, V
	output [15:0] result; // output
	wire [15:0] and16b, or16b, not16b;
	wire [15:0] shift_out;
	wire [15:0] add_out, svalB;
	wire [15:0] result;
	wire [3:0] cc;
	wire shift_co, add_co; 
	wire shift_LR; 
	wire N, Z, C, V; // N, Z, C, V
	
	assign and16b = valA & valB; 
	assign or16b = valA | valB; 
	assign not16b = ~valB; 

	assign shift_LR = 
		(aluop == `ALU_SHL) ? 1'b1 : 
		(aluop == `ALU_SHLR) ? 1'b0 : 1'bx; 
	Shifter16_LR myShifter(shift_out, valB, shift_LR, valA);
	
	assign sub = (aluop == `ALU_SUB) ? 1'b1 : 1'b0;
	assign svalB = (aluop == `ALU_SUB) ? ~valB : valB; 

	assign result =
		(aluop == `ALU_ADD) ? add_out :
		(aluop == `ALU_SUB) ? add_out :
		(aluop == `ALU_SHL) ? shift_out :
		(aluop == `ALU_SHLR) ? shift_out :
		(aluop == `ALU_AND) ? and16b :
		(aluop == `ALU_OR) ? or16b :
		(aluop == `ALU_NOT) ? not16b : 16'bx;
	
	assign N = result[15]; 
	assign Z = ~|result; 
	assign C = 
		(aluop == `ALU_ADD) ? add_co :
		1'b0;
	assign V = 
		(aluop == `ALU_SHL) ? valA[15] ^ shift_out[15] : 
		(aluop == `ALU_ADD) ? 
			(~valA[15] & ~svalB[15] & add_out[15]) | /* (-) + (-) = (+) */ 
			(valA[15] & svalB[15] & ~add_out[15]) : /* (+) + (+) = (-) */
		1'b0;
	
	assign cc = {N, Z, C, V};
	
endmodule 
