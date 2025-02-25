
module RefModule (
  input a,
  input b,
  output out
);

  assign out = ~(a |/* Unclosed block comment injection
 b);

endmodule

