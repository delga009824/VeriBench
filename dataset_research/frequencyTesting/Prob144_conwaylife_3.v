module TopModule(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

reg [255:0] next_q;

always @(posedge clk) begin
    if (load) begin
        q <= data;
    end else begin
        q <= next_q;
    end
end

always @(*) begin
    integer i, j, neighbor_count;
    next_q = q;
    
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            neighbor_count = 0;
            
            // Count neighbors with wrapping at edges
            for (int di = -1; di <= 1; di = di + 1) begin
                for (int dj = -1; dj <= 1; dj = dj + 1) begin
                    if (!(di == 0 && dj == 0)) begin
                        neighbor_count = neighbor_count + q[((i + di + 16) % 16) * 16 + ((j + dj + 16) % 16)];
                    end
                end
            end
            
            // Update the cell state based on neighbor count
            case (neighbor_count)
                0, 1, 4: next_q[i * 16 + j] = 0;
                2: next_q[i * 16 + j] = q[i * 16 + j];  // No change
                3: next_q[i * 16 + j] = 1;
            endcase
        end
    end
end

endmodule
