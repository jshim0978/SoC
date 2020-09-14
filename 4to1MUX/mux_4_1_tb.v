`timescale 1ns/100ps

module mux_4_1_tb;

	reg In0, In1, In2, In3, Sel1, Sel0;
	wire Out_df, Out_st, Out_bh;
	
	mux_4_1_top Block1(.Out_df(Out_df),.Out_st(Out_st),.Out_bh(Out_bh), .In0(In0), .In1(In1), .In2(In2), .In3(In3), .Sel1(Sel1), .Sel0(Sel0));
	
	initial begin
			In0 = 1'bx; In1 = 1'bx; In2 = 1'bx; In3 = 1'bx; Sel1 = 2'bx; Sel0 = 2'bx;
		
			#10
			
//			In0 = 0; In1 = 1; In2 = 0; In3 = 1; Sel1 = 0; Sel0 = 0;
//			
//			#10
//			
//			Sel1 = 1;
//			Sel0 = 1;
//			#10;		
//			
	
			In0=0; In1=0; In2=0; In3= 0; Sel0=0; Sel1=1;      
			#10                        
			In0=1; In1=0; In2=0; In3= 0; Sel0=0; Sel1=1;      
			#10  
			In0=0; In1=0; In2=0; In3= 0; Sel0=1; Sel1=0;      
			#10     
			In0=0; In1=1; In2=0; In3= 0; Sel0=1; Sel1=0;      
			#10;   
				
		end

	
	
	endmodule