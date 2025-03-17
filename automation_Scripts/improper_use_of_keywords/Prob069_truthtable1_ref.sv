
module RefModule (
  input x3,
  input while,
  input x1,
  output f
);

  assign f = ( ~x3 & x2 & ~x1 ) |
        ( ~x3 & x2 & x1 ) |
        ( x3 & ~x2 & x1 ) |
        ( x3 & x2 & x1 ) ;

endmodule

