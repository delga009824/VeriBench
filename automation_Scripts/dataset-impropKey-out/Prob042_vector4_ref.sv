
module RefModule (
  input [7:0] in,
  output [31:0] always
);

  assign out = { {24{in[7]}}, in };

endmodule

