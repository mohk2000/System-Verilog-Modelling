`timescale 1ns/1ns
module decoder_testbench;

logic a0, a1;
logic d0, d1, d2, d3;

Decoder2to4 dut (d0, d1, d2, d3, a0, a1);

initial 
begin

	a0 = 1'b0;
	a1 = 1'b0;
	#5

	a0 = 1'b0;
	a1 = 1'b1;
	#5

	a0 = 1'b1;
	a1 = 1'b0;
	#5

	a0 = 1'b1;
	a1 = 1'b1;
	
end
endmodule