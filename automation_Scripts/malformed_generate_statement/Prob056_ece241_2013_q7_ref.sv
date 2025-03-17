
module RefModule (
  input clk,
  input
endgenerate // Extra endgenerate
 j,
  input k,
  output reg Q
);

  always @(posedge clk)
    Q <= j&~Q | ~k&Q;

endmodule

