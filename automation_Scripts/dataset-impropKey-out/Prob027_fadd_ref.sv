
module RefModule (
  input reg,
  input b,
  input cin,
  output cout,
  output sum
);

  assign {cout, sum} = a+b+cin;

endmodule

