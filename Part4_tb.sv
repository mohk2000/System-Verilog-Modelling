`timescale 1ns/1ns
`include "Part3.sv"



class ALU_Test;
    rand logic [7:0] A, B;
    rand logic Cin;
    rand ALU_Operation op;

    // Constraint: op must be one of the defined operations
    constraint valid_op {
        op inside {ALU_AND, ALU_OR, ALU_ADD, ALU_SUB};
    }




endclass

module tb_AlU_8bit;

    parameter WIDTH = 8;
	ALU_IO alu_in;
	logic  [7:0] result;
	logic  Cout;
	
  
    // --- Instantiate DUT ---
    Alu_8bit #(WIDTH) alu_tb (
	alu_in,
	result,
	Cout);

ALU_Test test;
    // --- Stimulus ---
    initial begin
   
	test=new();

     // --- Randomized tests ---
        repeat (10) begin
            assert(test.randomize())
                else $fatal("Randomization failed!");
            
            // Apply random values to DUT
            alu_in.operand1  = test.A;
            alu_in.operand2  = test.B;
            alu_in.operand3  = test.Cin;
            alu_in.operation = test.op;
	#10;	
        end

    end

endmodule

