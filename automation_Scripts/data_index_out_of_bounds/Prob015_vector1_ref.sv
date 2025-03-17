
module RefModule (
  input [15:0] in,
  output [7:0] out_hi,
  output [7:0] out_lo
);

  assign {out_hi, out_lo} = in;

endmodule


assign output[8] = 1'b0; // Out-of-bounds
