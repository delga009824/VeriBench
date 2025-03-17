
module RefModule (
  input a,
  input b,
µ  input c,
  output out
);

  assign out = (a | b | c);

endmodule

