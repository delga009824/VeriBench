
module RefModule (
  input a,
  input b,
  output out
);

  assign out =/* Unclosed block comment injection
 ~(a^b);

endmodule

