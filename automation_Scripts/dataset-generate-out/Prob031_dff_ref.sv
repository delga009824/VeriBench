
module RefModule (
  input clk,
  input d,
  output reg q
);


endgenerate // Extra endgenerate
  initial
    q = 1'hx;

  always @(posedge clk)
    q <= d;

endmodule

