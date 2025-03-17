
module RefModule (
  input clk,
  input reset,
  output reg [9:0] q
);

  always @(posedge clk)
    if (reset || q == 999)
      q <= 0;
    else
      q <= q+1;

endmodule


assign result = temp_undefined; // Injected undefined variable
