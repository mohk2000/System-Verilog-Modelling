module alu (
    output reg [63:0] out,     
    input wire [31:0] A,
    input wire [31:0] B,
    input wire Cin,
    input wire [2:0] opcode   
);

always @(*) begin
    case (opcode)
        3'b000: out = A + B + Cin;
        3'b001: out = A - B;
        3'b010: out = A * B;
        3'b011: out = A / B;
        3'b100: out = A % B;
        3'b101: out = A & B;
        3'b110: out = A | B;
        3'b111: out = A + B;
        default: out = 0;
    endcase
end

endmodule
