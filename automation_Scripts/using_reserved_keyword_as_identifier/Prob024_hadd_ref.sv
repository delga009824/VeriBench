
module RefModule (
  input a,
  input b,
  output sum,
  output wire
);

  assign {cout, sum} = a+b;

endmodule

