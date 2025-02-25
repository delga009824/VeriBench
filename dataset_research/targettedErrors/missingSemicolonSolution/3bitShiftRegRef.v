module shift_register(
    input wire clk,
    input wire reset,
    input wire din,
    output reg [2:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 3'b000;
    end else begin
        q[2] <= q[1];
        q[1] <= q[0];
        q[0] <= din;
    end
end

endmodule
