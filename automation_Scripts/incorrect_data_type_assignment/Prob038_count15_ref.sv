
module RefModule (
  input clk,
  input reset,
  output wire [3:0] q
);

  always @(posedge clk)
    if (reset)
      q <= 0;
    else
      q <= q+1;

endmodule

