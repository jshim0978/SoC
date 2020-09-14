`timescale 1ns/100ps

module ALU_tb;
	reg[15:0] valA, valB;
	reg[3:0] aluop, shift;
	reg sub, lr;
	
	wire[15:0] result;
	wire [3:0] cc;
	
	
	ALU myALU(.valA(valA), .valB(valB), .aluop(aluop), .sub(sub), .lr(lr), .shift(shift), .cc(cc), .result(result));

	initial begin
		valA = 16'b1001001001001001;
		valB = 16'b1000100010001000;
		sub = 1'b0;
		aluop = 4'b0000;
		
		#10;
		sub = 1'b1;
		aluop = 4'b0001;
		
		#10;
		aluop = 4'b0010;
		shift = 4'b1000;
		lr = 1'b0;
		
		
		#10;
		aluop = 4'b0010;
		shift = 4'b1000;
		lr = 1'b1;
		
		
		#10;
		aluop = 4'b0011;
		shift = 4'b1000;
		lr = 1'b0;
		
		#10;
		aluop = 4'b0011;
		shift = 4'b1000;
		lr = 1'b1;
		
		#10;
		lr = 1'b0;
		aluop = 4'b0100;
		shift = 4'b1000;
		#10;
		lr = 1'b1;
		aluop = 4'b0100;
		shift = 4'b1000;
		
		#10;
		aluop = 4'b0101;
		shift = 4'b0111;
		lr = 1'b0;
		
		#10;
		aluop = 4'b0101;
		shift = 4'b0111;
		lr = 1'b1;
		
		#10;
		aluop = 4'b0110;
		shift = 4'b0111;
		lr = 1'b0;
		
		
		#10;
		aluop = 4'b0110;
		shift = 4'b0111;
		lr = 1'b1;
		
		#10;
		aluop = 4'b0111;
		
		#10;
		aluop = 4'b1000;
		
		#10;
		aluop = 4'b1001;
		
		#10;
		aluop = 4'b1010;
		
		#10;
	end
endmodule