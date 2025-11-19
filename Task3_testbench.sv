`timescale 1ns/1ns
module tb_vending_machine;

    reg clk = 0;
    reg reset;
    reg [3:0] COIN;
    wire OPEN, CHANGE;

    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .COIN(COIN),
        .OPEN(OPEN),
        .CHANGE(CHANGE)
    );

    // Clock generation (period = 10 ns)
    always #5 clk = ~clk;

    initial begin

        // Initialize
        reset = 0; COIN = 0;
        #10 reset = 1;

        // Insert Rs5 + Rs10 = Rs15 (dispense cola, no change)
        #10 COIN = 5;
        #10 COIN = 10;
        #10 COIN = 0;

        // Insert Rs10 + Rs10 = Rs20 (dispense cola + change)
        #10 COIN = 10;
        #10 COIN = 10;
        #10 COIN = 0;

        // Insert Rs5 + Rs5 + Rs5 = Rs15 (dispense cola)
        #10 COIN = 5;
        #10 COIN = 5;
        #10 COIN = 5;
        #10 COIN = 0;

    end

endmodule

