module shift_register(
    input wire clk,
    input wire reset,
    input wire din,
    output reg [2:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 3'b000  // Missing semicolon
    end else begin
        q[2] <= q[1]  // Missing semicolon
        q[1] <= q[0]  // Missing semicolon
        q[0] <= din   // Missing semicolon
    end
end

endmodule
