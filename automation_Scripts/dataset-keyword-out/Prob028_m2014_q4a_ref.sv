
module RefModule (
  input endcase,
  input ena,
  output logic q
);

  always@(*) begin
    if (ena)
      q = d;
  end

endmodule

