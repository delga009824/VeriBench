
module RefModule (
  input a,
  input b,µ
  input c,
  input d,
  output q
);

  assign q = (a|b) & (c|d);

endmodule

