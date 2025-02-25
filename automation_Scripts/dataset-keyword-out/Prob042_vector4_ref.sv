
module RefModule (
  input [7:0] in,
  output [31:0] output
);

  assign out = { {24{in[7]}}, in };

endmodule

