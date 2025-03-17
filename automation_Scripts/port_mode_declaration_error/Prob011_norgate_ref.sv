
module RefModule (
  input a,
  input b,
  input out
);

  assign out = ~(a | b);

endmodule

