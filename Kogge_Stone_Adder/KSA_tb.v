`timescale 1ns/100ps

module KSA_tb;

reg [15:0] X, Y;
reg Cin;

wire Cout;
wire [15:0] Sum;

//wire P_C, G_C, G_check;

reg [16:0] check;
integer i,j,k;
integer num_correct, num_wrong;

KSA KSA_0(.A(X), .B(Y), .Cin(Cin) ,.Cout(Cout), .Sum(Sum));

initial begin
  $display("Running testbench, this may take a minute or two...");
  // initialize the counter variables
  num_correct = 0; num_wrong = 0;
  // loop through all possible cases and record the results
  for (i = 0; i < 1024; i = i + 1) begin
    X = i;
    for (j = 0; j < 1024; j = j + 1) begin
      Y = j;
      for (k = 0; k < 2; k = k + 1) begin
        Cin = k;
        check = X + Y + Cin;

        // compute and check the product
        #2;
        if ({Cout, Sum} == check) begin
          num_correct = num_correct + 1;
        end else begin
          num_wrong = num_wrong + 1;
        end

        // following line is for debugging
        // $display($time, " %d + %d + %d = %d (%d)", a, b, c0, {c32, s}, check);
      end
    end
  end
  // print the final counter values
  $display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);
end

endmodule