
module RefModule (
  input clk,
  input d,
  output wire q
);

  initial
    q = 1'hx;

  always @(posedge clk)
    q <= d;

endmodule

