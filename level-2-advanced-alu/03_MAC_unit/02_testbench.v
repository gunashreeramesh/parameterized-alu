module tb_mac_unit;

    parameter N = 8;

    reg clk;
    reg reset;
    reg enable;
    reg [N-1:0] A;
    reg [N-1:0] B;

    wire [2*N-1:0] ACC;

    // Instantiate MAC
    mac_unit #(
        .N(N)
    ) dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .A(A),
        .B(B),
        .ACC(ACC)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        enable = 0;
        A = 0;
        B = 0;

        // Reset
        #10;
        reset = 0;

        // Test 1: 3 × 4 = 12
        enable = 1;
        A = 3;
        B = 4;
        #10;

        // Test 2: 2 × 5 = 10
        // ACC = 12 + 10 = 22
        A = 2;
        B = 5;
        #10;

        // Test 3: 4 × 3 = 12
        // ACC = 22 + 12 = 34
        A = 4;
        B = 3;
        #10;

        // Disable accumulation
        enable = 0;
        A = 10;
        B = 10;
        #10;

        // Reset
        reset = 1;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | Reset=%b | Enable=%b | A=%d | B=%d | ACC=%d",
                 $time, reset, enable, A, B, ACC);
    end

endmodule
