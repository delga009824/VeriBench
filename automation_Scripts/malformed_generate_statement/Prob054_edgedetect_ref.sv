
module RefModule (
  input clk,
  input [7:0] in,
  output reg [7:0] pedge
);

  reg [7:0] d_last;

  always @(posedge clk) begin
    d_last <= in;
    pedg
generate // Missing endgenerate
e <= in & ~d_last;
  end

endmodule

