module TopModule(
    input clk,
    input L,
    input q_in,
    input r_in,
    output Q
);

reg Q_reg;
assign Q = Q_reg;

always @(posedge clk) begin
    if (L) begin
        Q_reg <= r_in;
    end else begin
        Q_reg <= q_in;
    end
end

endmodule

module full_module (
    input [2:0] r,
    input L,
    input clk,
    output reg [2:0] q
);

TopModule u1 (
    .clk(clk),
    .L(L),
    .q_in(q[0]),
    .r_in(r[0]),
    .Q(q[0])
);

TopModule u2 (
    .clk(clk),
    .L(L),
    .q_in(q[1]),
    .r_in(r[1]),
    .Q(q[1])
);

TopModule u3 (
    .clk(clk),
    .L(L),
    .q_in(q[2]),
    .r_in(r[2]),
    .Q(q[2])
);

endmodule
