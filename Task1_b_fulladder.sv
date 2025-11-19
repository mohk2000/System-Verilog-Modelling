module full_adder (output wire sum, output wire Cout, input wire A, input wire B, input wire Cin);

wire x1, x2, x3; 

half_adder g1(x1, x2, A, B);
half_adder g2(sum, x3, x1, Cin);
or g3(Cout, x3, x2);

endmodule




