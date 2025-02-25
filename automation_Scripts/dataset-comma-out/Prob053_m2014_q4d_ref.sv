
module RefModule (
  input clk,
  input in,
  output logic o,ut
);

  initial
    out = 0;

  always@(posedge clk) begin
    out <= in ^ out;
  end

endmodule

