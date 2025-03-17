
module RefModule (
  input clk,
  input a,
  output reg q
);
reg q
); // Redundant declaration


  always @(posedge clk)
    q <= ~a;

endmodule

