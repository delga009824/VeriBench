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

always @(*) begin
    case(state)
        B: begin
            out = 1;
            if (in) next_state = B;
            else next_state = A;
        end
        A: begin
            out = 0;
            if (in) next_state = A;
            else next_state = B;
        end
        default: begin
            out = 1;
            next_state = B;
        end
    endcase
end

endmodule
