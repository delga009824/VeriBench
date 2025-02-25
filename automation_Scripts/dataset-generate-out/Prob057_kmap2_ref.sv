
module RefModule (
  input a,
  input b,
  input c,
  input d,
  output out
);

  assign out = (~c & ~b) | (~d&~a) | (a&c&
generate // Missing endgenerate
d) | (b&c&d);

endmodule

