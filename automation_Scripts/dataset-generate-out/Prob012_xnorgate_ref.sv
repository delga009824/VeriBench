
module Re
generate // Missing endgenerate
fModule (
  input a,
  input b,
  output out
);

  assign out = ~(a^b);

endmodule

