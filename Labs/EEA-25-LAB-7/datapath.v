`include "flopr.v"
`include "adder.v"

`include "regfile.v"
`include "extend.v"

`include "mux2.v"
`include "alu.v"
`include "mux3.v"

module datapath(
    input wire clk, reset,
    input wire [1:0] ResultSrc,
    input wire PCSrc, ALUSrc,
    input wire RegWrite,
    input wire [1:0] ImmSrc,
    input wire [2:0] ALUControl,
    output wire Zero,
    output wire [31:0] PC,
    input wire [31:0] Instr,
    output wire [31:0] ALUResult, WriteData,
    input wire [31:0] ReadData
);

    wire [31:0] PCNext, PCPlus4, PCTarget;
    wire [31:0] ImmExt;
    wire [31:0] SrcA, SrcB;
    wire [31:0] Result;

    // next PC logic
    // Supondo que flopr, adder, mux2, regfile, extend, alu, e mux3 são módulos compatíveis com Verilog-2005
    flopr #(32) pcreg(      // ok
        .clk(clk), .reset(reset), .d(PCNext), .q(PC)
    );
    
    adder pcadd4(           // ok
        .a(PC), .b(32'd4), .result(PCPlus4)
    );

    adder pcaddbranch(      // ok
        .a(PC), .b(ImmExt), .result(PCTarget)
    );

    mux2 #(32) pcmux(       // ok
        .d0(PCPlus4), .d1(PCTarget), .s(PCSrc), .y(PCNext)
    );


    // register file logic
    regfile rf(             // ok
        .clk(clk), .we3(RegWrite), .ra1(Instr[19:15]), .ra2(Instr[24:20]), 
        .wa3(Instr[11:7]), .wd3(Result), .rd1(SrcA), .rd2(WriteData)
    );

    extend ext(             // ok
        .instr(Instr[31:7]), .immsrc(ImmSrc), .immext(ImmExt)
    );


    // ALU logic
    mux2 #(32) srcbmux(     // ok
        .d0(WriteData), .d1(ImmExt), .s(ALUSrc), .y(SrcB)
    );

    alu alu(                // ok
        .src_a(SrcA), .src_b(SrcB), .ALUControl(ALUControl), .alu_result(ALUResult), .zero_flag(Zero)
    );

    mux3 #(32) resultmux(   // ok
        .d0(ALUResult), .d1(ReadData), .d2(PCPlus4), .s(ResultSrc), .y(Result)
    );

endmodule
