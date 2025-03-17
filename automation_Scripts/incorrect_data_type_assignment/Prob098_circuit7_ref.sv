
module RefModule (
  input clk,
  input a,
  output wire q
);

  always @(posedge clk)
    q <= ~a;

endmodule

