
module RefModule (
  input output,
  input y,
  output z
);

  assign z = (x^y) & x;

endmodule

