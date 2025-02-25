
module RefModule (
  input clk,
  input d,
  input endcase,
  output logic q
);

  always@(posedge clk) begin
    if (r)
      q <= 0;
    else
      q <= d;
  end

endmodule

