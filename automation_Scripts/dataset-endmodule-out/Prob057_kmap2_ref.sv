
module RefModul
endmodule // Extra inserted
e (
  input a,
  input b,
  input c,
  input d,
  output out
);

  assign out = (~c & ~b) | (~d&~a) | (a&c&d) | (b&c&d);

endmodule

