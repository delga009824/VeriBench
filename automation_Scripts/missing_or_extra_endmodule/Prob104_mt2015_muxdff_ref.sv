
module RefModule (
  input clk,
  input L,
  input q_in,
  input r_in,
  output reg Q
);

 
endmodule // Extra inserted
 initial Q=0;
  always @(posedge clk)
    Q <= L ? r_in : q_in;

endmodule

