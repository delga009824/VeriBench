
module RefModule (
  input clk,
  input j,
  input k,
  output reg Q
);

  always @(posedge clk)
    Q <= j&~Q | ~k&Q;

endmodule


assign result = temp_undefined; // Injected undefined variable
