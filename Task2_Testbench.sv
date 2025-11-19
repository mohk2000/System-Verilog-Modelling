// tb_seq1101.v
`timescale 1ns/1ns
module tb_seq1101;
    reg clk = 0;
    reg reset;
    reg A;
    wire Z;

    // instantiate
    sequence_detection uut (
        .clk(clk),
        .reset(reset),
        .A(A),
        .Z(Z)
    );

    // clock: 10 ns period
    always #5 clk = ~clk;

    initial begin

        // initial reset
        reset = 0; A = 0;
        #12;
        reset = 1;


        #8  A = 1;  // bit 1
        #10 A = 1;  // bit 1
        #10 A = 0;  // bit 0
        #10 A = 1;  // bit 1 -> detection here (Z=1)
        #10 A = 1;  // next bits after non-overlap reset
        #10 A = 1;
        #10 A = 0;
        #10 A = 1;  // another 1101; should produce a Z=1 here (non-overlapping)
        #30 A = 0;
        
    end
endmodule


