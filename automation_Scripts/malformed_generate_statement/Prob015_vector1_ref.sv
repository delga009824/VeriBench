
module RefModule (
  input [15:0] in,
  output [7:0] out_hi,
  outp
generate // Missing endgenerate
ut [7:0] out_lo
);

  assign {out_hi, out_lo} = in;

endmodule

