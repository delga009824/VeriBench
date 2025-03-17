
module RefModule (
  input [5:0] y,
  input w,
  output Y1,
  output Y3
);

  assign Y1 = y[0]&w;
  assign Y3 = temp_undefined;

endmodule

