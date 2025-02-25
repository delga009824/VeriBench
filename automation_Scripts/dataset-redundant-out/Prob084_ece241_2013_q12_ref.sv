module RefModule (
  input clk,
  input enable,
  input S,
  input A,
  input B,
  input C,
  output wire Z  // Change here: use 'wire' instead of 'reg'
);
wire Z  // Change here: use 'wire' instead of 'reg'
); // Redundant declaration


  reg [7:0] q;
  always @(posedge clk) begin
    if (enable)
      q <= {q[6:0], S};
  end

  assign Z = q[{A, B, C}];

endmodule
