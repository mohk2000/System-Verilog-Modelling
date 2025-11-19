module ALU_8bit #(parameter WIDTH = 8) (input logic [WIDTH-1:0] A,B, input logic Cin, input logic [1:0] op, output logic [WIDTH-1:0] result, output logic Cout);
	

logic [WIDTH:0]  carry;
assign carry[0] = Cin;
	genvar i;
	generate	
	for (i=0; i<WIDTH; i++) begin : alu_bits
		alu_1bit dut1 (A[i],B[i], Cin, op, result[i], Cout);
		end
	endgenerate

assign Cout = carry [WIDTH];
endmodule

