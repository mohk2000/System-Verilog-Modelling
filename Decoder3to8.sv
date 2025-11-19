module Decoder3to8 (output wire [7:0] D, input wire [2:0] A, input wire enable);

wire [1:0] x;

Decoder1to2 g0 (x[1:0], A[2], enable);
Decoder2to4 g1(D[3:0], A[1:0], x[0]);
Decoder2to4 g2(D[7:4], A[1:0], x[1]);

endmodule