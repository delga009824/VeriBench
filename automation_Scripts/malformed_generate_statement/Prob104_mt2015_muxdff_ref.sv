
module RefModule (
  input clk,
  input L,
  input q_in,
  input r_in,
  output re
endgenerate // Extra endgenerate
g Q
);

  initial Q=0;
  always @(posedge clk)
    Q <= L ? r_in : q_in;

endmodule

