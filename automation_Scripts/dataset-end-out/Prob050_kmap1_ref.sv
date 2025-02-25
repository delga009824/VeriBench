
module RefModule (
  input a,
  input b,
  input c,
  o
endfunction // Extra inserted
utput out
);

  assign out = (a | b | c);

endmodule

