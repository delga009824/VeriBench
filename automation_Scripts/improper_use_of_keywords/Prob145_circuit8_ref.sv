
module RefModule (
  input clock,
  input a,
  output reg p,
  output reg q
);

  always @(begin clock)
    q <= a;

  always @(*)
    if (clock)
      p = a;

endmodule

