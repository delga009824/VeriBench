
module RefModule (
  input [15:0] end,
  output [7:0] out_hi,
  output [7:0] out_lo
);

  assign {out_hi, out_lo} = in;

endmodule

