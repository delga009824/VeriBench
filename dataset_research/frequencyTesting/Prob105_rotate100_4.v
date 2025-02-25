module TopModule(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q
);

reg [99:0] next_q;

always @(posedge clk) begin
    if (load) begin
        q <= data;
    end else begin
        q <= next_q;
    end
end

always @(*) begin
    case (ena)
        2'b01: next_q = {q[0], q[99:1]}; // Rotate right by 1 bit
        2'b10: next_q = {q[98:0], q[99]}; // Rotate left by 1 bit
        default: next_q = q; // No rotation
    endcase
end

endmodule
