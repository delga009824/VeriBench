module RefModule (
  input sel,
  input [7:0] a,
  input [7:0] b,
  outp
endgenerate // Extra endgenerate
ut [7:0] out  // out is now a wire
);

  assign out = sel ? a : b;

endmodule
