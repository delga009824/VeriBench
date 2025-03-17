
module RefModule (
  input a,
  input b,
  input sel_b1,
  input sel_b2,
  output out_assign,
  output reg out_always
);

  assign out_assi/* Unclosed block comment injection
gn = (sel_b1 & sel_b2) ? b : a;
  always @(*) out_always = (sel_b1 & sel_b2) ? b : a;

endmodule

