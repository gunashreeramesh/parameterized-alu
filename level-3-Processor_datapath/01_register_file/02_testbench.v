module tb_register_file;

    parameter N = 8;
    parameter REG_COUNT = 8;

    reg clk;
    reg reset;

    reg [$clog2(REG_COUNT)-1:0] read_addr1;
    reg [$clog2(REG_COUNT)-1:0] read_addr2;

    wire [N-1:0] read_data1;
    wire [N-1:0] read_data2;

    reg [$clog2(REG_COUNT)-1:0] write_addr;
    reg [N-1:0] write_data;
    reg write_enable;

    // Instantiate register file
    register_file #(
        .N(N),
        .REG_COUNT(REG_COUNT)
    ) dut (
        .clk(clk),
        .reset(reset),

        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .read_data1(read_data1),
        .read_data2(read_data2),

        .write_addr(write_addr),
        .write_data(write_data),
        .write_enable(write_enable)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;

        read_addr1 = 0;
        read_addr2 = 0;

        write_addr = 0;
        write_data = 0;
        write_enable = 0;

        // Reset
        #10;
        reset = 0;

        // Write 10 into R1
        write_enable = 1;
        write_addr = 1;
        write_data = 10;
        #10;

        // Write 22 into R2
        write_addr = 2;
        write_data = 22;
        #10;

        // Read R1 and R2
        write_enable = 0;
        read_addr1 = 1;
        read_addr2 = 2;
        #10;

        // Write 32 into R3
        write_enable = 1;
        write_addr = 3;
        write_data = 32;
        #10;

        // Read R3
        write_enable = 0;
        read_addr1 = 3;
        read_addr2 = 0;
        #10;

        // Reset
        reset = 1;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | Reset=%b | WE=%b | WAddr=%d | WData=%d | RAddr1=%d | RData1=%d | RAddr2=%d | RData2=%d",
                 $time, reset, write_enable, write_addr, write_data,
                 read_addr1, read_data1, read_addr2, read_data2);
    end

endmodule
