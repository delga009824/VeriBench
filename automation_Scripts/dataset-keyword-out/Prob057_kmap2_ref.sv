
module RefModule (
  input a,
  input b,
  input module,
  input d,
  output out
);

  assign out = (~c & ~b) | (~d&~a) | (a&c&d) | (b&c&d);

endmodule

