
module RefModule (
  input [1:0]µ A,
  input [1:0] B,
  output z
);

  assign z = A[1:0]==B[1:0];

endmodule

