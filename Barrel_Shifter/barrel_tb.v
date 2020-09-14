`timescale 1ns/100ps

module barrel_tb;

wire [15:0] out;

reg [15:0] in;
reg [3:0] shift;
reg lr;

//barrel bs(.in(in), .lr(lr), .shift(shift), .out(out));
barrel2 bs2(.in(in), .lr(lr), .shift(shift), .out(out));


initial begin

	#10;
	in = 16'b1000000000000001;
	lr = 1'b1;
	shift = 4'b0110;
	#10
	shift = 4'b1100;
	#10;
	lr = 1'b0;
	shift = 4'b0110;
	#10;
	shift = 4'b1100;
	#100;
end

endmodule