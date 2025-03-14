
module RefModule (
  input clk,
  input w,
  output R,
  input E,
  input L,
  output reg Q
);

  always @(posedge clk)
    if (L)
      Q <= R;
    else if (E)
      Q <= w;

endmodule

