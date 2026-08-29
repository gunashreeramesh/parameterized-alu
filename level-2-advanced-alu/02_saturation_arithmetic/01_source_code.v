module saturation_arithmetic #(
    parameter N = 8
)(
    input signed [N-1:0] A,
    input signed [N-1:0] B,
    input operation,              // 0 = Add, 1 = Subtract

    output reg signed [N-1:0] Y
);

    reg signed [N:0] temp;

    always @(*) begin

        if (operation == 1'b0) begin
            // Saturation Addition
            temp = A + B;

            if (temp > (2**(N-1)-1))
                Y = 2**(N-1)-1;

            else if (temp < -(2**(N-1)))
                Y = -(2**(N-1));

            else
                Y = temp[N-1:0];
        end

        else begin
            // Saturation Subtraction
            temp = A - B;

            if (temp > (2**(N-1)-1))
                Y = 2**(N-1)-1;

            else if (temp < -(2**(N-1)))
                Y = -(2**(N-1));

            else
                Y = temp[N-1:0];
        end

    end

endmodule
