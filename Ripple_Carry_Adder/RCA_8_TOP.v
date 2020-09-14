//RCA_8 TOP

module RCA_8_TOP(X, Y, Cin, Cout, Sum);

	input [7:0] X, Y;
	input Cin;
	
	output [7:0] Sum;
	output Cout;
	
	wire [6:0] carry;
	
	FA FA0(.X(X[0]), .Y(Y[0]), .Cin(Cin), .Cout(carry[0]), .Sum(Sum[0]));
	FA FA1(.X(X[1]), .Y(Y[1]), .Cin(carry[0]), .Cout(carry[1]), .Sum(Sum[1]));
	FA FA2(.X(X[2]), .Y(Y[2]), .Cin(carry[1]), .Cout(carry[2]), .Sum(Sum[2]));
	FA FA3(.X(X[3]), .Y(Y[3]), .Cin(carry[2]), .Cout(carry[3]), .Sum(Sum[3]));
	FA FA4(.X(X[4]), .Y(Y[4]), .Cin(carry[3]), .Cout(carry[4]), .Sum(Sum[4]));
	FA FA5(.X(X[5]), .Y(Y[5]), .Cin(carry[4]), .Cout(carry[5]), .Sum(Sum[5]));
	FA FA6(.X(X[6]), .Y(Y[6]), .Cin(carry[5]), .Cout(carry[6]), .Sum(Sum[6]));
	FA FA7(.X(X[7]), .Y(Y[7]), .Cin(carry[6]), .Cout(Cout), .Sum(Sum[7]));
	
endmodule
	