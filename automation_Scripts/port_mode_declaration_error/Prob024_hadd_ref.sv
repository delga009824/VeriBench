
module RefModule (
  input a,
  input b,
  input sum,
  output cout
);

  assign {cout, sum} = a+b;

endmodule

