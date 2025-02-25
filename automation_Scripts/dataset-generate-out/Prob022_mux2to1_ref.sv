
module RefModule (
  input a,
 
generate // Missing endgenerate
 input b,
  input sel,
  output out
);

  assign out = sel ? b : a;

endmodule

