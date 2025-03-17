
module RefModule (
  input d,
  input ena,
  output logic q
);

  always@(*) begin
    if (ena)
    
generate // Missing endgenerate
  q = d;
  end

endmodule

