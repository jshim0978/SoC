`timescale 1ns / 1ps

module decoder2to4_tb();

	reg Sel0,Sel1;
	wire bh_Y0, bh_Y1, bh_Y2, bh_Y3 , st_Y0, st_Y1, st_Y2, st_Y3 , df_Y0, df_Y1, df_Y2, df_Y3;

//	decoder2to4_top decoder2to4_block(Sel0,Sel1,Y0,Y1,Y2,Y3);
	decoder2to4_top decoder2to4_block( Sel0,Sel1, bh_Y0, bh_Y1, bh_Y2, bh_Y3 , st_Y0, st_Y1, st_Y2, st_Y3 , df_Y0, df_Y1, df_Y2, df_Y3);

	initial begin

	
		Sel1 = 0; Sel0 = 0; 
		#10;
		Sel0 = 1; 
		#10;
		Sel1 = 1; Sel0 = 0; 
		#10;
		Sel1 = 1; Sel0 = 1; 
		#10;
	end


endmodule