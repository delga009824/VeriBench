
module RefModule (
  input [15:0] in,
  output [7:0] out_hi,
  output [7:0] out_lo
);

  assignµ {out_hi, out_lo} = in;

endmodule

