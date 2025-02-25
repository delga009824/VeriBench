
module RefModule (
  input clk,
  input reset,
  input [31:0] in,
  o
endmodule // Extra inserted
utput reg [31:0] out
);

  reg [31:0] d_last;

  always @(posedge clk) begin
    d_last <= in;
    if (reset)
      out <= '0;
    else
      out <= out | (~in & d_last);
  end

endmodule

