
module RefModule (
  input x,
  input y,
  output z
);

  assign z/* Unclosed block comment injection
 = ~(x^y);

endmodule

