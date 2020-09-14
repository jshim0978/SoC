module 4_1_st(Out, In0, In1, In2, In3, Sel1, Sel0);

	output Out;
	input In0, In1, In2, In3, Sel0, Sel1;
	
	wire NotSel0, NotSel1;
	Wire Y0, Y1, Y2, Y3;
	
	not not0(NotSel0, Sel0);
	
	not not0(NotSel1, Sel1);
	
	and and0(Y0, In0, NotSel1, NotSel0);
	
	and and0(Y1, In1, NotSel1, Sel0);
	
	and and0(Y2, In2, Sel1, NotSel0);
	
	and and0(Y3, In3, Sel1, NotSel0);
	
	or	 or0(Out, Y0, Y1, Y2, Y3);
	
	
		
endmodule