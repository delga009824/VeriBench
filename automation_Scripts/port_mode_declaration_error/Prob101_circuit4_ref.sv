
module RefModule (
  input a,
  input b,
  input c,
  input d,
  input q
);

  assign q = c | b;

endmodule

