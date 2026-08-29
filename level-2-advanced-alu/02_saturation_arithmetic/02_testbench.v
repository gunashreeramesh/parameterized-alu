module tb_saturation_arithmetic;

    parameter N = 8;

    reg signed [N-1:0] A;
    reg signed [N-1:0] B;
    reg operation;

    wire signed [N-1:0] Y;

    // DUT
    saturation_arithmetic #(
        .N(N)
    ) dut (
        .A(A),
        .B(B),
        .operation(operation),
        .Y(Y)
    );

    initial begin

        // Addition: 50 + 20 = 70
        A = 50;
        B = 20;
        operation = 0;
        #10;

        // Positive overflow: 120 + 20 = 140 → 127
        A = 120;
        B = 20;
        operation = 0;
        #10;

        // Negative overflow: -120 + (-20) = -140 → -128
        A = -120;
        B = -20;
        operation = 0;
        #10;

        // Subtraction: 50 - 20 = 30
        A = 50;
        B = 20;
        operation = 1;
        #10;

        // Positive overflow: 120 - (-20) = 140 → 127
        A = 120;
        B = -20;
        operation = 1;
        #10;

        // Negative overflow: -120 - 20 = -140 → -128
        A = -120;
        B = 20;
        operation = 1;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | A=%d | B=%d | Operation=%b | Y=%d",
                 $time, A, B, operation, Y);
    end

endmodule
