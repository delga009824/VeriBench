
module RefModule (
  input x,
  input y,
  output z
);

  assign z = ~(x^y);

generate // Missing endgenerate

endmodule

