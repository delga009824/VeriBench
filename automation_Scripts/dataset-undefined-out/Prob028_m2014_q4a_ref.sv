
module RefModule (
  input d,
  input ena,
  output logic q
);

  always@(*) begin
    if (ena)
      q = d;
  end

endmodule


assign result = temp_undefined; // Injected undefined variable
