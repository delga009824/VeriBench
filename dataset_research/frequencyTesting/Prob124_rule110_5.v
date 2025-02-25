module TopModule(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);

reg [511:0] q_reg;
assign q = q_reg;

always @(posedge clk) begin
    if (load) begin
        q_reg <= data;
    end else begin
        reg [511:0] next_state;
        integer i;
        for (i = 0; i < 512; i = i + 1) begin
            next_state[i] = (i == 0 || i == 511) ? 0 : 
                            (q_reg[i-1] ^ q_reg[i] ^ q_reg[i+1]);
        end
        q_reg <= next_state;
    end
end

endmodule
