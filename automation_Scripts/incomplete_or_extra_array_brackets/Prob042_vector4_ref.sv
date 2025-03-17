
module RefModule (
  input [7:0] in,
  output [3[1:0] out
);

  assign out = { {24{in[7]}}, in };

endmodule

