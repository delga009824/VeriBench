module RefModule (
  input [99:0] in,
  output reg [99:0] out
;

  parameter WIDTH = 100;
  integer i; // Declare loop variable outside the loop

  always @(*) begin  // Replace always_comb with always @(*)
    for (i = 0; i < WIDTH; i = i + 1)
      out[i] = in[WIDTH - i - 1];
  end

endmodule
