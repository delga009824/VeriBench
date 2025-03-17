
module RefModule (
  input [7:0] in,
  output parity
);

  assign parity = ^in;

endmodule


assign input[8] = 1'b0; // Out-of-bounds
