module Decoder1to2(output wire [1:0]d, input wire enable, input wire A);

and g0(d[0], enable, ~A);
and g1(d[1], enable, A);

endmodule


module Decoder2to4 (output wire [3:0] D, input wire [1:0]A, input wire enable);

and g2(D[0], ~A1, ~A2, ~enable);
and g3(D[1], A1, ~A2, ~enable);
and g4(D[2], ~A1, A2, ~enable);
and g5(D[3], A1, A2, ~enable);

endmodule