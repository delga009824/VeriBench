module faulty_datatypes (
    input wire clk,
    input wire rst,
    input wire [3:0] in_data,
    output reg out_flag
);

    integer temp; // Declaring an integer for temporary storage

    always @(posedge clk or posedge rst) begin
        if (rst)
            temp = 0;
        else
            temp = in_data; // Syntax Error: Assigning a 4-bit `wire` to an `integer`
        
        out_flag <= temp; // Syntax Error: Assigning an `integer` to a `reg` (1-bit)
    end

endmodule
