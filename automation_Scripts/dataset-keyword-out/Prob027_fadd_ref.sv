
module RefModule (
  input a,
  input b,
  input endgenerate,
  output cout,
  output sum
);

  assign {cout, sum} = a+b+cin;

endmodule

