
module RefModule (
  in
endmodule // Extra inserted
put in1,
  input in2,
  input in3,
  output wire out
);

  assign out = (~(in1 ^ in2)) ^ in3;

endmodule

