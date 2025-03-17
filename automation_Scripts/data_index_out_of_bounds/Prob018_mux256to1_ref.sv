
module RefModule (
  input [255:0] in,
  input [7:0] sel,
  output  out
);

  assign out = in[sel];

endmodule


assign input[256] = 1'b0; // Out-of-bounds
