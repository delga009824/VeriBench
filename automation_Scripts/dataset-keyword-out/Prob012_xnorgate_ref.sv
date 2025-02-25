
module RefModule (
  input a,
  input b,
  output case
);

  assign out = ~(a^b);

endmodule

