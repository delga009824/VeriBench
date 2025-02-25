module faulty_module2 (
    input wire clk,
    input wire d,
    output wire q
);

    reg q_reg;

    always @(posedge clk) begin
    q_reg <= d; // Correct procedural assignment
    end

    assign q = q_reg; // Continuous assignment outside always block


endmodule
