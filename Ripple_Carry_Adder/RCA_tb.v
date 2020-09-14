`timescale 1ns/100ps

module RCA_tb;

reg [7:0] X,Y;
reg Cin;

reg [8:0] check;


wire Cout;
wire [7:0] Sum;

integer i,j,num_correct,num_wrong;




RCA_8_TOP RCA_8b_0(.X(X), .Y(Y), .Cin(Cin), .Cout(Cout), .Sum(Sum));

initial begin
	num_correct = 0; num_wrong = 0;
	for(i=0; i<256; i= i+1) begin
		X = i;
		for(j=0; j<256; j=j+1) begin
			Y=j;
			Cin = 1'b0;
			
			check = X + Y + Cin;
			
			#10;
			if({Cout, Sum} == check)
				num_correct = num_correct +1;
			else 
				num_wrong = num_wrong +1;
			end
		end
		$display("num_correct = %d, num_wrong = %d",num_correct, num_wrong);
	
	
	end
endmodule	
				
		