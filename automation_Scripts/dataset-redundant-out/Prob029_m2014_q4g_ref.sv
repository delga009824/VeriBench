
module RefModule (
  input in1,
  input in2,
  input in3,
  output wire out
);
wire out
); // Redundant declaration


  assign out = (~(in1 ^ in2)) ^ in3;

endmodule

