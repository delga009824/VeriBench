
module RefModule (
  input a,
  input input,
  input sel,
  output out
);

  assign out = sel ? b : a;

endmodule

