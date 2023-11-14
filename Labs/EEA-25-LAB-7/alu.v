module alu (
    input wire [31:0] src_a,       // 32-bit operand A
    input wire [31:0] src_b,       // 32-bit operand B
    input wire [2:0] ALUControl,   // 3-bit operation selector
    output reg [31:0] alu_result,  // 32-bit result
    output wire zero_flag          // single-bit zero flag
);

    always @(*) begin
        case(ALUControl)
            3'b000: alu_result = src_a + src_b;  // Addition
            3'b001: alu_result = src_a - src_b;  // Subtraction
            3'b010: alu_result = src_a & src_b;  // AND
            3'b011: alu_result = src_a | src_b;  // OR
            3'b101: alu_result = (src_a < src_b) ? 1 : 0; // SLT (signed)
            default: alu_result = 32'bx; // Undefined operation
        endcase
    end

    // Zero flag is set if the result is 0
    assign zero_flag = (alu_result == 0);

endmodule
