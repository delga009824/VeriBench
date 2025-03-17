
module RefModule (
  input clk,
  input x,
  output z
);

  wire [2:0] s = 0;

  always @(posedge clk) begin
    s <= { s[2] ^ x, ~s[1] & x, ~s[0] | x };
  end

  assign z = ~|s;

endmodule

