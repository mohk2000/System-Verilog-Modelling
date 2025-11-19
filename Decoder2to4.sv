`timescale 1ns/1ns
module Decoder2to4 (output wire D0, output wire D1, output wire D2, output wire D3, input wire A0, input wire A1);

	wire x1, x20; 
	
assign x1 = ~A0;
assign x2 = ~A1;
assign D0 = x1 && x2;

assign D1 = A0 && x2;
assign D2 = A1 && x1;
assign D3 = A0 && A1;

endmodule
