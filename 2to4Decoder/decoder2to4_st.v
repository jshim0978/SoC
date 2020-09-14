module decoder2to4_st(Sel0, Sel1, Y0,Y1,Y2,Y3);
    

    output Y0,Y1,Y2,Y3;
	 input Sel0, Sel1;
	 
	 wire NotSel0, NotSel1;
	 
	 not not0(NotSel0, Sel0);
	 
 	 not not1(NotSel1, Sel1);

	 and and0(Y0, NotSel0, NotSel1);
	 and and1(Y1, Sel0, NotSel1);
	 and and2(Y2, NotSel0, Sel1);
	 and and3(Y3, Sel0, Sel1);
    
	 
endmodule