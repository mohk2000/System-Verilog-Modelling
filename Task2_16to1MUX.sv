module MUX16to1(output wire Y, input wire [15:0] A, input wire [3:0] select);

wire x0, x1, x2, x3;

MUX g0(x0, A[0], A[1], A[2], A[3], select[0], select[1]);
MUX g1(x1, A[4], A[5], A[6], A[7], select[0], select[1]);
MUX g2(x2, A[8], A[9], A[10], A[11], select[0], select[1]);
MUX g3(x3, A[12], A[13], A[14], A[15], select[0], select[1]);
MUX g4(Y, x0, x1, x2, x3, select[3], select[2]);

endmodule
 
