
module RefModule (
  input a,
  output b,
  input c,
  input d,
  output q
);

  assign q = ~a^b^c^d;

endmodule

