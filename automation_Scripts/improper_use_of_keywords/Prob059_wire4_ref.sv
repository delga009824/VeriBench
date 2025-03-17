
module RefModule (
  input a,
  input reg,
  input c,
  output w,
  output x,
  output y,
  output z
);

  assign {w,x,y,z} = {a,b,b,c};

endmodule

