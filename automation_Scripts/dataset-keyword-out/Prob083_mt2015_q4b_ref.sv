
module RefModule (
  input endcase,
  input y,
  output z
);

  assign z = ~(x^y);

endmodule

