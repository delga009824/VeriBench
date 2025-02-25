module TopModule(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output reg out
);

always @(*) begin
    case(state)
        2'b00: begin // State A
            if (in) begin
                next_state = 2'b01; // State B
                out = 0;
            end else begin
                next_state = 2'b00; // State A
                out = 0;
            end
        end
        2'b01: begin // State B
            if (in) begin
                next_state = 2'b01; // State B
                out = 0;
            end else begin
                next_state = 2'b10; // State C
                out = 0;
            end
        end
        2'b10: begin // State C
            if (in) begin
                next_state = 2'b11; // State D
                out = 0;
            end else begin
                next_state = 2'b00; // State A
                out = 0;
            end
        end
        2'b11: begin // State D
            if (in) begin
                next_state = 2'b01; // State B
                out = 1;
            end else begin
                next_state = 2'b10; // State C
                out = 1;
            end
        end
        default: begin
            next_state = 2'b00; // Default state A
            out = 0;
        end
    endcase
end

endmodule
