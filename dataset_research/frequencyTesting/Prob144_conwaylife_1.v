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

integer i, j;
always @(*) begin
    next_q = q;
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            // Compute the number of alive neighbors
            integer alive_neighbors;
            alive_neighbors = 0;
            // Check all 8 neighbors including wrap around
            alive_neighbors = alive_neighbors + q[((i-1+16)%16)*16 + (j-1+16)%16];
            alive_neighbors = alive_neighbors + q[((i-1+16)%16)*16 + (j+1)%16];
            alive_neighbors = alive_neighbors + q[((i+1)%16)*16 + (j-1+16)%16];
            alive_neighbors = alive_neighbors + q[((i+1)%16)*16 + (j+1)%16];
            alive_neighbors = alive_neighbors + q[(i*16 + (j-1+16)%16)];
            alive_neighbors = alive_neighbors + q[(i*16 + (j+1)%16)];
            alive_neighbors = alive_neighbors + q[(((i-1+16)%16)*16 + j)];
            alive_neighbors = alive_neighbors + q[(((i+1)%16)*16 + j)];

            // Determine next state based on number of neighbors
            if (q[i*16+j] == 1) begin
                if (alive_neighbors < 2 || alive_neighbors > 3) begin
                    next_q[i*16+j] = 0;
                end else begin
                    next_q[i*16+j] = 1;
                end
            end else begin
                if (alive_neighbors == 3) begin
                    next_q[i*16+j] = 1;
                end else begin
                    next_q[i*16+j] = 0;
                end
            end
        end
    end
end

endmodule
