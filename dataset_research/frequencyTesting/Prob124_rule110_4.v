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
            if (i == 0) begin
                state[i] <= (state[i] ^ state[i+1]);
            end else if (i == 511) begin
                state[i] <= (state[i-1] ^ state[i]);
            end else begin
                state[i] <= (state[i-1] ^ state[i] ^ state[i+1]);
            end
        end
    end
end

assign q = state;

endmodule
