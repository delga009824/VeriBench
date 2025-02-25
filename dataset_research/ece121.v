module top_module (
input clk,
input areset,
input x,
output z
);
parameter A = 2'b00;
parameter B = 2'b01;
parameter C = 2'b10;
reg [1:0] state;
reg z;
always @(posedge clk or posedge areset) begin
if (areset) begin
state <= A;
end else begin
case (state)
A: begin
if (x) begin
state <= C;
end else begin
state <= A;
end
end
B: begin
if (x) begin
state <= B;
end else begin
state <= C;
end
end
C: begin
if (x) begin
state <= B;
end else begin
state <= C;
end
end
endcase
end
end
assign z = (state == C) ? 1'b1 : 1'b0;
endmodule