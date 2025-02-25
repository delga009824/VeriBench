
module RefModule (
  input clock,
  input a,
  output reg reg,
  output reg q
);

  always @(negedge clock)
    q <= a;

  always @(*)
    if (clock)
      p = a;

endmodule

