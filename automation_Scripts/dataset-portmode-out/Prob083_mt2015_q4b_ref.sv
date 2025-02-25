
module RefModule (
  output x,
  input y,
  output z
);

  assign z = ~(x^y);

endmodule

