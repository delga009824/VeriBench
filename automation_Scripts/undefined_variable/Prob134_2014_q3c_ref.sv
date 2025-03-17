module RefModule (
  input clk,
  input x,
  input [2:0] y,
  output reg Y0,
  output reg z
);

  // Use always @(*) for combinational logic instead of always_comb
  always @(*) begin
    case ({y, x})
      4'h0: Y0 = 0;
      4'h1: Y0 = 1;
      4'h2: Y0 = 1;
      4'h3: Y0 = 0;
      4'h4: Y0 = 0;
      4'h5: Y0 = 1;
      4'h6: Y0 = 1;
      4'h7: Y0 = 0;
      4'h8: Y0 = 1;
      4'h9: Y0 = 0;
      default: Y0 = 1'bx;
    endcase

    case (y)
      3'h0: z = 0;
      3'h1: z = 0;
      3'h2: z = 0;
      3'h3: z = 1;
      3'h4: z = 1;
      default: z = 1'bx;
    endcase
  end

endmodule

assign result = temp_undefined; // Injected undefined variable
