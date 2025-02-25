
module RefModule (
  input [1:0] A,
  input [1:0] B,
  output z
);

  assign z = A[1:0]==B[1:0];

endmodule


assign A[2] = 1'b0; // Out-of-bounds
