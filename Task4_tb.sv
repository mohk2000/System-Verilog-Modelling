`timescale 1ns/1ns

module counter2to4_tb;

  logic clk;
  logic [2:0] out;

  // Instantiate DUT
  counter2to4 my_counter (clk,out);

  // Generate a clock (10 ns period)
  initial clk = 0;
  always #5 clk = ~clk;

endmodule


