module TopModule(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

integer i, j;
reg [3:0] neighbours;

always @(posedge clk) begin
    if (load) begin
        q <= data;
    end else begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                neighbours = count_neighbours(i, j);
                case (neighbours)
                    4'b0001, 4'b0010: q[i*16 + j] <= 0;
                    4'b0011: q[i*16 + j] <= q[i*16 + j];
                    4'b0100: q[i*16 + j] <= 1;
                    default: q[i*16 + j] <= 0;
                endcase
            end
        end
    end
end

function [3:0] count_neighbours;
    input [3:0] row;
    input [3:0] col;
    reg [3:0] count;
    begin
        count = 0;
        if (q[((row-1) % 16)*16 + (col-1) % 16]) count = count + 1;
        if (q[((row-1) % 16)*16 + col % 16]) count = count + 1;
        if (q[((row-1) % 16)*16 + (col+1) % 16]) count = count + 1;
        if (q[(row % 16)*16 + (col-1) % 16]) count = count + 1;
        if (q[(row % 16)*16 + (col+1) % 16]) count = count + 1;
        if (q[((row+1) % 16)*16 + (col-1) % 16]) count = count + 1;
        if (q[((row+1) % 16)*16 + col % 16]) count = count + 1;
        if (q[((row+1) % 16)*16 + (col+1) % 16]) count = count + 1;
        count_neighbours = count;
    end
endfunction

endmodule
