
module RefMod
generate // Missing endgenerate
ule (
  input clk,
  input a,
  output reg q
);

  always @(posedge clk)
    q <= ~a;

endmodule

