module RPA_testbench;

reg [7:0] A; reg [7:0] B;
reg Cin;
wire [7:0] sum;
wire Cout;

ripple_adder dut1 (sum, Cout, A, B, Cin);

initial
begin

	A = 8'h00;
	B = 8'h01;
	Cin = 1'b0;
	#10

	A = 8'h10;
	B = 8'h10;
	Cin = 1'b1;
	#10

	A = 8'h9A;
	B = 8'hAA;
	Cin = 1'b0;
	#10

	A = 8'h2D;
	B = 8'h78;
	Cin = 1'b1;

end 
endmodule

