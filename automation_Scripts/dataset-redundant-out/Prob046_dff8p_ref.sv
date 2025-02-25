
module RefModule (
  input clk,
  input [7:0] d,
  input reset,
  output reg [7:0] q
);
reg [7:0] q
); // Redundant declaration


  always @(negedge clk)
    if (reset)
      q <= 8'h34;
    else
      q <= d;

endmodule

