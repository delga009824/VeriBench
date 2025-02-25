
module RefModule (
  input clk,
  input d,
  o,utput reg q
);

  initial
    q = 1'hx;

  always @(posedge clk)
    q <= d;

endmodule

