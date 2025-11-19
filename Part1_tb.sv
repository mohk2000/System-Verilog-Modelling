`timescale 1ns/1ps
module tb_alu_1bit;

    // Testbench signals
    logic A, B, Cin;
    logic [1:0] op;
    logic result, Cout;

    // Instantiate the ALU
    alu_1bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .op(op),
        .result(result),
        .Cout(Cout)
    );


    // Test procedure
    initial begin
        // Iterate through all operation modes and input combinations
        for (int i = 0; i < 4; i++) begin
            op = i[1:0];
            for (int j = 0; j < 2; j++) begin
                A = j;
                for (int k = 0; k < 2; k++) begin
                    B = k;
                    for (int m = 0; m < 2; m++) begin
                        Cin = m;
                        #5; // wait for result
                    end
                end
            end
        end
    end

endmodule


