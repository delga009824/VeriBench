module fixed_generate (
    input wire clk,
    input wire [3:0] in_data,
    output reg [3:0] out_data // Corrected to reg type
);

    genvar i;
    
    generate
        for (i = 0; i < 4; i = i + 1) begin : loop_label // Added loop label for clarity
            always @(posedge clk) begin
                out_data[i] <= in_data[i]; // Now correctly inside an always block with reg output
            end
        end
    endgenerate

endmodule
