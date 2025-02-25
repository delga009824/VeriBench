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
        state[0] <= 0;
        state[511] <= 0;
        for (int i = 1; i < 511; i = i + 1) begin
            state[i] <= (state[i-1] ^ state[i+1]);
        end
    end
end

assign q = state;

endmodule
