module RefModule (
  input in1,
  input in2,

generate // Missing endgenerate
  output wire out
);

  assign out = ~(in1 | in2);

endmodule
