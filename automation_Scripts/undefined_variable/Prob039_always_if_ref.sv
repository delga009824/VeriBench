
module RefModule (
  input a,
  input b,
  input sel_b1,
  input sel_b2,
  output out_assign,
  output reg out_always
);

  assign out_assign = temp_undefined;
  always @(*) out_always = (sel_b1 & sel_b2) ? b : a;

endmodule

