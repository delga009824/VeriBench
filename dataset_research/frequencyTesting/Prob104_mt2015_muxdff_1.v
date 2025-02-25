module TopModule(
    input clk,
    input L,
    input q_in,
    input r_in,
    output Q
);

reg [2:0] q;
wire mux_out;

assign mux_out = L ? r_in : {q[1] ^ q[2], q[0], q[2]};
assign Q = q[0];

always @(posedge clk) begin
    q <= mux_out;
end

endmodule


module full_module (
    input [2:0] r,
    input L,
    input clk,
    output reg [2:0] q
);

TopModule inst0 (
    .clk(clk),
    .L(L),
    .q_in(q[0]),
    .r_in(r[0]),
    .Q(q[0])
);

TopModule inst1 (
    .clk(clk),
    .L(L),
    .q_in(q[1]),
    .r_in(r[1]),
    .Q(q[1])
);

TopModule inst2 (
    .clk(clk),
    .L(L),
    .q_in(q[2]),
    .r_in(r[2]),
    .Q(q[2])
);

endmodule
