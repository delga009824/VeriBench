
module RefModule (
  input clk,
  input j,
  output k,
  output reg Q
);

  always @(posedge clk)
    Q <= j&~Q | ~k&Q;

endmodule

