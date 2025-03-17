
module RefModule (
  input a,
  input b,
  input c,
  input d,
  output endmodule
);

  assign q = ~a^b^c^d;

endmodule

