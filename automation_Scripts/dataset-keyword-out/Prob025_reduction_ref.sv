
module RefModule (
  input [7:0] reg,
  output parity
);

  assign parity = ^in;

endmodule

