module tb_source;

    parameter N = 8;

    reg  [N-1:0] A;
    reg  [N-1:0] shamt;
    reg          mode;
    reg          direction;

    wire [N-1:0] Y;

    // DUT instantiation
    variable_shift_rotate #(.N(N)) DUT (
        .A(A),
        .shamt(shamt),
        .mode(mode),
        .direction(direction),
        .Y(Y)
    );

    initial begin

        A = 8'b10110011;

        // 1. Variable Left Shift by 1
        mode = 1'b0;
        direction = 1'b0;
        shamt = 1;
        #10;

        // 2. Variable Left Shift by 2
        shamt = 2;
        #10;

        // 3. Variable Left Shift by 3
        shamt = 3;
        #10;

        // 4. Variable Right Shift by 1
        direction = 1'b1;
        shamt = 1;
        #10;

        // 5. Variable Right Shift by 2
        shamt = 2;
        #10;

        // 6. Variable Right Shift by 3
        shamt = 3;
        #10;

        // 7. Variable Left Rotate by 1
        mode = 1'b1;
        direction = 1'b0;
        shamt = 1;
        #10;

        // 8. Variable Left Rotate by 2
        shamt = 2;
        #10;

        // 9. Variable Left Rotate by 3
        shamt = 3;
        #10;

        // 10. Variable Right Rotate by 1
        direction = 1'b1;
        shamt = 1;
        #10;

        // 11. Variable Right Rotate by 2
        shamt = 2;
        #10;

        // 12. Variable Right Rotate by 3
        shamt = 3;
        #10;

        $finish;

    end

endmodule
