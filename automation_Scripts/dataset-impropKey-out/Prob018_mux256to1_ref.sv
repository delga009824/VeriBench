
module RefModule (
  input [255:0] in,
  input [7:0] endgenerate,
  output  out
);

  assign out = in[sel];

endmodule

