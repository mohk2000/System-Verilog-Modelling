`timescale 1ns/1ns
module alu_testbench;

wire [63:0] out;
reg [31:0] A; 
reg [31:0] B;
reg Cin;
reg [2:0] opcode;

alu dut1 (out, A, B, Cin, opcode);

initial 
begin
 
	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b000;
	#10

	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b001; 

	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b010;
	#10

	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b011;
	#10

	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b100;
	#10

	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b101;
	#10

	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b110;
	#10

	A = 32'hFA912345;
	B = 32'hABCD1234;
	Cin = 1'b1;
	opcode = 3'b111;

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b000;
	#10

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b001; 

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b010;
	#10

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b011;
	#10

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b100;
	#10

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b101;
	#10

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b110;
	#10

	A = 32'h123456789;
	B = 32'hABCDEF123;
	Cin = 1'b1;
	opcode = 3'b111;

end 
endmodule




