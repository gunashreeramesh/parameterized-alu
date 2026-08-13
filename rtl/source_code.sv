module parameterized_alu #(
    parameter N = 8
)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    input  [3:0] op,

    output reg [N-1:0] Y,

    output reg Zero,
    output reg Carry,
    output reg Borrow,
    output reg Negative,
    output reg Overflow
);

    reg [N:0] temp;

    always @(*) begin

        // Default values
        Y        = {N{1'b0}};
        Carry    = 1'b0;
        Borrow   = 1'b0;
        Overflow = 1'b0;
        temp     = {(N+1){1'b0}};

        case (op)

            // ADD
            4'b0000: begin
                temp = {1'b0, A} + {1'b0, B};
                Y = temp[N-1:0];
                Carry = temp[N];

                // Signed overflow
                Overflow = (~(A[N-1] ^ B[N-1])) &
                           (Y[N-1] ^ A[N-1]);
            end

            // SUB
            4'b0001: begin
                Y = A - B;

                // Borrow
                Borrow = (A < B);

                // Signed overflow
                Overflow = (A[N-1] ^ B[N-1]) &
                           (Y[N-1] ^ A[N-1]);
            end

            // AND
            4'b0010: begin
                Y = A & B;
            end

            // OR
            4'b0011: begin
                Y = A | B;
            end

            // XOR
            4'b0100: begin
                Y = A ^ B;
            end

            // NOT A
            4'b0101: begin
                Y = ~A;
            end

            // LEFT SHIFT
            4'b0110: begin
                Y = A << 1;
                Carry = A[N-1];
            end

            // RIGHT SHIFT
            4'b0111: begin
                Y = A >> 1;
                Carry = A[0];
            end

            // EQUAL
            4'b1000: begin
                if (A == B)
                    Y = {{(N-1){1'b0}}, 1'b1};
                else
                    Y = {N{1'b0}};
            end

            // Default
            default: begin
                Y = {N{1'b0}};
            end

        endcase

        // Common flags
        if (Y == {N{1'b0}})
            Zero = 1'b1;
        else
            Zero = 1'b0;

        Negative = Y[N-1];

    end

endmodule
