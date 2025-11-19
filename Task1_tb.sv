`timescale 1ns/1ps
module tb_memory;

    // Parameters for 4Kb memory
    parameter ADDR_WIDTH = 9;
    parameter DATA_WIDTH = 8;
    parameter MEM_DEPTH  = 512;

    // Testbench signals
    reg clk;
    reg read;
    reg write;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;

    integer i;
    integer error_count = 0;

    // Instantiate the memory module
    memory #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .MEM_DEPTH(MEM_DEPTH)
    ) uut (
        .clk(clk),
        .read(read),
        .write(write),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Continuous monitoring
    initial begin
        $monitor("Time=%0t | Addr=%0d | Write=%b | Read=%b | Data_in=%0d | Data_out=%0d",
                 $time, addr, write, read, data_in, data_out);
    end

    // Main test sequence
    initial begin
        clk = 0;
        read = 0;
        write = 0;
        addr = 0;
        data_in = 0;

        // STEP 1: Write zeros to all memory locations
        $display("----- STEP 1: Writing 0 to all memory locations -----");
        for (i = 0; i < MEM_DEPTH; i = i + 1) begin
            @(negedge clk);
            write = 1; read = 0;
            addr = i;
            data_in = 8'd0;
        end
        @(negedge clk);
        write = 0;

        // STEP 2: Read all memory locations (expect zeros)
        $display("----- STEP 2: Reading all memory locations (expect 0) -----");
        for (i = 0; i < MEM_DEPTH; i = i + 1) begin
            @(negedge clk);
            write = 0; read = 1;
            addr = i;
            @(posedge clk);
            if (data_out !== 8'd0) begin
                $display("Error at address %0d: expected 0, got %0d", i, data_out);
                error_count = error_count + 1;
            end
        end
        read = 0;

        // STEP 3: Write address value to each memory location
        $display("----- STEP 3: Writing address value to each location -----");
        for (i = 0; i < MEM_DEPTH; i = i + 1) begin
            @(negedge clk);
            write = 1; read = 0;
            addr = i;
            data_in = i[7:0]; // Lower 8 bits of address
        end
        @(negedge clk);
        write = 0;

        // STEP 4: Read and verify address values
        $display("----- STEP 4: Reading and verifying data -----");
        for (i = 0; i < MEM_DEPTH; i = i + 1) begin
            @(negedge clk);
            write = 0; read = 1;
            addr = i;
            @(posedge clk);
            if (data_out !== i[7:0]) begin
                $display("Mismatch at addr %0d: expected %0d, got %0d", i, i[7:0], data_out);
                error_count = error_count + 1;
            end else begin
                $display("Addr %0d OK: read %0d as expected", i, data_out);
            end
        end
        read = 0;

        $display("----- TEST COMPLETE -----");
        if (error_count == 0)
            $display("All tests passed successfully!");
        else
            $display("%0d errors found during testing.", error_count);

        #20;
        $finish;
    end

endmodule
