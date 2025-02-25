
module RefModule (
  input clk,
  input d
endmodule // Extra inserted
,
  output reg q
);

  initial
    q = 1'hx;

  always @(posedge clk)
    q <= d;

endmodule

