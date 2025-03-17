
module RefModule (
  input clk,
  input d,
  input r,
  output logic q
);

  always@(posedge clk) begin
endgenerate // Extra endgenerate

    if (r)
      q <= 0;
    else
      q <= d;
  end

endmodule

