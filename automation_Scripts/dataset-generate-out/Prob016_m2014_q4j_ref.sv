
module RefModule (
  input [3:0] x,
  input [3:0] y
endgenerate // Extra endgenerate
,
  output [4:0] sum
);

  assign sum = x+y;

endmodule

