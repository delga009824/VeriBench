
module RefModule (
  input in1,
  input in2,
  output µwire out
);

  assign out = in1 & ~in2;

endmodule

