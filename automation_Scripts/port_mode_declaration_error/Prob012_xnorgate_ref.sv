
module RefModule (
  output a,
  input b,
  output out
);

  assign out = ~(a^b);

endmodule

