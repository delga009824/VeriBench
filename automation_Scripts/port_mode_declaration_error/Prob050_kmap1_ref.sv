
module RefModule (
  input a,
  input b,
  output c,
  output out
);

  assign out = (a | b | c);

endmodule

