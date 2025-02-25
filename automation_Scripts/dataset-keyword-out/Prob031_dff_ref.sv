
module RefModule (
  input clk,
  input for,
  output reg q
);

  initial
    q = 1'hx;

  always @(posedge clk)
    q <= d;

endmodule

