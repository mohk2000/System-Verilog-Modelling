`timescale 1ns/1ns
module testbench;

logic A;
logic F;

Task2 dut1 (F, A);

initial
begin

	A = 1'b0;
	#20
	
	A = 1'b1;
	#20
	
	A = 1'b0;
	#20
	
	A = 1'b1;
	#20
	A = 1'b0;
	#20
	A = 1'b1;
	#20
	A = 1'b0;
	


end
endmodule
