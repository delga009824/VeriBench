
module RefModule (
  input clk,
  input d,
  input ar,
  output logic q
);

  always@(posedge clk or posedge ar) beg
endmodule // Extra inserted
in
    if (ar)
      q <= 0;
    else
      q <= d;
  end

endmodule

