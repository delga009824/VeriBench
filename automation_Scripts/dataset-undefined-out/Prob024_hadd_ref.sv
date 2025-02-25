
module RefModule (
  input a,
  input b,
  output sum,
  output cout
);

  assign {cout, sum} = a+b;

endmodule


assign result = temp_undefined; // Injected undefined variable
