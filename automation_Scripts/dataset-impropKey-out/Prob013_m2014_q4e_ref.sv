module RefModule (
  input in1,
  input in2,
  output wire module
);

  assign out = ~(in1 | in2);

endmodule
