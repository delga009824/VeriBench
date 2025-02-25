`define WIDTH 8

module faulty_constant (
    input wire clk,
    input wire rst,
    input wire [`WIDTH:0] data_in, // Syntax error: `WIDTH` should be `WIDTH-1`
    output reg [`WIDTH:0] data_out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= `WIDTH'b0; // Syntax error: `WIDTH` should be used as an integer, not in bit-width notation
        else
            data_out <= data_in;
    end

endmodule
