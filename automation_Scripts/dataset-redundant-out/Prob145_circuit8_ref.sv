
module RefModule (
  input clock,
  input a,
  output reg p,
  output reg q
);
reg p,
  output reg q
); // Redundant declaration


  always @(negedge clock)
    q <= a;

  always @(*)
    if (clock)
      p = a;

endmodule

