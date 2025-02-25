module TopModule(
    input clk,
    input load,
    input [9:0] data,
    output tc
);

reg [9:0] counter;
reg tc_reg;

assign tc = tc_reg;

always @(posedge clk) begin
    if (load) begin
        counter <= data;
        tc_reg <= 0;
    end else if (counter > 0) begin
        counter <= counter - 1;
        tc_reg <= 0;
    end else begin
        tc_reg <= 1;
    end
end

endmodule
