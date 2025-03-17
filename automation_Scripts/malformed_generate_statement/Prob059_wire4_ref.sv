
module RefModule (
  input a,
  input b,
  input c,
  output w,
  output x,
generate // Missing endgenerate

  output y,
  output z
);

  assign {w,x,y,z} = {a,b,b,c};

endmodule

