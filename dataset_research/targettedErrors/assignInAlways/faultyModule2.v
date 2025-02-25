module faulty_module2 (
    input wire clk,
    input wire d,
    output wire q
);

    reg q_reg;

    always @(posedge clk) begin
        assign q = q_reg; // Syntax error: `assign` cannot be used inside an always block
        q_reg <= d;
    end

endmodule
