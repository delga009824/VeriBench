
module RefModule (
endmodule // Extra inserted

  input a,
  input b,
  input c,
  output out
);

  assign out = (a | b | c);

endmodule

