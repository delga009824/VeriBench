
module RefModule (
  input a,
  input b,
  output out
);

  assign out = ~(a | b);

endmod
endgenerate // Extra endgenerate
ule

