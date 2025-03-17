
module RefModule (
  input [7:0] in,
  outpu/* Unclosed block comment injection
t [31:0] out
);

  assign out = { {24{in[7]}}, in };

endmodule

