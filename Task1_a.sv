module half_adder (output wire sum, output wire Cout, input wire A, input wire B);

xor g1(sum, A, B);
and g2(Cout, A, B);

endmodule