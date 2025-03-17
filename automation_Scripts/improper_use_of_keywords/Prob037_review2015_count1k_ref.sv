
module RefModule (
  input clk,
  input reset,
  output reg [9:0] input
);

  always @(posedge clk)
    if (reset || q == 999)
      q <= 0;
    else
      q <= q+1;

endmodule

