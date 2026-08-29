module tb_parameterized_alu;

    parameter N = 8;

    reg [N-1:0] A;
    reg [N-1:0] B;
    reg [3:0] op;

    wire [N-1:0] Y;
    wire Zero;
    wire Carry;
    wire Borrow;
    wire Negative;
    wire Overflow;

    // DUT
    parameterized_alu #(
        .N(N)
    ) DUT (
        .A(A),
        .B(B),
        .op(op),
        .Y(Y),
        .Zero(Zero),
        .Carry(Carry),
        .Borrow(Borrow),
        .Negative(Negative),
        .Overflow(Overflow)
    );

    // Test task
    task test_operation;
        input [3:0] operation;
        input [N-1:0] input_A;
        input [N-1:0] input_B;

        begin
            A = input_A;
            B = input_B;
            op = operation;

            #10;

            $display(
                "TIME=%0t | OP=%b | A=%h | B=%h | Y=%h | ZERO=%b | CARRY=%b | BORROW=%b | NEG=%b | OVF=%b",
                $time,
                op,
                A,
                B,
                Y,
                Zero,
                Carry,
                Borrow,
                Negative,
                Overflow
            );
        end
    endtask

    initial begin

        $display("==============================================");
        $display("        PARAMETERIZED ALU TESTBENCH");
        $display("==============================================");

        // ADD
        test_operation(4'b0000, 8'd10, 8'd20);

        // ADD with carry
        test_operation(4'b0000, 8'hFF, 8'h01);

        // ADD signed overflow
        // 127 + 1 = -128
        test_operation(4'b0000, 8'h7F, 8'h01);

        // SUB
        test_operation(4'b0001, 8'd30, 8'd10);

        // SUB with borrow
        test_operation(4'b0001, 8'd10, 8'd20);

        // SUB signed overflow
        // -128 - 1 = 127
        test_operation(4'b0001, 8'h80, 8'h01);

        // AND
        test_operation(4'b0010, 8'hF0, 8'h0F);

        // OR
        test_operation(4'b0011, 8'hF0, 8'h0F);

        // XOR
        test_operation(4'b0100, 8'hAA, 8'hFF);

        // NOT
        test_operation(4'b0101, 8'h55, 8'h00);

        // LEFT SHIFT
        test_operation(4'b0110, 8'b10000001, 8'h00);

        // RIGHT SHIFT
        test_operation(4'b0111, 8'b00000001, 8'h00);

        // EQUAL - TRUE
        test_operation(4'b1000, 8'd25, 8'd25);

        // EQUAL - FALSE
        test_operation(4'b1000, 8'd25, 8'd30);

        // ZERO RESULT
        test_operation(4'b0001, 8'd25, 8'd25);

        $display("==============================================");
        $display("             TEST COMPLETED");
        $display("==============================================");

        $finish;

    end

endmodule
