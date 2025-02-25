module fixed_datatypes (
    input wire clk,
    input wire rst,
    input wire [3:0] in_data,
    output reg out_flag
);

    reg [3:0] temp; // Fixed: Using a 4-bit reg instead of an integer

    always @(posedge clk or posedge rst) begin
        if (rst)
            temp <= 4'b0000; // Fixed: Proper 4-bit assignment
        else
            temp <= in_data; // Now both sides are 4-bit
        
        out_flag <= temp[0]; // Fixed: Assigning only 1-bit to out_flag
    end

endmodule
