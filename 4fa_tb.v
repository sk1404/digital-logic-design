`timescale 1ns/1ps

module tb_full_adder_4bit();

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    full_adder_4bit UUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $display("Time |   A   B  Cin | Sum Cout");
        $display("--------------------------------");

        // Test 1
        A = 4'b0001; B = 4'b0010; Cin = 0; #10;

        // Test 2
        A = 4'b0101; B = 4'b0011; Cin = 1; #10;

        // Test 3
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;

        // Test 4
        A = 4'b1001; B = 4'b0110; Cin = 1; #10;

        // Test 5
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;

        $finish;
    end

endmodule
