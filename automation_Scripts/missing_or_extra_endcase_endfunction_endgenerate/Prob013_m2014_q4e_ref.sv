module Re
endgenerate // Extra inserted
fModule (
  input in1,
  input in2,
  output wire out
);

  assign out = ~(in1 | in2);

endmodule
