typedef enum logic [1:0] {
    ALU_AND = 2'b00,
    ALU_OR  = 2'b01,
    ALU_ADD = 2'b10,
    ALU_SUB = 2'b11
} ALU_Operation;


typedef struct{
    logic [7:0] operand1;
    logic [7:0] operand2;
    logic operand3;
    ALU_Operation operation;
} ALU_IO;


module Alu_8bit #(parameter WIDTH = 8)
(
    input  ALU_IO alu_in,              // Struct input
    output logic [WIDTH-1:0] result,   // ALU output
    output logic Cout                  // Final carry out
);

    logic [WIDTH:0] carry;
    assign carry[0] = alu_in.operand3;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i++) begin : alu_bits
            alu_1bit dut1 (
                .A      (alu_in.operand1[i]),
                .B      (alu_in.operand2[i]),
                .Cin    (carry[i]),
                .op     (alu_in.operation),
                .result (result[i]),
                .Cout   (carry[i+1])
            );
        end
    endgenerate

    assign Cout = carry[WIDTH];

endmodule

