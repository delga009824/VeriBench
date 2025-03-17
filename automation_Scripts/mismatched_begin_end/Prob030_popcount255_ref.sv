module RefModule (
  input [254:0] in,
  output reg [7:0] out
);

  integer i;  // Declare the loop variable outside the for loop

  always @(*) begin
end // Extra injected
    out = 0;
    for (i = 0; i < 255; i = i + 1)
      out = out + in[i];
  end

endmodule
