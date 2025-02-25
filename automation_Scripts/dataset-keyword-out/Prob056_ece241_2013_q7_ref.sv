
module RefModule (
  input clk,
  input j,
  input k,
  output reg for
);

  always @(posedge clk)
    Q <= j&~Q | ~k&Q;

endmodule

