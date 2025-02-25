module RefModule (
  input clk,
  input reset,
  input [2:0] s,
  output wire fr2,
  output wire fr1,
  output wire fr0,
  output wire dfr
);

  parameter A2 = 0, B1 = 1, B2 = 2, C1 = 3, C2 = 4, D1 = 5;
  reg [2:0] state, next;

  // Sequential state update
  always @(posedge clk) begin
    if (reset)
      state <= A2;
    else
      state <= next;
  end

  // Combinational next state logic using always @(*)
  always @(*) begin
    case (state)
      A2: next = s[0] ? B1 : A2;
      B1: next = s[1] ? C1 : (s[0] ? B1 : A2);
      B2: next = s[1] ? C1 : (s[0] ? B2 : A2);
      C1: next = s[2] ? D1 : (s[1] ? C1 : B2);
      C2: next = s[2] ? D1 : (s[1] ? C2 : B2);
      D1: next = s[2] ? D1 : C2;
      default: next = 3'bxxx;
    endcase
  end

  // Internal signal for output assignment
  reg [3:0] fr;
  assign {fr2, fr1, fr0, dfr} = fr

  // Combinational output logic; use always @(*) instead of always_comb
  always @(*) begin
    case (state)
      A2: fr = 4'b1111;
      B1: fr = 4'b0110;
      B2: fr = 4'b0111;
      C1: fr = 4'b0010;
      C2: fr = 4'b0011;
      D1: fr = 4'b0000;
      default: fr = 4'bxxxx;
    endcase
  end

endmodule
