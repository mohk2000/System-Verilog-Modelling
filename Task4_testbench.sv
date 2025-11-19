`timescale 1ns/1ps
module tb_task4_FA;

    // DUT Inputs
    logic A, B, Cin;

    // DUT Outputs
    logic sum, Cout;

    // Instantiate the DUT
    task4_FA uut (
        .sum(sum),
        .Cout(Cout),
        .A(A),
        .B(B),
        .Cin(Cin)
    );

      initial begin
        // Initialize
        {A, B, Cin} = 3'b000;

        // Apply all combinations
        repeat (8) begin
            #10 {A, B, Cin} = {A, B, Cin} + 1;
        end

    end

endmodule

