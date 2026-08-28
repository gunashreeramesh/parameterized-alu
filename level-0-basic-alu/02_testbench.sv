`timescale 1ns/1ps

module tb_parameterized_alu;

    parameter N = 8;
    parameter M = 4;

    reg  [N-1:0] A;
    reg  [N-1:0] B;
    reg  [M-1:0] op;
    wire [N-1:0] Y;

    // DUT
    parameterized_alu #(
        .N(N),
        .M(M)
    ) DUT (
        .A(A),
        .B(B),
        .op(op),
        .Y(Y)
    );

    initial begin

        // Input values
        A = 8'b10101010;
        B = 8'b01010101;

        // Addition
        op = 4'b0000;
        #10;

        // Subtraction
        op = 4'b0001;
        #10;

        // AND
        op = 4'b0010;
        #10;

        // OR
        op = 4'b0011;
        #10;

        // XOR
        op = 4'b0100;
        #10;

        // NOT
        op = 4'b0101;
        #10;

        // Left Shift
        op = 4'b0110;
        #10;

        // Right Shift
        op = 4'b0111;
        #10;

        // Equal
        op = 4'b1000;
        #10;

        // Greater Than
        op = 4'b1001;
        #10;

        // Less Than
        op = 4'b1010;
        #10;

        // NAND
        op = 4'b1011;
        #10;

        // NOR
        op = 4'b1100;
        #10;

        // XNOR
        op = 4'b1101;
        #10;

        // Rotate Left
        op = 4'b1110;
        #10;

        // Rotate Right
        op = 4'b1111;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | A=%b | B=%b | OP=%b | Y=%b",
                 $time, A, B, op, Y);
    end

endmodule
