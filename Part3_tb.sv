`timescale 1ns/1ns
`include "Part3.sv"



module tb_Alu_8bit();

    parameter WIDTH = 8;
	ALU_IO alu_in;
	logic  [7:0] result;
	logic  Cout;
	
  
    // --- Instantiate DUT ---
    Alu_8bit #(WIDTH) dut5 (
	alu_in,
	result,
	Cout
    );

    // --- Stimulus ---
    initial begin
    

        // Test 1: AND operation
        alu_in.operation  = ALU_AND; alu_in.operand3 = 0;
        alu_in.operand1   = 8'b10101010;
        alu_in.operand2   = 8'b11001100;
        #10;

        // Test 2: OR operation
        alu_in.operation  = ALU_OR; alu_in.operand3 = 0;
        alu_in.operand1   = 8'b10101010;
        alu_in.operand2  = 8'b11001100;
        #10;

        // Test 3: ADD operation
        alu_in.operation  = ALU_ADD; alu_in.operand3 = 0;
        alu_in.operand1   = 8'b00001111;
        alu_in.operand2   = 8'b00000001;
        #10;

        // Test 4: ADD with carry
        alu_in.operation  = ALU_ADD; alu_in.operand3 = 1;
        alu_in.operand1   = 8'b11111111;
       	alu_in.operand2  = 8'b00000001;
        #10;

        // Test 5: SUB operation
        alu_in.operation  = ALU_SUB; alu_in.operand3 = 0;
        alu_in.operand1   = 8'b00001010;
        alu_in.operand2   = 8'b00000100;
        #10;

        // Test 6: Random values
        alu_in.operation  = ALU_ADD; alu_in.operand3 = 0;
        alu_in.operand1  = $random;
        alu_in.operand2   = $random;

    end

endmodule

