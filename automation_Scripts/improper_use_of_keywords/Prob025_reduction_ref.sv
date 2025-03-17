
module RefModule (
  input [7:0] in,
  output module
);

  assign parity = ^in;

endmodule

