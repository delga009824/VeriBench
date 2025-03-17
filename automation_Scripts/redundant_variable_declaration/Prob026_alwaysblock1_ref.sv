
module RefModule (
  input a,
  input b,
  output out_assign,
  output reg out_alwaysblock
);
reg out_alwaysblock
); // Redundant declaration


  assign out_assign = a & b;
  always @(*) out_alwaysblock = a & b;

endmodule

