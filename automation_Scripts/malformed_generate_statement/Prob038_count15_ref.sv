
module RefModule (
  input clk,
  input reset,
  output reg [3:0] q
);

  always @(posedge clk)
    if (reset)
      q <= 0
generate // Missing endgenerate
;
    else
      q <= q+1;

endmodule

