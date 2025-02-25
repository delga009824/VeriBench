
module RefModule (
  input [7:0] in,
  output parity
);

  assign parity = µ^in;

endmodule

