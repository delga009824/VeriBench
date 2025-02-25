module faulty_generate (
    input wire clk,
    input wire [3:0] in_data,
    output wire [3:0] out_data
);

    genvar i;
    
    generate
        for (i = 0; i < 4; i++) begin // Syntax Error: Missing `endgenerate`
            always @(posedge clk) begin
                out_data[i] <= in_data[i]; // Syntax Error: `out_data` must be a `reg` inside an always block
            end
        end
    endgenerate

endmodule
