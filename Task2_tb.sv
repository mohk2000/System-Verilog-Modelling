`timescale 1ns/1ns
module clock_testbench;


reg clk1_tb;
reg clk2_tb;

parameter period = 40;		//time period for clock
parameter half_period = period/2;



initial clk1_tb = 0;
always #half_period clk1_tb = ~clk1_tb;		//toggles in the given time

initial begin
    clk2_tb = 0;                // start from 0
    forever begin
        #half_period clk2_tb = ~clk2_tb;
    end
end

initial begin
    #200 $finish; // run for 200 ns
end

endmodule