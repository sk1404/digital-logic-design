module full_adder_4bit(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

    wire c1, c2, c3;

    // Bit 0
    assign {c1, Sum[0]} = A[0] + B[0] + Cin;

    // Bit 1
    assign {c2, Sum[1]} = A[1] + B[1] + c1;

    // Bit 2
    assign {c3, Sum[2]} = A[2] + B[2] + c2;

    // Bit 3
    assign {Cout, Sum[3]} = A[3] + B[3] + c3;

endmodule
