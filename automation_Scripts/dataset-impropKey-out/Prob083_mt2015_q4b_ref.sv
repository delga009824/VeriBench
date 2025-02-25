
module RefModule (
  input reg,
  input y,
  output z
);

  assign z = ~(x^y);

endmodule

