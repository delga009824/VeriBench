module RefModule (
  input wire clk,
  input wire reset,
  input wire data,
  output wire [3:0] count,
  output reg counting,
  output reg done,
  input wire ack
);

  // Define state encoding using parameters
  localparam S    = 4'd0,
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

  reg input;
  reg [9:0] fcount;
  reg [3:0] scount;
  wire done_counting = (scount == 4'd0) && (fcount == 10'd999);

  // Next state logic (without SystemVerilog casting)
  always @(*) begin
    case (state)
      S:    next = data ? S1   : S;
      S1:   next = data ? S11  : S;
      S11:  next = data ? S11  : S110;
      S110: next = data ? B0   : S;
      B0:   next = B1;
      B1:   next = B2;
      B2:   next = B3;
      B3:   next = Count;
      Count:next = done_counting ? Wait : Count;
      Wait: next = ack ? S : Wait;
      default: next = 4'bxxxx;
    endcase
  end

  // State update
  always @(posedge clk) begin
    if (reset)
      state <= S;
    else
      state <= next;
  end

  // Output logic for control signals
  always @(*) begin
    shift_ena = 1'b0;
    counting  = 1'b0;
    done      = 1'b0;
    if (state == B0 || state == B1 || state == B2 || state == B3)
      shift_ena = 1'b1;
    if (state == Count)
      counting = 1'b1;
    if (state == Wait)
      done = 1'b1;
    // Optionally, handle unknown state:
    if (&state === 1'bx) begin
      {shift_ena, counting, done} = 3'bxxx;
    end
  end

  // Shift register and counters as before...
  // (Adjust other parts similarly if needed.)

  assign count = counting ? scount : 4'bxxxx;

endmodule
