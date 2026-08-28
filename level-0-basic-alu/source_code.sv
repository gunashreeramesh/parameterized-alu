module parameterized_alu #(
    parameter N = 8,
    parameter M = 4
)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    input  [M-1:0] op,
    output reg [N-1:0] Y
);

    always @(*) begin

        case (op)

            4'b0000: Y = A + B;                  // Addition
            4'b0001: Y = A - B;                  // Subtraction
            4'b0010: Y = A & B;                  // AND
            4'b0011: Y = A | B;                  // OR
            4'b0100: Y = A ^ B;                  // XOR
            4'b0101: Y = ~A;                     // NOT A
            4'b0110: Y = A << 1;                 // Left Shift
            4'b0111: Y = A >> 1;                 // Right Shift
            4'b1000: Y = (A == B) ? 8'b00000001 : 8'b00000000; // Equal
            4'b1001: Y = (A > B)  ? 8'b00000001 : 8'b00000000; // Greater Than
            4'b1010: Y = (A < B)  ? 8'b00000001 : 8'b00000000; // Less Than
            4'b1011: Y = ~(A & B);               // NAND
            4'b1100: Y = ~(A | B);               // NOR
            4'b1101: Y = ~(A ^ B);               // XNOR
            4'b1110: Y = {A[N-2:0], A[N-1]};    // Rotate Left
            4'b1111: Y = {A[0], A[N-1:1]};      // Rotate Right

            default: Y = {N{1'b0}};

        endcase

    end

endmodule
