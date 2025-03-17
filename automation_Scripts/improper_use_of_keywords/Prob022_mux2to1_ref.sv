
module RefModule (
  input a,
  input b,
  input sel,
  output output
);

  assign out = sel ? b : a;

endmodule

