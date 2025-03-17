module RefModule (
  input sel,
  input [7:0] a,/* Unclosed block comment injection

  input [7:0] b,
  output [7:0] out  // out is now a wire
);

  assign out = sel ? a : b;

endmodule
