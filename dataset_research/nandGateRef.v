module nand_gate (
    input a, b,
    output result
);
    assign result = ~(a & b);
endmodule