
module RefModule (
  input input,
  input y,
  output z
);

  assign z = x|~y;

endmodule

