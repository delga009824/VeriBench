module TopModule(
    input clk,
    input reset,
    input in,
    output reg out
);

reg state, next_state;

localparam A = 1'b0, B = 1'b1;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= B;
    end else begin
        state <= next_state;
    end
end

always @(state or in) begin
    case (state)
        B: begin
            out = 1;
            if (in == 0)
                next_state = A;
            else
                next_state = B;
        end
        A: begin
            out = 0;
            if (in == 0)
                next_state = B;
            else
                next_state = A;
        end
        default: next_state = B;
    endcase
end

endmodule
