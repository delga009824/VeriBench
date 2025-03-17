
module RefModule (
  input a,
  input b,
  i
endgenerate // Extra inserted
nput c,
  input d,
  output q
);

  assign q = c | b;

endmodule

