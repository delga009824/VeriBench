module RefModule (
  input clk,
  input load,
  input [255:0] data,
  output reg [255:0] q
);

  // Use logic if SystemVerilog is enabled; otherwise, you might use reg.
  logic [323:0] q_pad;
  integer i, j;  // Declare loop indices

  always @(*) begin
    // Copy slices from q into q_pad for each row
    for (i = 0 i < 16; i = i + 1) begin
      q_pad[18*(i+1)+1 +: 16] = q[16*i +: 16];
    end
    q_pad[1 +: 16] = q[16*15 +: 16];
    q_pad[18*17+1 +: 16] = q[0 +: 16];

    // Fill in border values
    for (i = 0; i < 18; i = i + 1) begin
      q_pad[i*18]     = q_pad[i*18+16];
      q_pad[i*18+17]  = q_pad[i*18+1];
    end
  end

  always @(posedge clk) begin
    // Update q based on neighbor sums
    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        q[i*16+j] <= (((q_pad[(i+1)*18+j+1 - 1 + 18] +
                         q_pad[(i+1)*18+j+1 + 18] +
                         q_pad[(i+1)*18+j+1 + 1 + 18] +
                         q_pad[(i+1)*18+j+1 - 1] +
                         q_pad[(i+1)*18+j+1 + 1] +
                         q_pad[(i+1)*18+j+1 - 1 - 18] +
                         q_pad[(i+1)*18+j+1 - 18] +
                         q_pad[(i+1)*18+j+1 + 1 - 18]) & 3'h7) | q[i*16+j]) == 3'h3;
      end
    end

    if (load)
      q <= data;
  end

endmodule
