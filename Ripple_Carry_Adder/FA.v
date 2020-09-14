module FA(X,Y,Cin,Cout,Sum);

input X, Y,Cin;
output Cout, Sum;

	assign{Cout, Sum} = X + Y + Cin;

endmodule