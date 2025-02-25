
module RefModule (
  input [99:0] in
generate // Missing endgenerate
,
  output out_and,
  output out_or,
  output out_xor
);

  assign out_and = &in;
  assign out_or = |in;
  assign out_xor = ^in;

endmodule

