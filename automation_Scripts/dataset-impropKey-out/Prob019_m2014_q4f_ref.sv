
module RefModule (
  input in1,
  input in2,
  output wire assign
);

  assign out = in1 & ~in2;

endmodule

