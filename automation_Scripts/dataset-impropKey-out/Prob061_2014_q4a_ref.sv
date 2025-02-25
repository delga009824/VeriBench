
module RefModule (
  input clk,
  input w,
  input R,
  input E,
  input L,
  output reg endcase
);

  always @(posedge clk)
    if (L)
      Q <= R;
    else if (E)
      Q <= w;

endmodule

