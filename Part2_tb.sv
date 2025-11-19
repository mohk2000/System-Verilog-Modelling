`timescale 1ns/1ns
 
module tb_ALU_8bit; 

parameter WIDTH = 8; 
logic [WIDTH-1:0] A,B; 
logic Cin; 
logic [1:0] op; 
logic [WIDTH-1:0] result; 
logic Cout; 

// Instantiate the DUT (Device Under Test) 

ALU_8bit #(WIDTH) dut ( .A(A), .B(B), .Cin(Cin), .op(op), .result(result), .Cout(Cout) ); 
initial begin 
// Test 1: AND operation 
op = 2'b00; Cin = 0; 
A = 8'b10101010; B = 8'b11001100; 
#10; 
// Test 2: OR operation 
op = 2'b01; Cin = 0; 
A = 8'b10101010; B = 8'b11001100; 
#10; 
// Test 3: ADD operation 
op = 2'b10; Cin = 0; A = 8'b00001111; B = 8'b00000001; 
#10; 
// Test 4: ADD with carry 
op = 2'b10; Cin = 1; A = 8'b11111111; B = 8'b00000001; 
#10; 
// Test 5: Random values 
op = 2'b10; Cin = 0; A = $random; B = $random; 
end 
endmodule

