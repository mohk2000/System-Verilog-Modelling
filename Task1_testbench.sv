`timescale 1ns/1ns
module testbench_xnor;


reg A,B,C;
wire Y;

xnor1 dut(Y, A, B, C);

initial
begin

	A = 1'b1;
	B = 1'b0;
	C = 1'b0;
	#10

	A = 1'b1;
	B = 1'b0;
	C = 1'b1;
	#10

	A = 1'b1;
	B = 1'b1;
	C = 1'b0;
	#10

	A = 1'b1;
	B = 1'b1;
	C = 1'b1;

end
endmodule
	
