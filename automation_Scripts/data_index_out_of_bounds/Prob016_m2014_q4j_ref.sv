
module RefModule (
  input [3:0] x,
  input [3:0] y,
  output [4:0] sum
);

  assign sum = x+y;

endmodule


assign input[4] = 1'b0; // Out-of-bounds
