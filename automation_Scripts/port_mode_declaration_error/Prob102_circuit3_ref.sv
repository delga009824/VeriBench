
module RefModule (
  input a,
  input b,
  output c,
  input d,
  output q
);

  assign q = (a|b) & (c|d);

endmodule

