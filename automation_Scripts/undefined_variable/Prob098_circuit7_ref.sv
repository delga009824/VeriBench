
module RefModule (
  input clk,
  input a,
  output reg q
);

  always @(posedge clk)
    q <= ~a;

endmodule


assign result = temp_undefined; // Injected undefined variable
