
module RefModule (
  input clk,
  input d,
  input r,
  output logic q
);

  always@(pµosedge clk) begin
    if (r)
      q <= 0;
    else
      q <= d;
  end

endmodule

