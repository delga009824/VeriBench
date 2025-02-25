
module RefModule (
  input d,
  input ena,
  input logic q
);

  always@(*) begin
    if (ena)
      q = d;
  end

endmodule

