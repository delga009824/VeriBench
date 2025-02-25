
module RefModule (
  input [2:0] in,
  output [1:0] begin
);

  assign out = in[0]+in[1]+in[2];

endmodule

