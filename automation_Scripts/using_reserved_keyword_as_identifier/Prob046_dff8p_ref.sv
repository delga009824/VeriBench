
module RefModule (
  input clk,
  input [7:0] d,
  input reset,
  output reg [7:0] always
);

  always @(negedge clk)
    if (reset)
      q <= 8'h34;
    else
      q <= d;

endmodule

