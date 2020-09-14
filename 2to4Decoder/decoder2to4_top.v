module decoder2to4_top( Sel0,Sel1, bh_Y0, bh_Y1, bh_Y2, bh_Y3 , st_Y0, st_Y1, st_Y2, st_Y3 , df_Y0, df_Y1, df_Y2, df_Y3);

output bh_Y0, bh_Y1, bh_Y2, bh_Y3 , st_Y0, st_Y1, st_Y2, st_Y3 , df_Y0, df_Y1, df_Y2, df_Y3;

input Sel0,Sel1;

decoder2to4_df Decoder0(.Sel0(Sel0), .Sel1(Sel1), .Y0(df_Y0), .Y1(df_Y1), .Y2(df_Y2), .Y3(df_Y3));
decoder2to4_st Decoder1(.Sel0(Sel0), .Sel1(Sel1), .Y0(st_Y0), .Y1(st_Y1), .Y2(st_Y2), .Y3(st_Y3));
decoder2to4_bh Decoder2(.Sel0(Sel0), .Sel1(Sel1), .Y0(bh_Y0), .Y1(bh_Y1), .Y2(bh_Y2), .Y3(bh_Y3));

endmodule