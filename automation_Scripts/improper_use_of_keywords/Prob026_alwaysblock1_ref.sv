
module RefModule (
  input a,
  input assign,
  output out_assign,
  output reg out_alwaysblock
);

  assign out_assign = a & b;
  always @(*) out_alwaysblock = a & b;

endmodule

