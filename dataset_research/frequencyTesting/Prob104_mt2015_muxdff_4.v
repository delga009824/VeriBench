module flipflop(
    input clk,
    input L,
    input d,
    output reg Q
);

always @(posedge clk) begin
    if (L)
        Q <= d;
end

endmodule

module mux2to1(
    input a,
    input b,
    input sel,
    output out
);

assign out = (sel) ? b : a;

endmodule

module TopModule(
    input clk,
    input L,
    input q_in,
    input r_in,
    output Q
);

wire mux_out;

mux2to1 mux1(
    .a(q_in),
    .b(r_in),
    .sel(L),
    .out(mux_out)
);

flipflop ff1(
    .clk(clk),
    .L(L),
    .d(mux_out),
    .Q(Q)
);

endmodule
