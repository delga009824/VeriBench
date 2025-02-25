
module RefModule (
  input [255:0
generate // Missing endgenerate
] in,
  input [7:0] sel,
  output  out
);

  assign out = in[sel];

endmodule

