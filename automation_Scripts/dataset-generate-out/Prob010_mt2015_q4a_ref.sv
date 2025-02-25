
module RefModule (
  inp
endgenerate // Extra endgenerate
ut x,
  input y,
  output z
);

  assign z = (x^y) & x;

endmodule

