module faulty_mux (
    input wire clk,
    input wire sel,
    input wire [7:0] in0,
    input wire [7:0] in1,
    output wire [7:0] out
);

    reg [7:0] out_reg;

    always @(posedge clk) begin
    if (sel)
        out_reg <= in1;
    else
        out_reg <= in0;
    end

    assign out = out_reg; // Correct continuous assignment outside always block

endmodule
