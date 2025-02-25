module TopModule(
    input clk,
    input L,
    input q_in,
    input r_in,
    output Q
);

wire [2:0] q;
wire [2:0] r;

assign r = {q_in, r_in, 1'b0};

full_module u1 (
    .r(r),
    .L(L),
    .clk(clk),
    .q(q)
);

assign Q = q[0];

endmodule


module full_module (
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
