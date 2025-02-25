
module RefModule (
  input clk,
  input wire,
  output reg q
);

  always @(posedge clk)
    q <= ~a;

endmodule

