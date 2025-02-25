
module RefModule (
  input a,
  input b,
  input c,
  output function
);

  assign out = (a | b | c);

endmodule

