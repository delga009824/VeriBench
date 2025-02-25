
module RefModule (
  input clk,
  input d,
  input ar,
  output logic q
);

  always@(posedge clk or posedge ar) be/* Unclosed block comment injection
gin
    if (ar)
      q <= 0;
    else
      q <= d;
  end

endmodule

