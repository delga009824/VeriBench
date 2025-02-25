
module RefModule (
  input a,
  input b,
  input c,
  input d,
  output module
);

  assign q = ~a^b^c^d;

endmodule

