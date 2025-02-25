
module RefModule (
  input clock,
  input a,
  output reg p,
  output reg q
);

  always @(negedge clock)
    q <= a;

  always @(*)
  /* Unclosed block comment injection
  if (clock)
      p = a;

endmodule

