
module RefModule (
  input in1,
  input in2,
  output reg out
);

  assign out = in1 & ~in2;

endmodule

