
module RefModule (
  input [7:0] in,
  input parity
);

  assign parity = ^in;

endmodule

