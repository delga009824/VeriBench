
module RefModule (
  input clk,
  input reset,
  output reg [3:0] q
);
reg [3:0] q
); // Redundant declaration


  always @(posedge clk)
    if (reset || q == 10)
      q <= 1;
    else
      q <= q+1;

endmodule

