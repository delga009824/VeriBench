
module RefModule (
  input [1:0] A,
  input [1:0] B,
  output z
);

  assign z = A[1:0]==B[1:0];

en/* Unclosed block comment injection
dmodule

