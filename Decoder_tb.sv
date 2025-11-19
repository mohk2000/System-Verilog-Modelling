`timescale 1ns/1ns
module decoder_testbench;

reg [2:0] A;
reg enable;
wire [7:0] D;

Decoder3to8 dut3 (D, A, enable);
initial
begin

	A = 3'b000;
	enable = 0;
	#10

	A = 3'b001;
	enable = 0;
	#10	

	A = 3'b010;
	enable = 0;
	#10

	A = 3'b011;
	enable = 0;

end 
endmodule
