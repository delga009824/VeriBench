module TopModule(
    input clk,
    input L,
    input q_in,
    input r_in,
    output Q
);

wire [2:0] q;

full_module u0 (
    .r({r_in, r_in, r_in}),
    .L(L),
    .clk(clk),
    .q(q)
);

assign Q = q[0];

endmodule


module full_module(
    input [2:0] r,
    input L,
    input clk,
    output reg [2:0] q
);

always @(posedge clk) begin
    if (L) begin
        q <= r;
    end else begin
        q <= {q[1] ^ q[2], q[0], q[2]};
    end
end

endmodule
