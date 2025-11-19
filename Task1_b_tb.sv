module fulladder_testbench;

logic A, B, Cin;
logic sum, Cout;

full_adder dut (sum, Cout, A, B, Cin);

initial
begin

	A = 1'b0;
	B = 1'b0;
	Cin = 1'b0;
	#10

	A = 1'b0;
	B = 1'b0;
	Cin = 1'b1;
	#10

	A = 1'b0;
	B = 1'b1;
	Cin = 1'b0;
	#10

	A = 1'b0;
	B = 1'b1;
	Cin = 1'b1;
	#10

	A = 1'b1;
	B = 1'b0;
	Cin = 1'b0;
	#10

	A = 1'b1;
	B = 1'b0;
	Cin = 1'b1;
	#10

	A = 1'b1;
	B = 1'b1;
	Cin = 1'b0;
	#10

	A = 1'b1;
	B = 1'b1;
	Cin = 1'b1;

end
endmodule
