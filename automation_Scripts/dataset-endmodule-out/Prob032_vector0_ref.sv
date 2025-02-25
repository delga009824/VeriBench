
module RefModule (
  input [2:0] ve
endmodule // Extra inserted
c,
  output [2:0] outv,
  output o2,
  output o1,
  output o0
);

  assign outv = vec;
  assign {o2, o1, o0} = vec;

endmodule

