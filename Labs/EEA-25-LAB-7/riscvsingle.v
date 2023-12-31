`include "controller.v"
`include "datapath.v"

module riscvsingle(
    input wire clk, reset,
    output wire [31:0] PC,
    input wire [31:0] Instr,
    output wire MemWrite,
    output wire [31:0] ALUResult, WriteData,
    input wire [31:0] ReadData
);
    
    wire Zero;
    wire ALUSrc, RegWrite, Jump;
    wire [1:0] ResultSrc, ImmSrc;
    wire [2:0] ALUControl;

    controller c(
        .op(Instr[6:0]), .funct3(Instr[14:12]), .funct7b5(Instr[30]), .Zero(Zero),
        .ResultSrc(ResultSrc), .MemWrite(MemWrite), .PCSrc(PCSrc),
        .ALUSrc(ALUSrc), .RegWrite(RegWrite), .Jump(Jump),
        .ImmSrc(ImmSrc), .ALUControl(ALUControl)
    );

    datapath dp(
        .clk(clk), .reset(reset), .ResultSrc(ResultSrc), .PCSrc(PCSrc),
        .ALUSrc(ALUSrc), .RegWrite(RegWrite),
        .ImmSrc(ImmSrc), .ALUControl(ALUControl),
        .Zero(Zero), .PC(PC), .Instr(Instr),
        .ALUResult(ALUResult), .WriteData(WriteData), .ReadData(ReadData)
    );

endmodule
