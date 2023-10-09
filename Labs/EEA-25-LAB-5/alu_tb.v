`include "alu.v"

`timescale 1ns / 1ps

module alu_tb();

    parameter DATA_WIDTH = 4;
    parameter OPCODE_LENGTH = 3;

    reg [DATA_WIDTH - 1:0] A;
    reg [DATA_WIDTH - 1:0] B;
    reg [OPCODE_LENGTH - 1:0] OP;
    
    wire [DATA_WIDTH - 1:0] A_wire = A;
    wire [DATA_WIDTH - 1:0] B_wire = B;

    wire [DATA_WIDTH - 1:0] RESULT;
    wire F_ZERO;

    alu uut (
        .src_a(A),
        .src_b(B),
        .operation(OP),
        .alu_result(RESULT),
        .zero_flag(F_ZERO)
    );

    // Dump variables
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb, uut);
    end

    // Monitor output
    initial begin
        $monitor($time, " A = %b, B = %b, OP = %b, RESULT = %b, F_ZERO = %b", A_wire, B_wire, OP, RESULT, F_ZERO);
    end

    // Test procedure
    initial begin
        // Test case 1: OP = 000 (AND)
        A = 4'b0001; B = 4'b0010; OP = 3'b000; #10;

        // Test case 2: OP = 001 (OR)
        A = 4'b0010; B = 4'b0011; OP = 3'b001; #10;

        // Test case 3: OP = 010 (SUM)
        A = 4'b0001; B = 4'b0011; OP = 3'b010; #10;

        // Test case 4: OP = 011 (<<)
        A = 4'b0010; B = 4'b0001; OP = 3'b011; #10;

        // Test case 5: OP = 100 (Subtraction)
        A = 4'b0100; B = 4'b0010; OP = 3'b100; #10;

        // Test case 6: OP = 101 (>>)
        A = 4'b1000; B = 4'b0001; OP = 3'b101; #10;

        // Test case 7: OP = 110 (AltB)
        A = 4'b0101; B = 4'b1010; OP = 3'b110; #10;

        // Test case 8: OP = 111 (XOR)
        A = 4'b0101; B = 4'b0110; OP = 3'b111; #10;

        $finish;
    end

endmodule
