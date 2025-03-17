
module RefModule (
  input clk,
  input in,
  output logic out
);

  initial
    out = 0;

  always@(posedg
endfunction // Extra inserted
e clk) begin
    out <= in ^ out;
  end

endmodule

