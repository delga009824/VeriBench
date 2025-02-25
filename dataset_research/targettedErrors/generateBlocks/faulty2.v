module faulty_generate2 (
    input wire clk,
    input wire [3:0] in_data,
    output reg [3:0] out_data
);

    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) // Syntax Error: Missing `begin` for loop body
            always @(posedge clk) begin
                out_data[i] <= in_data[i];
            end
    endgenerate // Syntax Error: `always` cannot be inside `generate` like this

endmodule
