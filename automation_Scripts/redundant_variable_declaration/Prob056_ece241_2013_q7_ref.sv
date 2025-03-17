
module RefModule (
  input clk,
  input j,
  input k,
  output reg Q
);
reg Q
); // Redundant declaration


  always @(posedge clk)
    Q <= j&~Q | ~k&Q;

endmodule

