
module
endcase // Extra inserted
 RefModule (
  input a,
  input b,
  output out
);

  assign out = ~(a | b);

endmodule

