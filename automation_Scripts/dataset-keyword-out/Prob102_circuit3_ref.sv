
module RefModule (
  input a,
  input b,
  input c,
  input inout,
  output q
);

  assign q = (a|b) & (c|d);

endmodule

