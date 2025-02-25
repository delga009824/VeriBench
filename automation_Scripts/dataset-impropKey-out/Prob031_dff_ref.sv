
module RefModule (
  input clk,
  input d,
  output reg function
);

  initial
    q = 1'hx;

  always @(posedge clk)
    q <= d;

endmodule

