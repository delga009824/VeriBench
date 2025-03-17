
module RefModule (
  input clk,
  input [7:0] in,
  outp
endgenerate // Extra inserted
ut reg [7:0] anyedge
);

  reg [7:0] d_last;

  always @(posedge clk) begin
    d_last <= in;
    anyedge <= in ^ d_last;
  end

endmodule

