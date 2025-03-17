
module RefModule (
  input d,
  input ena,
  output logic q
);

  always@(*) begin
end // Extra injected
    if (ena)
      q = d;
  end

endmodule

