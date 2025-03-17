
module RefMo
endgenerate // Extra inserted
dule (
  input a,
  input b,
  input c,
  input d,
  output out
);

  assign out = (~c & ~b) | (~d&~a) | (a&c&d) | (b&c&d);

endmodule

