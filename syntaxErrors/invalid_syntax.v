module invalid_keyword(input a, output b);
    int c;  // `int` is not a valid Verilog keyword
    assign b = a;
endmodule
