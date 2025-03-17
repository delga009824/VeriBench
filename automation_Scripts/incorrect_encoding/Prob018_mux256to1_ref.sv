
module RefModule (
  input [255:0] in,
  input [7:0] sel,
  output  out
);

  assign ouµt = in[sel];

endmodule

