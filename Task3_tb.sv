`timescale 1ns/1ns

module tb_task3;

//Declaring parameters
parameter ADDR_WIDTH = 9;
parameter DATA_WIDTH = 8;
parameter MEM_DEPTH = 512;

//Declaring signals

reg clk,read,write;

reg [ADDR_WIDTH-1:0] addr;
reg [DATA_WIDTH-1:0] data_in;
reg [DATA_WIDTH-1:0] data_out;

integer stimulus,result;
integer status;
integer i;

reg [7:0] char; // variable to store the ASCII value

    // Instantiate DUT
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

    // Clock generation
    always #5 clk = ~clk;

    // Continuous monitor (for reference)
    initial begin
        $monitor("Time=%0t | Addr=%0d | Write=%b | Read=%b | Data_in=%0d | Data_out=%0d",
                 $time, addr, write, read, data_in, data_out);
    end

    // Main test process
    initial begin
        // Initialize
        clk = 0;
        read = 0;
        write = 0;
        addr = 0;
        data_in = 0;

        // Open files
        stimulus = $fopen("stimulus.txt", "r");
        if (stimulus == 0) begin
            $display("ERROR: Could not open stimulus.txt");
            $finish;
        end

        result = $fopen("test_results.txt", "w");
        if (result == 0) begin
            $display("ERROR: Could not open test_results.txt");
            $finish;
        end

        $display("----- Reading data from stimulus.txt and writing to memory -----");

        // STEP 1: Read ASCII data from file and write to memory
        i = 0;
        while (!$feof(stimulus)) begin
            status = $fscanf(stimulus, "%c\n", char);
            @(negedge clk);
            write = 1;
            read = 0;
            addr = i;
            data_in = char;  // write ASCII value
            @(negedge clk);
            $display("Wrote '%c' (ASCII=%0d) to address %0d", char, data_in, addr);
            i = i + 1;
        end
        write = 0;

        $display("----- Reading back data from memory and comparing -----");

        // STEP 2: Read back from memory and compare
        for (addr = 0; addr < i; addr = addr + 1) begin
            @(negedge clk);
            write = 0;
            read = 1;
            @(negedge clk);
            $display("Read from memory: ASCII=%0d ('%c') at address %0d",
                     data_out, data_out, addr);

            // Compare read data with expected data
            // For verification, reopen file or store data (simpler here: re-read from file)
        end
        read = 0;

        // STEP 3: Compare with original data
        $rewind(stimulus);
        for (addr = 0; addr < i; addr = addr + 1) begin
            status = $fscanf(stimulus, "%c\n", char);
            @(negedge clk);
            write = 0; read = 1;
            @(negedge clk);
            if (data_out === char) begin
                $fwrite(result, "Address %0d: PASS ('%c' == '%c')\n",
                        addr, data_out, char);
            end else begin
                $fwrite(result, "Address %0d: FAIL ('%c' != '%c')\n",
                        addr, data_out, char);
            end
        end

        // Close files
        $fclose(stimulus);
        $fclose(result);

        $display("----- Test completed. Results written to test_results.txt -----");
        #20;
        $finish;
    end

endmodule




