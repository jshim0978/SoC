module mux_4_1_top(Out_df,Out_st,Out_bh, In0, In1, In2, In3, Sel1, Sel0);

output Out_df, Out_bh, Out_st;
input  In0, In1, In2, In3, Sel1, Sel0;

mux_4_1_df Mux0(.Out(Out_df), .In0(In0), .In1(In1), .In2(In2), .In3(In3), .Sel1(Sel1), .Sel0(Sel0));

mux_4_1_st Mux1(.Out(Out_st), .In0(In0), .In1(In1), .In2(In2), .In3(In3), .Sel1(Sel1), .Sel0(Sel0));

mux_4_1_bh Mux2(.Out(Out_bh), .In0(In0), .In1(In1), .In2(In2), .In3(In3), .Sel1(Sel1), .Sel0(Sel0));

endmodule