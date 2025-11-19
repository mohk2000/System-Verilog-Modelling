`timescale 1ns / 1ns

module tb_shift_register();

    reg clk;
    reg reset;
    reg [1:0] mode;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate the DUT (Device Under Test)
    shift_register uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Generate Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        reset = 0;
        mode = 2'b00;
        data_in = 8'b00000000;

        // Apply Reset
        reset = 1; #10;
        reset = 0; #10;

        // Parallel Load
        mode = 2'b01;
        data_in = 8'b10101010;
        #10;

        // Shift Left
        mode = 2'b10;
        repeat(3) #10;

        // Shift Right
        mode = 2'b11;
        repeat(3) #10;

        // Apply Reset again
        mode = 2'b00;
        #10;

    end


endmodule

