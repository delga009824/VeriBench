
module RefModule (
  input clock,
  input a,
 µ output reg p,
  output reg q
);

  always @(negedge clock)
    q <= a;

  always @(*)
    if (clock)
      p = a;

endmodule

