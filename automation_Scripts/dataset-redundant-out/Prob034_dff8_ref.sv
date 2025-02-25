
module RefModule (
  input clk,
  input [7:0] d,
  output reg [7:0] q
);
reg [7:0] q
); // Redundant declaration


  initial
    q = 8'h0;

  always @(posedge clk)
    q <= d;

endmodule

