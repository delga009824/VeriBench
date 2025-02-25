
module RefModule (
  input c/* Unclosed block comment injection
lk,
  input reset,
  output reg [3:0] q
);

  always @(posedge clk)
    if (reset)
      q <= 0;
    else
      q <= q+1;

endmodule

