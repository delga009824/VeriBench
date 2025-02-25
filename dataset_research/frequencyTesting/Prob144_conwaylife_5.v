module TopModule(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q
);

reg [255:0] q_reg;
assign q = q_reg;

wire [255:0] next_state;

always @(posedge clk) begin
    if (load) begin
        q_reg <= data;
    end else begin
        q_reg <= next_state;
    end
end

// Generate the next state of the game grid
genvar i, j;
generate
    for (i = 0; i < 16; i = i + 1) begin : row_loop
        for (j = 0; j < 16; j = j + 1) begin : cell_loop
            wire [8:0] neighbors;
            assign neighbors = {
                q_reg[(i == 0 ? 255 : (i-1)*16 + j)], // Top
                q_reg[(i == 15 ? 0 : (i+1)*16 + j)], // Bottom
                q_reg[(j == 0 ? (i*16 + 15) : (i*16 + j-1))], // Left
                q_reg[(j == 15 ? (i*16) : (i*16 + j+1))], // Right
                q_reg[(i == 0 ? (15*16 + j) : ((i-1)*16 + j))], // Top-left
                q_reg[(i == 15 ? (0*16 + j) : ((i+1)*16 + j))], // Bottom-left
                q_reg[(i == 0 ? (15*16 + j) : ((i-1)*16 + j))], // Top-right
                q_reg[(i == 15 ? (0*16 + j) : ((i+1)*16 + j))], // Bottom-right
                q_reg[(i*16 + j)] // Current
            };
            assign next_state[i*16 + j] = (neighbors[8:1] == 3) ? 1 : 0;
        end
    end
endgenerate

endmodule
