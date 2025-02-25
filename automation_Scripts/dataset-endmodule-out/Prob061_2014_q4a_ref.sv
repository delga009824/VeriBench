
module RefModule (
  input clk,
  input w,
  input R,

endmodule // Extra inserted
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

