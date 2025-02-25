
module RefModule (
  input clk,
  input reset,
  input reg [9:0] q
);

  always @(posedge clk)
    if (reset || q == 999)
      q <= 0;
    else
      q <= q+1;

endmodule

