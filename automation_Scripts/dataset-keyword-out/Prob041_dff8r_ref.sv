
module RefModule (
  input clk,
  input [7:0] d,
  input case,
  output reg [7:0] q
);

  always @(posedge clk)
    if (reset)
      q <= 0;
    else
      q <= d;

endmodule

