module mux_4_1_df(Out, In0, In1, In2, In3, Sel1, Sel0);

	output Out;
	input In0, In1, In2, In3, Sel1, Sel0;
	wire Out;
	
//	always @(Sel1 or Sel0 or In0 or In1 or In2 or In3)
//		case ({Sel1, Sel0})
//		
//			2'b00 Out = In0;
//			2'b01 Out = In1;
//			2'b10 Out = In2;
//			2'b11 Out = In3;
//	
//			default : Out = 1'bx;
//		endcase

	
	
		assign Out = Sel1 ? (Sel0 ? In3 : In2) : (Sel0 ? In1 : In0);
			
endmodule