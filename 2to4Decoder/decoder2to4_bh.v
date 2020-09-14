module decoder2to4_bh(Sel0, Sel1, Y0,Y1,Y2,Y3);
	 
	 input Sel0,Sel1;
    output reg Y0, Y1, Y2, Y3;
	 
	 always @(Sel1,Sel0)
		case ({Sel1,Sel0})
			2'b00 : {Y3,Y2,Y1,Y0} = 4'b0001;
			2'b01 : {Y3,Y2,Y1,Y0} = 4'b0010;
			2'b10 : {Y3,Y2,Y1,Y0} = 4'b0100;
			2'b11 : {Y3,Y2,Y1,Y0} = 4'b1000;
		endcase
		
endmodule