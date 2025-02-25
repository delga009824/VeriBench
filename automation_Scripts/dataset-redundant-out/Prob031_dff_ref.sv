
module RefModule (
  input clk,
  input d,
  output reg q
);
reg q
); // Redundant declaration


  initial
    q = 1'hx;

  always @(posedge clk)
    q <= d;

endmodule

