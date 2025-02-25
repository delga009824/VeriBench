module port_test(input a, output b);
    assign b = a;
endmodule

module top;
    wire x, y;
    port_test u1(.a(x), .c(y));  // Incorrect port `c`
endmodule
