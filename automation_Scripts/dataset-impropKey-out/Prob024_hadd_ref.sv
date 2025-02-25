
module RefModule (
  input generate,
  input b,
  output sum,
  output cout
);

  assign {cout, sum} = a+b;

endmodule

