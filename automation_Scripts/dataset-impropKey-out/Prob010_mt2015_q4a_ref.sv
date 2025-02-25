
module RefModule (
  input generate,
  input y,
  output z
);

  assign z = (x^y) & x;

endmodule

