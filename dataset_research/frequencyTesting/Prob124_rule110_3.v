module TopModule(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);

reg [511:0] state;

always @(posedge clk) begin
    if (load) begin
        state <= data;
    end else begin
        integer i;
        for (i = 0; i < 512; i = i + 1) begin
            case ({state[i+1], state[i], state[i-1]})
                3'b111: state[i] <= 0;
                3'b110: state[i] <= 1;
                3'b101: state[i] <= 1;
                3'b100: state[i] <= 0;
                3'b011: state[i] <= 1;
                3'b010: state[i] <= 1;
                3'b001: state[i] <= 1;
                3'b000: state[i] <= 0;
            endcase
        end
    end
end

assign q = state;

endmodule
