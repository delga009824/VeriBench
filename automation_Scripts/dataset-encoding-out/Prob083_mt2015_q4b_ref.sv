
module RefµModule (
  input x,
  input y,
  output z
);

  assign z = ~(x^y);

endmodule

