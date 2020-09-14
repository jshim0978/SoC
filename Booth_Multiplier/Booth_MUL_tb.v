`timescale 1ns/100ps

module Booth_MUL_tb;

reg[5:0] A,B;


wire ov;
wire [10:0] Mul_result;

reg[10:0] check;

integer i,j;
integer num_correct, num_wrong;


Booth_MUL Booth_MUL_0(.A(A), .B(B), .m(Mul_result), .ov(ov));

initial begin
	num_correct=0; num_wrong = 0;
	
	$display("Done");

	#40
	
	for(i = 0; i < 126; i=i+1) begin
	#40

		A=i;
		for(j = 0; j<126; j= j+1) begin
		#40
		B=j;
			check = A*B;

			

			#10;
			#40
			if({ ov, Mul_result} == check)
			#40
				num_correct = num_correct +1;
			else
			#40
				num_wrong = num_wrong+1;
				
		end
	end
	
end

endmodule