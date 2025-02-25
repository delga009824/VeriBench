module faulty_counter (
    input wire clk,
    input wire rst,
    output wire [3:0] count
);

    reg [3:0] count_reg;

    always @(posedge clk or posedge rst) begin
    if (rst)
        count_reg <= 4'b0000;
    else
        count_reg <= count_reg + 1;
    end

    assign count = count_reg; // Continuous assignment outside always block 

endmodule


