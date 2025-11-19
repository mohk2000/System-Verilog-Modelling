module ripple_adder (output wire [7:0] sum, output wire Cout, input wire [7:0] A, input wire [7:0] B, input wire Cin);

wire x0, x1, x2, x3, x4, x5, x6;

full_adder g0(sum[0], x0, A[0], B[0], Cin);
full_adder g1(sum[1], x1, A[1], B[1], x0);
full_adder g2(sum[2], x2, A[2], B[2], x1);
full_adder g3(sum[3], x3, A[3], B[3], x2);
full_adder g4(sum[4], x4, A[4], B[4], x3);
full_adder g5(sum[5], x5, A[5], B[5], x4);
full_adder g6(sum[6], x6, A[6], B[6], x5);
full_adder g7(sum[7], Cout, A[7], B[7], x6);

endmodule