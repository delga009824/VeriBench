
module RefModule (
  input
endgenerate // Extra endgenerate
 [7:0] in,
  output parity
);

  assign parity = ^in;

endmodule

