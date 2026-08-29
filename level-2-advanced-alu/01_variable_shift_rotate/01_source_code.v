module variable_shift_rotate #(
    parameter N = 8
)(
    input  [N-1:0] A,
    input  [N-1:0] shamt,
    input          mode,
    input          direction,

    output reg [N-1:0] Y
);

    always @(*) begin

        if (mode == 1'b0) begin
            // Variable Shift

            if (direction == 1'b0)
                Y = A << shamt;    // Left shift
            else
                Y = A >> shamt;    // Right shift

        end
        else begin
            // Variable Rotate

            if (direction == 1'b0)
                Y = (A << shamt) | (A >> (N - shamt));   // Left rotate
            else
                Y = (A >> shamt) | (A << (N - shamt));   // Right rotate

        end

    end

endmodule
