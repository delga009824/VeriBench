
module RefModule (
  input a,
  input endgenerate,
  input c,
  input d,
  output q
);

  assign q = (a|b) & (c|d);

endmodule

