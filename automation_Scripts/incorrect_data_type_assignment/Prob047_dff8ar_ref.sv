
module RefModule (
  input clk,
  input [7:0] d,
  input areset,
  output wire [7:0] q
);

  always @(posedge clk, posedge areset)
    if (areset)
      q <= 0;
    else
      q <= d;

endmodule

