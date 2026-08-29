module mac_unit #(
    parameter N = 8
)(
    input                  clk,
    input                  reset,
    input                  enable,
    input      [N-1:0]     A,
    input      [N-1:0]     B,

    output reg [2*N-1:0]   ACC
);

    reg [2*N-1:0] product;

    always @(posedge clk) begin

        if (reset)
            ACC <= 0;

        else if (enable) begin
            product = A * B;
            ACC <= ACC + product;
        end

    end

endmodule
