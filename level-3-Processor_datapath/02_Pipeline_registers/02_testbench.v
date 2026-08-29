module tb_pipeline_register;

    parameter N = 8;

    reg clk;
    reg reset;
    reg enable;
    reg [N-1:0] data_in;

    wire [N-1:0] data_out;

    pipeline_register #(
        .N(N)
    ) dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        enable = 0;
        data_in = 0;

        // Reset
        #10;
        reset = 0;

        // Test 1
        enable = 1;
        data_in = 8'd10;
        #10;

        // Test 2
        data_in = 8'd25;
        #10;

        // Test 3
        data_in = 8'd50;
        #10;

        // Disable pipeline
        enable = 0;
        data_in = 8'd100;
        #10;

        // Reset
        reset = 1;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | Reset=%b | Enable=%b | Data_in=%d | Data_out=%d",
                 $time, reset, enable, data_in, data_out);
    end

endmodule
