module MUX (output wire y, input wire A, input wire B, input wire C, input wire D, input wire s0, input wire s1);

wire x0, x1, x2, x3;

and g0(x0, A, ~s0, ~s1);

and g1(x1, B, ~s0, s1);

and g2(x2, C, s0, ~s1);

and g3(x3, D, s0, s1);

or g4(y, x0, x1, x2, x3);

endmodule 
