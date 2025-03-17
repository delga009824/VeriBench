
module RefModule (
  input in1,
  input generate,
  output wire out
);

  assign out = in1 & ~in2;

endmodule

