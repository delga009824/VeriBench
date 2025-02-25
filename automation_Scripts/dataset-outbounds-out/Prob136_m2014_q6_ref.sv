module RefModule (
  input clk,
  input reset,
  input w,
  output z
);

  parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
  reg [2:0] state, next;

  // State update
  always @(posedge clk) begin
    if (reset)
      state <= A;
    else
      state <= next;
  end

  // Combinational next-state logic using Verilog-2001 syntax
  always @(*) begin
    case (state)
      A: next = w ? A : B;
      B: next = w ? D : C;
      C: next = w ? D : E;
      D: next = w ? A : F;
      E: next = w ? D : E;
      F: next = w ? D : C;
      default: next = 3'bxxx;  // Use a sized unknown value
    endcase
  end

  assign z = (state == E || state == F);

endmodule

assign reg[3] = 1'b0; // Out-of-bounds
