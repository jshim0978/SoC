module PG_Gen(A,B,P,G);

	input A, B;
	output P, G;
	
	assign P = A ^ B;
	assign G = A & B;
	
endmodule

module black_cell(Pin1,Pin2,Gin1,Gin2,P,G);

	input Pin1, Pin2, Gin1, Gin2;
	output P, G;
	
	assign P = Pin1 & Pin2;
	assign G = Gin2 | (Pin2 & Gin1);
	
endmodule

module Carry_Gen(P,G,Cin,Cout);

	input P,G, Cin;
	output Cout;
	
	assign Cout = G|(P & Cin);
	
endmodule

module KSA(A, B, Cin, Sum, Cout);
	input [15:0] A, B;
	input Cin;
	output [15:0] Sum;
	output Cout;
	
	wire [15:0] P_st_1, G_st_1, P_A, G_A;
	wire [13:0] P_B, G_B;
	wire [9:0] P_C, G_C;
	wire [1:0] P_D, G_D;
	wire P_E, G_E;
	
	wire[15:1] Carry;
	
	//Stage of PG Generator
	PG_Gen PG_Gen_0(.A(A[0]), .B(B[0]), .P(P_st_1[0]), .G(G_st_1[0]));
	PG_Gen PG_Gen_1(.A(A[1]), .B(B[1]), .P(P_st_1[1]), .G(G_st_1[1]));
	PG_Gen PG_Gen_2(.A(A[2]), .B(B[2]), .P(P_st_1[2]), .G(G_st_1[2]));
	PG_Gen PG_Gen_3(.A(A[3]), .B(B[3]), .P(P_st_1[3]), .G(G_st_1[3]));
	PG_Gen PG_Gen_4(.A(A[4]), .B(B[4]), .P(P_st_1[4]), .G(G_st_1[4]));
	PG_Gen PG_Gen_5(.A(A[5]), .B(B[5]), .P(P_st_1[5]), .G(G_st_1[5]));
	PG_Gen PG_Gen_6(.A(A[6]), .B(B[6]), .P(P_st_1[6]), .G(G_st_1[6]));
	PG_Gen PG_Gen_7(.A(A[7]), .B(B[7]), .P(P_st_1[7]), .G(G_st_1[7]));
	PG_Gen PG_Gen_8(.A(A[8]), .B(B[8]), .P(P_st_1[8]), .G(G_st_1[8]));
	PG_Gen PG_Gen_9(.A(A[9]), .B(B[9]), .P(P_st_1[9]), .G(G_st_1[9]));
	PG_Gen PG_Gen_10(.A(A[10]), .B(B[10]), .P(P_st_1[10]), .G(G_st_1[10]));
	PG_Gen PG_Gen_11(.A(A[11]), .B(B[11]), .P(P_st_1[11]), .G(G_st_1[11]));
	PG_Gen PG_Gen_12(.A(A[12]), .B(B[12]), .P(P_st_1[12]), .G(G_st_1[12]));
	PG_Gen PG_Gen_13(.A(A[13]), .B(B[13]), .P(P_st_1[13]), .G(G_st_1[13]));
	PG_Gen PG_Gen_14(.A(A[14]), .B(B[14]), .P(P_st_1[14]), .G(G_st_1[14]));
	PG_Gen PG_Gen_15(.A(A[15]), .B(B[15]), .P(P_st_1[15]), .G(G_st_1[15]));
	
	//Stage of Black Cell _A
	black_cell BC_A_0(.Pin2(P_st_1[0]), .Gin2(G_st_1[0]), .Pin1(1'b0), .Gin1(Cin), .P(P_A[0]), .G(G_A[0]));
	black_cell BC_A_1(.Pin2(P_st_1[1]), .Gin2(G_st_1[1]), .Pin1(P_st_1[0]), .Gin1(G_st_1[0]), .P(P_A[1]), .G(G_A[1]));
	black_cell BC_A_2(.Pin2(P_st_1[2]), .Gin2(G_st_1[2]), .Pin1(P_st_1[1]), .Gin1(G_st_1[1]), .P(P_A[2]), .G(G_A[2]));
	black_cell BC_A_3(.Pin2(P_st_1[3]), .Gin2(G_st_1[3]), .Pin1(P_st_1[2]), .Gin1(G_st_1[2]), .P(P_A[3]), .G(G_A[3]));
	black_cell BC_A_4(.Pin2(P_st_1[4]), .Gin2(G_st_1[4]), .Pin1(P_st_1[3]), .Gin1(G_st_1[3]), .P(P_A[4]), .G(G_A[4]));
	black_cell BC_A_5(.Pin2(P_st_1[5]), .Gin2(G_st_1[5]), .Pin1(P_st_1[4]), .Gin1(G_st_1[4]), .P(P_A[5]), .G(G_A[5]));
	black_cell BC_A_6(.Pin2(P_st_1[6]), .Gin2(G_st_1[6]), .Pin1(P_st_1[5]), .Gin1(G_st_1[5]), .P(P_A[6]), .G(G_A[6]));
	black_cell BC_A_7(.Pin2(P_st_1[7]), .Gin2(G_st_1[7]), .Pin1(P_st_1[6]), .Gin1(G_st_1[6]), .P(P_A[7]), .G(G_A[7]));
	black_cell BC_A_8(.Pin2(P_st_1[8]), .Gin2(G_st_1[8]), .Pin1(P_st_1[7]), .Gin1(G_st_1[7]), .P(P_A[8]), .G(G_A[8]));
	black_cell BC_A_9(.Pin2(P_st_1[9]), .Gin2(G_st_1[9]), .Pin1(P_st_1[8]), .Gin1(G_st_1[8]), .P(P_A[9]), .G(G_A[9]));
	black_cell BC_A_10(.Pin2(P_st_1[10]), .Gin2(G_st_1[10]), .Pin1(P_st_1[9]), .Gin1(G_st_1[9]), .P(P_A[10]), .G(G_A[10]));
	black_cell BC_A_11(.Pin2(P_st_1[11]), .Gin2(G_st_1[11]), .Pin1(P_st_1[10]), .Gin1(G_st_1[10]), .P(P_A[11]), .G(G_A[11]));
	black_cell BC_A_12(.Pin2(P_st_1[12]), .Gin2(G_st_1[12]), .Pin1(P_st_1[11]), .Gin1(G_st_1[11]), .P(P_A[12]), .G(G_A[12]));
	black_cell BC_A_13(.Pin2(P_st_1[13]), .Gin2(G_st_1[13]), .Pin1(P_st_1[12]), .Gin1(G_st_1[12]), .P(P_A[13]), .G(G_A[13]));
	black_cell BC_A_14(.Pin2(P_st_1[14]), .Gin2(G_st_1[14]), .Pin1(P_st_1[13]), .Gin1(G_st_1[13]), .P(P_A[14]), .G(G_A[14]));
	black_cell BC_A_15(.Pin2(P_st_1[15]), .Gin2(G_st_1[15]), .Pin1(P_st_1[14]), .Gin1(G_st_1[14]), .P(P_A[15]), .G(G_A[15]));
	
	
	
	//Stage of Black Cell _B
	black_cell BC_B_0(.Pin2(P_A[2]), .Gin2(G_A[2]), .Pin1(P_A[0]), .Gin1(G_A[0]), .P(P_B[0]), .G(G_B[0]));
	black_cell BC_B_1(.Pin2(P_A[3]), .Gin2(G_A[3]), .Pin1(P_A[1]), .Gin1(G_A[1]), .P(P_B[1]), .G(G_B[1]));
	black_cell BC_B_2(.Pin2(P_A[4]), .Gin2(G_A[4]), .Pin1(P_A[2]), .Gin1(G_A[2]), .P(P_B[2]), .G(G_B[2]));
	black_cell BC_B_3(.Pin2(P_A[5]), .Gin2(G_A[5]), .Pin1(P_A[3]), .Gin1(G_A[3]), .P(P_B[3]), .G(G_B[3]));
	black_cell BC_B_4(.Pin2(P_A[6]), .Gin2(G_A[6]), .Pin1(P_A[4]), .Gin1(G_A[4]), .P(P_B[4]), .G(G_B[4]));
	black_cell BC_B_5(.Pin2(P_A[7]), .Gin2(G_A[7]), .Pin1(P_A[5]), .Gin1(G_A[5]), .P(P_B[5]), .G(G_B[5]));
	black_cell BC_B_6(.Pin2(P_A[8]), .Gin2(G_A[8]), .Pin1(P_A[6]), .Gin1(G_A[6]), .P(P_B[6]), .G(G_B[6]));
	black_cell BC_B_7(.Pin2(P_A[9]), .Gin2(G_A[9]), .Pin1(P_A[7]), .Gin1(G_A[7]), .P(P_B[7]), .G(G_B[7]));
	black_cell BC_B_8(.Pin2(P_A[10]), .Gin2(G_A[10]), .Pin1(P_A[8]), .Gin1(G_A[8]), .P(P_B[8]), .G(G_B[8]));
	black_cell BC_B_9(.Pin2(P_A[11]), .Gin2(G_A[11]), .Pin1(P_A[9]), .Gin1(G_A[9]), .P(P_B[9]), .G(G_B[9]));
	black_cell BC_B_10(.Pin2(P_A[12]), .Gin2(G_A[12]), .Pin1(P_A[10]), .Gin1(G_A[10]), .P(P_B[10]), .G(G_B[10]));
	black_cell BC_B_11(.Pin2(P_A[13]), .Gin2(G_A[13]), .Pin1(P_A[11]), .Gin1(G_A[11]), .P(P_B[11]), .G(G_B[11]));
	black_cell BC_B_12(.Pin2(P_A[14]), .Gin2(G_A[14]), .Pin1(P_A[12]), .Gin1(G_A[12]), .P(P_B[12]), .G(G_B[12]));
	black_cell BC_B_13(.Pin2(P_A[15]), .Gin2(G_A[15]), .Pin1(P_A[13]), .Gin1(G_A[13]), .P(P_B[13]), .G(G_B[13]));
	
	
	//Stage of Black Cell _C
	black_cell BC_C_0(.Pin2(P_B[4]), .Gin2(G_B[4]), .Pin1(P_B[0]), .Gin1(G_B[0]), .P(P_C[0]), .G(G_C[0]));
	black_cell BC_C_1(.Pin2(P_B[5]), .Gin2(G_B[5]), .Pin1(P_B[1]), .Gin1(G_B[1]), .P(P_C[1]), .G(G_C[1]));
	black_cell BC_C_2(.Pin2(P_B[6]), .Gin2(G_B[6]), .Pin1(P_B[2]), .Gin1(G_B[2]), .P(P_C[2]), .G(G_C[2]));
	black_cell BC_C_3(.Pin2(P_B[7]), .Gin2(G_B[7]), .Pin1(P_B[3]), .Gin1(G_B[3]), .P(P_C[3]), .G(G_C[3]));
	black_cell BC_C_4(.Pin2(P_B[8]), .Gin2(G_B[8]), .Pin1(P_B[4]), .Gin1(G_B[4]), .P(P_C[4]), .G(G_C[4]));
	black_cell BC_C_5(.Pin2(P_B[9]), .Gin2(G_B[9]), .Pin1(P_B[5]), .Gin1(G_B[5]), .P(P_C[5]), .G(G_C[5]));
	black_cell BC_C_6(.Pin2(P_B[10]), .Gin2(G_B[10]), .Pin1(P_B[6]), .Gin1(G_B[6]), .P(P_C[6]), .G(G_C[6]));
	black_cell BC_C_7(.Pin2(P_B[11]), .Gin2(G_B[11]), .Pin1(P_B[7]), .Gin1(G_B[7]), .P(P_C[7]), .G(G_C[7]));
	black_cell BC_C_8(.Pin2(P_B[12]), .Gin2(G_B[12]), .Pin1(P_B[8]), .Gin1(G_B[8]), .P(P_C[8]), .G(G_C[8]));
	black_cell BC_C_9(.Pin2(P_B[13]), .Gin2(G_B[13]), .Pin1(P_B[9]), .Gin1(G_B[9]), .P(P_C[9]), .G(G_C[9]));

	
	//Stage of Black Cell _D
	black_cell BC_D_0(.Pin2(P_C[8]), .Gin2(G_C[8]), .Pin1(P_C[0]), .Gin1(G_C[0]), .P(P_D[0]), .G(G_D[0]));
	black_cell BC_D_1(.Pin2(P_C[9]), .Gin2(G_C[9]), .Pin1(P_C[1]), .Gin1(G_C[1]), .P(P_D[1]), .G(G_D[1]));

	
	
	
	//Stage of Black Cell _E
	black_cell BC_E_0(.Pin2(P_D[1]), .Gin2(G_D[1]), .Pin1(1'b0), .Gin1(Cin), .P(P_E), .G(G_E));
	
	
	
	//Carry generate storage
	Carry_Gen Carry_Gen_0(.P(P_A[0]), .G(G_A[0]), .Cin(Cin), .Cout(Carry[1]));
	Carry_Gen Carry_Gen_1(.P(P_A[1]), .G(G_A[1]), .Cin(Cin), .Cout(Carry[2]));
	
	Carry_Gen Carry_Gen_2(.P(P_B[0]), .G(G_B[0]), .Cin(Cin), .Cout(Carry[3]));
	Carry_Gen Carry_Gen_3(.P(P_B[1]), .G(G_B[1]), .Cin(Cin), .Cout(Carry[4]));
	Carry_Gen Carry_Gen_4(.P(P_B[2]), .G(G_B[2]), .Cin(Cin), .Cout(Carry[5]));
	Carry_Gen Carry_Gen_5(.P(P_B[3]), .G(G_B[3]), .Cin(Cin), .Cout(Carry[6]));
	

	Carry_Gen Carry_Gen_6(.P(P_C[0]), .G(G_C[0]), .Cin(Cin), .Cout(Carry[7]));
	Carry_Gen Carry_Gen_7(.P(P_C[1]), .G(G_C[1]), .Cin(Cin), .Cout(Carry[8]));
	Carry_Gen Carry_Gen_8(.P(P_C[2]), .G(G_C[2]), .Cin(Cin), .Cout(Carry[9]));
	Carry_Gen Carry_Gen_9(.P(P_C[3]), .G(G_C[3]), .Cin(Cin), .Cout(Carry[10]));
	Carry_Gen Carry_Gen_10(.P(P_C[4]), .G(G_C[4]), .Cin(Cin), .Cout(Carry[11]));
	Carry_Gen Carry_Gen_11(.P(P_C[5]), .G(G_C[5]), .Cin(Cin), .Cout(Carry[12]));
	Carry_Gen Carry_Gen_12(.P(P_C[6]), .G(G_C[6]), .Cin(Cin), .Cout(Carry[13]));
	Carry_Gen Carry_Gen_13(.P(P_C[7]), .G(G_C[7]), .Cin(Cin), .Cout(Carry[14]));
	
	Carry_Gen Carry_Gen_14(.P(P_D[0]), .G(G_D[0]), .Cin(Cin), .Cout(Carry[15]));
	
	Carry_Gen Carry_Gen_15(.P(P_E), .G(G_E), .Cin(Cin), .Cout(Cout));
	
	//Sum generator
	assign Sum[0] = P_st_1[0] ^ Cin;
	assign Sum[1] = P_st_1[1] ^ Carry[1];
	assign Sum[2] = P_st_1[2] ^ Carry[2];
	assign Sum[3] = P_st_1[3] ^ Carry[3];
	assign Sum[4] = P_st_1[4] ^ Carry[4];
	assign Sum[5] = P_st_1[5] ^ Carry[5];
	assign Sum[6] = P_st_1[6] ^ Carry[6];
	assign Sum[7] = P_st_1[7] ^ Carry[7];
	assign Sum[8] = P_st_1[8] ^ Carry[8];
	assign Sum[9] = P_st_1[9] ^ Carry[9];
	assign Sum[10] = P_st_1[10] ^ Carry[10];
	assign Sum[11] = P_st_1[11] ^ Carry[11];
	assign Sum[12] = P_st_1[12] ^ Carry[12];
	assign Sum[13] = P_st_1[13] ^ Carry[13];
	assign Sum[14] = P_st_1[14] ^ Carry[14];
	assign Sum[15] = P_st_1[15] ^ Carry[15];

	
	
endmodule
	