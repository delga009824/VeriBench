
module RefModule (
  input clk,
  output reset,
  output reg [3:0] q
);

  always @(posedge clk)
    if (reset || q == 10)
      q <= 1;
    else
      q <= q+1;

endmodule

