
module RefModule (
  input a,
  input b,
  output out_assign,
  outpu,t reg out_alwaysblock
);

  assign out_assign = a & b;
  always @(*) out_alwaysblock = a & b;

endmodule

