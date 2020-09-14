`define p2A'd1
`define pA'd2
`define zero'd3
`define mA'd4
`define m2A'd5

module Booth_Index_Enc(B, Index, Sign);
	input [2:0] B;
	output [2:0] Index;
	output Sign;
	
	reg [2:0] Index;
	reg Sign;
	
	
	always @ (B) begin
	casex(B)
		3'b000: begin Index = `zero; Sign=1'b0;end
		3'b010: begin Index = `pA; Sign=1'b0;end
		3'b100: begin Index = `m2A; Sign=1'b1;end
		3'b110: begin Index = `mA; Sign=1'b1;end
		3'b001: begin Index = `pA; Sign=1'b0;end
		3'b011: begin Index = `p2A; Sign=1'b0;end
		3'b101: begin Index = `mA; Sign=1'b1;end
		3'b111: begin Index = `zero; Sign=1'b0;end
		default: begin Index = 3'bx; Sign = 1'bx;end
	endcase
	end
endmodule

module pp_Gen_MUX(A, Index, Dout);
	input [5:0] A;
	input [2:0] Index;
	
	output [6:0] Dout;

	reg [6:0] Dout;
	
	always @ (A or Index) begin
	casex(Index)
	
		`p2A: begin Dout = {A, 1'b0};end
		`pA: begin Dout = {A[5], A};end
		`zero: begin Dout = 7'b0;end
		`mA: begin Dout = ~{A[5], A};end
		`m2A: begin Dout = ~{A, 1'b0};end
		default: begin Dout = 7'bx;end
		
	endcase
	end
endmodule


module FA(a,b,c,cout,sum);
	input a,b,c;
	
	output cout, sum;
	
	assign {cout,sum} = a+b+c;
endmodule
 	
module HA(a,b,cout,sum);
	input a,b;

	output cout, sum;
	
	assign {cout,sum} = a+b;
endmodule	
	
module CSA1(X,Y,Z,Carry,Sum);

	input [7:0] X,Y,Z;
	output[7:0] Carry, Sum;
	integer i;
	
	FA fulladd0(.a(X[0]), .b(Y[0]), .c(Z[0]), .cout(Carry[0]), .sum(Sum[0]));
	FA fulladd1(.a(X[1]), .b(Y[1]), .c(Z[1]), .cout(Carry[1]), .sum(Sum[1]));
	FA fulladd2(.a(X[2]), .b(Y[2]), .c(Z[2]), .cout(Carry[2]), .sum(Sum[2]));
	FA fulladd3(.a(X[3]), .b(Y[3]), .c(Z[3]), .cout(Carry[3]), .sum(Sum[3]));
	FA fulladd4(.a(X[4]), .b(Y[4]), .c(Z[4]), .cout(Carry[4]), .sum(Sum[4]));
	FA fulladd5(.a(X[5]), .b(Y[5]), .c(Z[5]), .cout(Carry[5]), .sum(Sum[5]));
	FA fulladd6(.a(X[6]), .b(Y[6]), .c(Z[6]), .cout(Carry[6]), .sum(Sum[6]));
	FA fulladd7(.a(X[7]), .b(Y[7]), .c(Z[7]), .cout(Carry[7]), .sum(Sum[7]));
	
endmodule

module CSA2(X, Y, Carry, Sum);

	input [6:0] X,Y;
	output[6:0] Carry, Sum;		
	
	HA halfadd0(.a(X[0]), .b(Y[0]), .cout(Carry[0]), .sum(Sum[0]));
	HA halfadd1(.a(X[1]), .b(Y[1]), .cout(Carry[1]), .sum(Sum[1]));
	HA halfadd2(.a(X[2]), .b(Y[2]), .cout(Carry[2]), .sum(Sum[2]));
	HA halfadd3(.a(X[3]), .b(Y[3]), .cout(Carry[3]), .sum(Sum[3]));
	HA halfadd4(.a(X[4]), .b(Y[4]), .cout(Carry[4]), .sum(Sum[4]));
	HA halfadd5(.a(X[5]), .b(Y[5]), .cout(Carry[5]), .sum(Sum[5]));
	HA halfadd6(.a(X[6]), .b(Y[6]), .cout(Carry[6]), .sum(Sum[6]));

endmodule

module Booth_MUL(A,B,m,ov);

	input [5:0] A,B;
	output [10:0] m;
	output ov;
	
	wire [2:0] Index, Sb;
	wire [6:0] X, Y, Z;
	wire [7:0] Carry_CSA1, Sum_CSA1;
	wire [6:0] Carry_CSA2, Sum_CSA2;
	
	wire cout;
	
	Booth_Index_Enc booth_enc0( .B({B[1:0], 1'b0}), .Index(Index[0]), .Sign(Sb[0]));
	Booth_Index_Enc booth_enc1( .B(B[3:1]), .Index(Index[1]), .Sign(Sb[1]));
	Booth_Index_Enc booth_enc2( .B(B[5:3]), .Index(Index[2]), .Sign(Sb[2]));
	
	pp_Gen_MUX pp_Gen0(.A(A), .Index(Index[0]), .Dout(X));
	pp_Gen_MUX pp_Gen1(.A(A), .Index(Index[1]), .Dout(Y));
	pp_Gen_MUX pp_Gen2(.A(A), .Index(Index[2]), .Dout(Z));
	

	CSA1 csa1(.X({1'b0, ~X[6], X[6], X[6:2]}), .Y({1'b1, ~Y[6], Y[5:0]}), .Z({Z[5:0], 2'b0}), .Carry(Carry_CSA1), .Sum(Sum_CSA1));
	
	
	CSA2 csa2(.X({Carry_CSA1[7:2], Sb[2]}), .Y({~Z[6], Sum_CSA1[7:2]}), .Carry(Carry_CSA2), .Sum(Sum_CSA2));
	
	CPA cpa(.X({Carry_CSA2, Carry_CSA1[1:0], Sb[1], 1'b0, Sb[0]}), .Y({1'b0, Sum_CSA2, Sum_CSA1[1:0], X[1:0]}), .Cout(cout), .Sum(m), .ov(ov), .Cin(1'b0));
	
endmodule

module CPA(X, Y, Cin, Cout, Sum, ov);

	input [11:0] X,Y;
	input Cin;
	
	output [10:0] Sum;
	output Cout, ov;
	
	wire [10:0] Carry;


	FA FA0(.a(X[0]), .b(Y[0]), .c(Cin), .cout(Carry[0]), .sum(Sum[0]) );
	FA FA1(.a(X[1]), .b(Y[1]), .c(Carry[0]), .cout(Carry[1]), .sum(Sum[1]));
	FA FA2(.a(X[2]), .b(Y[2]), .c(Carry[1]), .cout(Carry[2]), .sum(Sum[2]));
	FA FA3(.a(X[3]), .b(Y[3]), .c(Carry[2]), .cout(Carry[3]), .sum(Sum[3]));
	FA FA4(.a(X[4]), .b(Y[4]), .c(Carry[3]), .cout(Carry[4]), .sum(Sum[4]));
	FA FA5(.a(X[5]), .b(Y[5]), .c(Carry[4]), .cout(Carry[5]), .sum(Sum[5]));
	FA FA6(.a(X[6]), .b(Y[6]), .c(Carry[5]), .cout(Carry[6]), .sum(Sum[6]));
	FA FA7(.a(X[7]), .b(Y[7]), .c(Carry[6]), .cout(Carry[7]), .sum(Sum[7]));
	FA FA8(.a(X[8]), .b(Y[8]), .c(Carry[7]), .cout(Carry[8]), .sum(Sum[8]));
	FA FA9(.a(X[9]), .b(Y[9]), .c(Carry[8]), .cout(Carry[9]), .sum(Sum[9]));
	FA FA10(.a(X[10]), .b(Y[10]), .c(Carry[9]), .cout(Carry[10]), .sum(Sum[10]));
	FA FA11(.a(X[11]), .b(Y[11]), .c(Carry[10]), .cout(Cout), .sum(ov));
	
endmodule






	


	
	
	