
module RefModule (
  input endfunction,
  input a,
  output reg q
);

  always @(posedge clk)
    q <= ~a;

endmodule

