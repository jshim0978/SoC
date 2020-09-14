
module ALU (valA, valB, aluop, sub, cc, shift, lr, result);
	
	input[15:0] valA;
	input[15:0] valB;
	input[3:0] aluop; //4bits for 11 ops 
	// Add, Subtract, Shift Left, Arithmetic Shift Right, Logical Shift Right, Rotate Left, Rotate Right, And, Or, Not, Xor
	
	input[3:0] shift;
	input sub, lr;
	
	output[3:0] cc;
	output[15:0] result;
	
	wire[15:0]and16b, or16b, shift_out, add_out, svalB, result;
	
	wire[15:0]shiftA, shiftL, rot_out, not16, xor16;
	
	wire shift_ov, add_co;
	wire[3:0] cc;
	wire N,Z,C,V;
	
	assign and16b = valA & valB;
	assign or16b = valA | valB;
	assign not16 = ~valA;
	assign xor16 = valA ^ valB;
	
	shifter myShifter (.valA(valA), .shift(shift), .lr(lr), .shift_ov(shift_ov), .shift_out(shift_out));
	
	
	alshifter myalShifter(.valA(valA), .shift(shift), .shift_out(shiftA));
	
	rotate myRotate(.shift(shift), .lr(lr), .valA(valA), .rot_out(rot_out));
	
	
	assign svalB = sub? ~valB : valB;
	
	adder myAdder(.valA(valA), .svalB(svalB), .sub(sub), .add_co(add_co), .add_out(add_out));
	
	
	
	
	
	assign result = 
			(aluop == 4'b0000) ? add_out: // Add
			(aluop == 4'b0001) ? add_out: // Subtract
			
			
			
			(aluop == 4'b0010) ? shift_out: // shift left
			(aluop == 4'b0011) ? shiftA: // arithmetic shift right --> copy sign bit
			(aluop == 4'b0100) ? shift_out: // logical shift right
			
			
			
			(aluop == 4'b0101) ? rot_out: // rotate left
			(aluop == 4'b0110) ? rot_out: // rotate right
			(aluop == 4'b0111) ? and16b: // and
			(aluop == 4'b1000) ? or16b: // or
			(aluop == 4'b1001) ? not16: // not
			(aluop == 4'b1010) ? xor16: 16'bx;// xor
	
	assign N = result[15];
	assign Z = ~|result;
	assign C = (aluop == 4'b0000) ? add_co : 1'b0;
	assign V = (aluop == 4'b0010) ? shift_ov:
					(aluop == 4'b0000) ?
					(~valA[15]&~svalB[15]&add_out[15])|/* (-) + (-) = (+) */
					(valA[15]&svalB[15]&~add_out[15]):/* (+) + (+) = (-) */
					1'b0;
	assign cc = {N,Z,C,V};
endmodule


//adder w/ carry carriage
module adder(valA, svalB, sub, add_co, add_out);
	input[15:0] valA, svalB;
	input sub;
	output[15:0] add_out;
	output add_co;
	
	reg[16:0] temp_s;
	
	always @(*) begin
		temp_s = valA + svalB;
		end
		assign add_co = temp_s[16];
		assign add_out = temp_s[15:0];
endmodule


//logical barrel ->0s at the pushed side
module shifter (valA, shift, lr, shift_ov, shift_out);
	input[15:0] valA; //in
	input[3:0] shift;
	input lr;
	output[15:0] shift_out;
	output shift_ov;
	
	wire[15:0] st1, st2, st3;
	assign st1 = shift[0] ? (lr? {valA[14:0], 1'b0}:{1'b0,valA[15:1]}) : valA[15:0];
	assign st2 = shift[1] ? (lr? {st1[13:0], 2'b0}: {2'b0,st1[15:2]}) : st1[15:0];
	assign st3 = shift[2] ? (lr? {st2[11:0], 4'b0}:{4'b0,st2[15:4]}):st2[15:0];
	assign shift_out = shift[3] ? (lr? {st3[7:0], 8'b0}:{8'b0,st3[15:8]}):st3[15:0];
	assign shift_ov = 1'b0;
endmodule



//arithmetic barrel -> sign bits at the pushed side()
module alshifter (valA, shift, shift_out);
	input[15:0] valA; //in + lr at 15
	input[3:0] shift;
	output[15:0] shift_out;
	
	wire[15:0] st1, st2, st3;
	assign st1 = shift[0] ? (valA[15]? {1'b1, valA[15:1]}:{valA[15],valA[15:1]}) : valA[15:0];
	assign st2 = shift[1] ? (st1[15]? {2'b11, st1[15:2]}: {st1[15],st1[15],st1[15:2]}) : st1[15:0];
	assign st3 = shift[2] ? (st2[15]? {4'b1111, st2[15:4]}:{st2[15],st2[15],st2[15],st2[15],st2[15:4]}):st2[15:0];
	assign shift_out = shift[3] ? (st3[15]? {8'b11111111, st3[15:8] }:{st3[15],st3[15],st3[15],st3[15],st3[15],st3[15],st3[15],st3[15],st3[15:8]}):st3[15:0];
endmodule


//barrel 2
module rotate(shift, lr, valA, rot_out);
	input[3:0] shift;
	input lr;
	input[15:0] valA; //in
	output[15:0] rot_out;
	
	wire [15:0] st1, st2, st3;
	
	assign st1 = shift[0]?(lr? {valA[14:0], valA[15]} : {valA[0],valA[15:1]}) : valA[15:0];
	assign st2 = shift[1]?(lr? {st1[13:0], st1[15:14]} : {st1[1:0],st1[15:2]}) : st1[15:0];
	assign st3 = shift[2]?(lr? {st2[11:0], st2[15:12]} : {st2[3:0],st2[15:4]}) : st2[15:0];
	assign rot_out = shift[3]?(lr? {st3[7:0], st3[15:8]} : {st3[7:0],st3[15:8]}):st3[15:0];
endmodule   
