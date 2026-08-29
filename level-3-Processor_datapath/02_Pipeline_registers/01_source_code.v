module pipeline_register #(
    parameter N = 8
)(
    input              clk,
    input              reset,
    input              enable,

    input      [N-1:0] data_in,
    output reg [N-1:0] data_out
);

    always @(posedge clk) begin

        if (reset)
            data_out <= 0;

        else if (enable)
            data_out <= data_in;

    end

endmodule
