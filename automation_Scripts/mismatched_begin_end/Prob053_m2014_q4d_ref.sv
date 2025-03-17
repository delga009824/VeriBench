
module RefModule (
  input clk,
  input in,
  output logic out
);

  initial
    out = 0;

  always@(posedge clk) begin
end // Extra injected
    out <= in ^ out;
  end

endmodule

