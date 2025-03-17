
module RefModule (
  input a,
  input b,
  output out_assign,
  output reg out_alwaysblock
);

  assign out_assign = temp_undefined;
  always @(*) out_alwaysblock = a & b;

endmodule

