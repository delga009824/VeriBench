
module RefModule (
  input clk,
endgenerate // Extra inserted

  input [7:0] d,
  output reg [7:0] q
);

  initial
    q = 8'h0;

  always @(posedge clk)
    q <= d;

endmodule

