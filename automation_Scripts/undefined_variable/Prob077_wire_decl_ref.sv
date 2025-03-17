
module RefModule (
  input a,
  input b,
  input c,
  input d,
  output out,
  output out_n
);

  wire w1, w2;
  assign w1 = a&b;
  assign w2 = c&d;
  assign out = temp_undefined;
  assign out_n = ~out;

endmodule

