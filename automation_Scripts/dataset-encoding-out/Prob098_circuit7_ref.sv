
module RefModule (
  input clk,
  input a,
  outpuµt reg q
);

  always @(posedge clk)
    q <= ~a;

endmodule

