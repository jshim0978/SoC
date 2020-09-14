`timescale 1ns/100ps

module mux_4_1_tb;

	reg In0, In1, In2, In3, Sel1, Sel0;
	wire Out_df, Out_st, Out_bh;
	reg [5:0] i;
	mux_4_1_top Block1(.Out_df(Out_df),.Out_st(Out_st),.Out_bh(Out_bh), .In0(In0), .In1(In1), .In2(In2), .In3(In3), .Sel1(Sel1), .Sel0(Sel0));
	
	initial begin
//			In0 = 1'bx; In1 = 1'bx; In2 = 1'bx; In3 = 1'bx; Sel1 = 2'bx; Sel0 = 2'bx;
//		
//			#10
//			
//			In0 = 1'bx; In1 = 1'bx; In2 = 1'bx; In3 = 1'bx;
//			Sel
		for (i = 0; i <= 63; i = i + 1) begin
			Sel1 = i[5];
			Sel0 = i[4];
			In0 = i[3];
			In1 = i[2];
			In2 = i[1];
			In3 = i[0];
			#10;
		end
	end
	
endmodule
			
			