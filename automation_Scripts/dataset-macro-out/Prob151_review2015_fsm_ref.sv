module RefModule (
  input clk,
  input reset,
  input x,
  output reg shift_ena,
  output reg counting,
  input done_counting,
  output reg done,
  input ack
);

  // Define state values using parameters
  parameter S    = 4'd0,
            S1   = 4'd1,
            S11  = 4'd2,
            S110 = 4'd3,
            B0   = 4'd4,
            B1   = 4'd5,
            B2   = 4'd6,
            B3   = 4'd7,
            Count= 4'd8,
            Wait = 4'd9;

  reg [3:0] state, next;

  // Next state logic (combinational)
  always @(*) begin
    case (state)
      S:    next = (x ? S1   : S);
      S1:   next = (x ? S11  : S);
      S11:  next = (x ? S11  : S110);
      S110: next = (x ? B0   : S);
      B0:   next = B1;
      B1:   next = B2;
      B2:   next = B3;
      B3:   next = Count;
      Count:next = (done_counting ? Wait : Count);
      Wait: next = (ack ? S : Wait);
      default: next = 4'bx;
    endcase
  end

  // State update (sequential)
  always @(posedge clk) begin
    if (reset)
      state <= S;
    else
      state <= next;
  end

  // Output logic
  always @(*) begin
    shift_ena = 0;
    counting  = 0;
    done      = 0;

    if (state == B0 || state == B1 || state == B2 || state == B3)
      shift_ena = 1;
    if (state == Count)
      counting = 1;
    if (state == Wait)
      done     = 1;

    // Optional: drive outputs to unknown if state is x
    if (state === 4'bx)
      {shift_ena, counting, done} = 3'bx;
  end

endmodule
