
module RefModule (
  input a,
  input b,
  output module
);

  assign out = ~(a | b);

endmodule

