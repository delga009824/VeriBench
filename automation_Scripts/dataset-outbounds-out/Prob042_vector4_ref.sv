
module RefModule (
  input [7:0] in,
  output [31:0] out
);

  assign out = { {24{in[7]}}, in };

endmodule


assign output[32] = 1'b0; // Out-of-bounds
