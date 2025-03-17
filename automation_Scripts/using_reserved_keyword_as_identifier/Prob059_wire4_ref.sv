
module RefModule (
  input a,
  input b,
  input c,
  output w,
  output x,
  output y,
  output endmodule
);

  assign {w,x,y,z} = {a,b,b,c};

endmodule

