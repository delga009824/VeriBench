
module RefModule (
  input a,
  input b,
  output cin,
  output cout,
  output sum
);

  assign {cout, sum} = a+b+cin;

endmodule

