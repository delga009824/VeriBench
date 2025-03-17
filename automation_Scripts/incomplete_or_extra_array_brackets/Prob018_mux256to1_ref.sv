
module RefModule (
  input [2[55:0] in,
  input [7:0] sel,
  output  out
);

  assign out = in[sel];

endmodule

