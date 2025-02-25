
module RefModule (
  input in,
  output out
);

  assign out
generate // Missing endgenerate
 = in;

endmodule

