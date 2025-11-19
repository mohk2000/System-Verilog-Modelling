module vending_machine (
    input  logic clk,        // clock
    input  logic reset,      // active-low reset
    input  logic [3:0] COIN, // 5 or 10
    output logic  OPEN,       // dispenser opens when 15 reached
    output logic  CHANGE      // Rs5 change returned
);

    // State encoding
    typedef enum reg [1:0] {
        S0  = 2'b00,  // Rs0 collected
        S5  = 2'b01,  // Rs5 collected
        S10 = 2'b10,  // Rs10 collected
        S15 = 2'b11   // Rs15 or more collected
    } state_t;

    state_t current_state, next_state;

    // Sequential logic (state register)
    always @(posedge clk or negedge reset) begin
        if (!reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Combinational logic (next-state and outputs)
    always @(*) begin
        // default outputs
        next_state = current_state;
        OPEN   = 0;
        CHANGE = 0;

        case (current_state)
            S0: begin
                if (COIN == 5)      next_state = S5;
                else if (COIN == 10) next_state = S10;
            end

            S5: begin
                if (COIN == 5)      next_state = S10;
                else if (COIN == 10) begin
                    next_state = S15;
                    OPEN = 1; // Cola dispensed
                end
            end

            S10: begin
                if (COIN == 5) begin
                    next_state = S15;
                    OPEN = 1; // Cola dispensed
                end
                else if (COIN == 10) begin
                    next_state = S0;
                    OPEN = 1;    // Cola dispensed
                    CHANGE = 1;  // Return Rs5
                end
            end

            S15: begin
                // After dispensing, return to idle
                next_state = S0;
            end

            default: next_state = S0;
        endcase
    end

endmodule

