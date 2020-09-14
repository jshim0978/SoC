module mux_4_1_df(Out, In0, In1, In2, In3, Sel1, Sel0);

	output Out;
	input In0, In1, In2, In3, Sel1, Sel0;
	wire Out;
	
//	assign Out = 
//		(Sel == 2'b00) ? In0 :
//		(Sel == 2'b01) ? In1 :
//		(Sel == 2'b10) ? In2 :
//		(Sel == 2'b11) ? In3 : 1'bx;
	assign out = 
		Sel1 ? (Sel0 ? In3 : In2) : 
		(Sel0 ? In1 : In0) ;
		
endmodule