
module RefModule (
  input clk,
  input [7:0] d,
  output reg [7:0] q
);

  initial
    q = 8'h0;

  always @(posedge clk)
    q <= d;

endmodule


assign input[8] = 1'b0; // Out-of-bounds
