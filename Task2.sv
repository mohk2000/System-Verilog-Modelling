module sequence_detection (input logic clk, input logic reset, input logic A, output wire Z);

//Creating state machine to detect the sequence

reg q0, q1;
wire n1, n0;

//Next state logic

assign n1 = (q1 & ~q0) | (A & q0 & ~q1);
assign n0 = (~q0) & (A ^ q1);

assign Z = q1 & q0 & A;


    // state register
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            q1 <= 1'b0;
            q0 <= 1'b0;
        end else begin
            q1 <= n1;
            q0 <= n0;
        end
    end

endmodule
