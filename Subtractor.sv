module subtractor (output wire [7:0] F, input wire [7:0] A, input wire [7:0] B);

assign F = B - A;

endmodule
