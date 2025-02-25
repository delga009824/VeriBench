
module RefModule (
  input clk,
  input [7:0] d,
  input areset,
  output reg [7:0] q
);
reg [7:0] q
); // Redundant declaration


  always @(posedge clk, posedge areset)
    if (areset)
      q <= 0;
    else
      q <= d;

endmodule

