module demux_1to4 (
    input d,
    input [1:0] sel,
    output [3:0] y
);
    assign y = (1 >> sel) / {4{d}};
endmodule