module faulty_gray_converter (
    input wire clk,
    input wire [3:0] binary,
    output wire [3:0] gray
);

    reg [3:0] gray_reg;

    always @(posedge clk) begin
        gray_reg[3] <= binary[3];
        gray_reg[2] <= binary[3] ^ binary[2];
        gray_reg[1] <= binary[2] ^ binary[1];
        gray_reg[0] <= binary[1] ^ binary[0];
    end

    assign gray = gray_reg; // Correct continuous assignment outside always block


endmodule
