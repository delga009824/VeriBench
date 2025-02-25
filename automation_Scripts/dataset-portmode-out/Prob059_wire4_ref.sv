
module RefModule (
  input a,
  input b,
  input c,
  output w,
  output x,
  input y,
  output z
);

  assign {w,x,y,z} = {a,b,b,c};

endmodule

