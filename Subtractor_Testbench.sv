`timescale 1ns/1ns
module subtractor_testbench;

logic [7:0] F;
logic [7:0] A;
logic [7:0] B;

subtractor dut2 (F, A, B);

initial 
begin

	A = 8'h11;
	B = 8'h1A;
	#10

	A = 8'h11;
	B = 8'h17;
	#10

	A = 8'h11;
	B = 8'h12;
	#10

	A = 8'h11;
	B = 8'h1F;

end
endmodule
