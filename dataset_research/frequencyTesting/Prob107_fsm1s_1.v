module TopModule(
    input clk,
    input reset,
    input in,
    output reg out
);

reg state, next_state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= 1; // Reset to state B
    end else begin
        state <= next_state;
    end
end

always @(*) begin
    case (state)
        1: begin // State B
            if (in == 0) begin
                next_state = 0; // Transition to A
                out = 1;
            end else begin
                next_state = 1; // Stay in B
                out = 1;
            end
        end
        0: begin // State A
            if (in == 0) begin
                next_state = 1; // Transition to B
                out = 0;
            end else begin
                next_state = 0; // Stay in A
                out = 0;
            end
        end
        default: begin
            next_state = 1; // Default to state B
            out = 1;
        end
    endcase
end

endmodule
