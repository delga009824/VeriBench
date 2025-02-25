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
    integer i, j, idx, count;
    next_q = q;

    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            idx = i * 16 + j;
            count = 0;

            // Count the live neighbors using the toroidal wrap-around
            count = count + q[((i-1+16)%16)*16 + ((j-1+16)%16)]; // top-left
            count = count + q[((i-1+16)%16)*16 + j];               // top
            count = count + q[((i-1+16)%16)*16 + ((j+1)%16)];     // top-right
            count = count + q[(i)*16 + ((j-1+16)%16)];             // left
            count = count + q[(i)*16 + ((j+1)%16)];               // right
            count = count + q[((i+1)%16)*16 + ((j-1+16)%16)];     // bottom-left
            count = count + q[((i+1)%16)*16 + j];                 // bottom
            count = count + q[((i+1)%16)*16 + ((j+1)%16)];         // bottom-right

            // Apply the game rules
            if (q[idx] == 1) begin
                if (count != 2 && count != 3) begin
                    next_q[idx] = 0;
                end
            end else begin
                if (count == 3) begin
                    next_q[idx] = 1;
                end
            end
        end
    end
end

endmodule
