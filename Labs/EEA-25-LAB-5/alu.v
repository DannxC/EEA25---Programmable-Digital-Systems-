`include "extended_multi_input_mux.v"

module alu (
    input [3:0] src_a,       // 4-bit operand A
    input [3:0] src_b,       // 4-bit operand B
    input [2:0] operation,   // 3-bit operation selector
    output [3:0] alu_result, // 4-bit result
    output reg zero_flag     // single-bit zero flag
);

    reg [3:0] w0, w1, w2, w3, w4, w5, w6, w7;

    // Generate ALU operations
    always @(*) begin
        w0 = src_a & src_b;  // AND operation
        w1 = src_a | src_b;  // OR operation
        w2 = src_a + src_b;  // Addition
        w3 = src_a << 1;     // Left Shift
        w4 = src_a - src_b;  // Subtraction
        w5 = src_a >> 1;     // Right Shift
        w6 = ~src_b;         // NOT operation on B (AltB)
        w7 = src_a ^ src_b;  // XOR operation
    end

    // Instantiate the multiplexer
    extended_multi_input_mux mux_inst (
        .i0(w0), .i1(w1), .i2(w2), .i3(w3),
        .i4(w4), .i5(w5), .i6(w6), .i7(w7),
        .s(operation),
        .y(alu_result)
    );

    // Update zero flag
    always @(*) begin
        zero_flag = (alu_result == 4'b0000) ? 1'b1 : 1'b0;
    end

endmodule
