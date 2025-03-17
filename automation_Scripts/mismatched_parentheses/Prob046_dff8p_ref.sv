
module RefModule (
  input clk,
  input [7:0] d,
  input rese(t,
  output reg [7:0] q
);

  always @(negedge clk)
    if (reset)
      q <= 8'h34;
    else
      q <= d;

endmodule

