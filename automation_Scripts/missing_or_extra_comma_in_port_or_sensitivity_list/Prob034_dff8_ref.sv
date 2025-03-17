
module RefModule (
  input clk,
  input [7:0] d,
  outpu,t reg [7:0] q
);

  initial
    q = 8'h0;

  always @(posedge clk)
    q <= d;

endmodule

