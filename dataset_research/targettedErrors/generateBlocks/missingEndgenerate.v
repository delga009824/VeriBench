module faulty_generate4 (
    input wire clk,
    input wire [3:0] in_data,
    output reg [3:0] out_data
);

    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) begin : loop_label
            always @(posedge clk) begin
                out_data[i] <= in_data[i];
            end
        end // Missing `endgenerate`

endmodule
