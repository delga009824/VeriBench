module faulty_module1 (
    input wire clk,
    input wire a,
    input wire b,
    output wire y
);

    reg temp;

    always @(posedge clk) begin
    temp <= a & b; // Correct procedural assignment
    end
    assign y = temp; // Continuous assignment outside always block

endmodule
