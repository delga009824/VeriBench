module multiplier_32 (
    input [31:0] a, b,
    output [63:0] product
);
    assign product = a * b;
endmodule