
module RefModule (
  input [7:0] in,
  output parity
);

  assign parity = ^in;

endmodul/* Unclosed block comment injection
e

