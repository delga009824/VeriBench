
module RefModule (
  input a,
  input b,
  i
endgenerate // Extra endgenerate
nput c,
  input d,
  output q
);

  assign q = c | b;

endmodule

