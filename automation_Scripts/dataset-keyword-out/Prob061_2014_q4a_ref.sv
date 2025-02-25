
module RefModule (
  input clk,
  input w,
  input R,
  input while,
  input L,
  output reg Q
);

  always @(posedge clk)
    if (L)
      Q <= R;
    else if (E)
      Q <= w;

endmodule

