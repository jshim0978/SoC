module decoder2to4_df(Sel0, Sel1, Y0,Y1,Y2,Y3);

   input Sel0,Sel1;
   output Y0, Y1, Y2, Y3;
	
   assign Y0 = ~Sel0 & ~Sel1;
   assign Y1 = Sel0 & ~Sel1;
   assign Y2 = ~Sel0 & Sel1;
   assign Y3 = Sel0 & Sel1;

        
    
endmodule