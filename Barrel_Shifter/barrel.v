module barrel(shift, lr, in, out);

	input [3:0] shift;
	input [15:0] in;
	input lr;
	
	output [15:0] out;
	
	wire [15:0] st1,st2,st3;
	
	//arithmetic shift
	assign st1 = shift[0] ? (lr? {in[14:0], 1'b0}:{in[15],in[15:1]}) :in[15:0];
	assign st2 = shift[1] ? (lr? {st1[13:0], 2'b0}:{st1[15],st1[15],st1[15:2]}):st1[15:0];
	
	assign st3 = shift[2] ? (lr? {st2[11:0], 4'b0}:{st2[15],st2[15],st2[15],st2[15],st2[15:4]}):st2[15:0];
	
	
	assign out = shift[3] ? (lr? {st3[7:0], 8'b0}:{st3[15],st3[15],st3[15],st3[15],st3[15],st3[15],st3[15],st3[15],st3[15:8]}):st3[15:0];
endmodule

module barrel2(shift, lr, in, out);

	input [3:0] shift;
	input [15:0] in;
	input lr;
	
	output [15:0] out;
	
	wire [15:0] st1,st2,st3;
	
	//arithmetic shift
	assign st1 = shift[0] ? (lr? {in[14:0], in[15]}:{in[0],in[15:1]}) :in[15:0];
	assign st2 = shift[1] ? (lr? {st1[13:0], st1[15:14]}:{st1[1:0],st1[15:2]}):st1[15:0];
	
	assign st3 = shift[2] ? (lr? {st2[11:0], st2[15:12]}:{st2[3:0],st2[15:4]}):st2[15:0];
	
	
	assign out = shift[3] ? (lr? {st3[7:0], st3[15:8]}:{st3[7:0],st3[15:8]}):st3[15:0];
endmodule