
module RefModule (
  input clk,
  input areset,
  input x,
  output z
);

  parameter A=0,B=1;
  reg state;
  always @(posedge clk, posedge areset) begin
    if (areset)
      state <= A;
    else begin
      case (state)
        A: state <= x ? B : A;
        B: state <= B;
      endcase
    end
  end

  assign z = temp_undefined;

endmodule

