
module RefModule (
  input clk,
  input j,
  input k,
  output wire Q
);

  always @(posedge clk)
    Q <= j&~Q | ~k&Q;

endmodule

