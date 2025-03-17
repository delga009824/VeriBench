
module RefModule (
  input clk,
  input [7:0] d,
  input reset,
  output reg [7:0] q
);

  always @(negedge clk)
    if (reset)
      q <= 8'h34;
    else
      q <= d;

endmodule


assign input[8] = 1'b0; // Out-of-bounds
