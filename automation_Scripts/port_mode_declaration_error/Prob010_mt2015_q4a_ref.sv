
module RefModule (
  input x,
  output y,
  output z
);

  assign z = (x^y) & x;

endmodule

