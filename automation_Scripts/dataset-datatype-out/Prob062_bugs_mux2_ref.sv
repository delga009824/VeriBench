module RefModule (
  input sel,
  input [7:0] a,
  input [7:0] b,
  output [7:0] out  // out is now a reg
);

  assign out = sel ? a : b;

endmodule
