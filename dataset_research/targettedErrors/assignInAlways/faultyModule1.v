module faulty_module1 (
    input wire clk,
    input wire a,
    input wire b,
    output wire y
);

    reg temp;

    always @(posedge clk) begin
        assign y = a & b; // Syntax error: `assign` cannot be used inside an always block
    end

endmodule
