
module RefModule (
  input [255:0] in,
  input [7:0] sel,
  input  out
);

  assign out = in[sel];

endmodule

