module register_file #(
    parameter N = 8,
    parameter REG_COUNT = 8
)(
    input                   clk,
    input                   reset,

    // Read ports
    input  [$clog2(REG_COUNT)-1:0] read_addr1,
    input  [$clog2(REG_COUNT)-1:0] read_addr2,
    output reg [N-1:0]             read_data1,
    output reg [N-1:0]             read_data2,

    // Write port
    input                   [$clog2(REG_COUNT)-1:0] write_addr,
    input                   [N-1:0]                 write_data,
    input                                           write_enable
);

    // Register storage
    reg [N-1:0] registers [0:REG_COUNT-1];

    integer i;

    // Write operation and reset
    always @(posedge clk) begin

        if (reset) begin
            for (i = 0; i < REG_COUNT; i = i + 1)
                registers[i] <= 0;
        end

        else if (write_enable) begin
            registers[write_addr] <= write_data;
        end

    end

    // Read operation
    always @(*) begin
        read_data1 = registers[read_addr1];
        read_data2 = registers[read_addr2];
    end

endmodule
