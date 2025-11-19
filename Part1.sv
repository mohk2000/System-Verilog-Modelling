module alu_1bit (input logic A,B,Cin, input logic [1:0] op, output logic result,Cout);

always_comb begin
result = 0;
Cout = 0;


	case (op)
		2'b00: result = A&B;
		2'b01: result = A|B;
		2'b10: begin
				result = A^B^Cin;
				Cout = A&B | (Cin & (A^B));
		end
		2'b11: begin
			result = (A^~B)^Cin;
			Cout = A&~B | (Cin & (A^~B));
		end

	default: begin
			result = 0;
			Cout = 0;
			end
	endcase

end
endmodule

