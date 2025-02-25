
module RefModule (
  input a,
  input b,
  output out
);

µ  assign out = ~(a | b);

endmodule

