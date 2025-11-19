`timescale 1ns/1ns
module task5_testbench;

logic x, z, y;
logic f;

Task5 dut4 (f, x, z, y);
initial
begin

	x = 1'b0;
	z = 1'b0;
	y = 1'b0;
	#10

	x = 1'b0;
	z = 1'b0;
	y = 1'b1;
	#10

	x = 1'b0;
	z = 1'b1;
	y = 1'b0;
	#10

	x = 1'b0;
	z = 1'b1;
	y = 1'b1;
	#10

	x = 1'b1;
	z = 1'b0;
	y = 1'b0;
	#10

	x = 1'b1;
	z = 1'b0;
	y = 1'b1;
	#10

	x = 1'b1;
	z = 1'b1;
	y = 1'b0;
	#10

	x = 1'b1;
	z = 1'b1;
	y = 1'b1;
	
end
endmodule
