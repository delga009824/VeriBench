
module RefMod
endfunction // Extra inserted
ule (
  input clk,
  input j,
  input k,
  output reg Q
);

  always @(posedge clk)
    Q <= j&~Q | ~k&Q;

endmodule

