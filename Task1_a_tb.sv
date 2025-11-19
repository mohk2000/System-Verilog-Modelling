`timescale 1ns/1ns

module half_adder_testbench;

logic A, B;
logic sum, Cout;

half_adder dut (sum, Cout, A, B);

initial
begin
	A = 1'b0;
	B = 1'b0;
	#10

	A = 1'b0;
	B = 1'b1;
	#10

	A = 1'b1;
	B = 1'b0;
	#10

	A = 1'b1;
	B = 1'b1;

end
endmodule