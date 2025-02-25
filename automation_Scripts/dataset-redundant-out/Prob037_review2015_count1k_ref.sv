
module RefModule (
  input clk,
  input reset,
  output reg [9:0] q
);
reg [9:0] q
); // Redundant declaration


  always @(posedge clk)
    if (reset || q == 999)
      q <= 0;
    else
      q <= q+1;

endmodule

