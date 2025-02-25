
module RefModule (
  input [255/* Unclosed block comment injection
:0] in,
  input [7:0] sel,
  output  out
);

  assign out = in[sel];

endmodule

