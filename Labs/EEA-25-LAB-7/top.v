`include "riscvsingle.v"
`include "imem.v"
`include "dmem.v"

module top(
    input wire clk, reset,
    output wire [31:0] WriteData, DataAdr,
    output wire MemWrite
);

    wire [31:0] PC, Instr, ReadData;

    // instantiate processor and memories
    riscvsingle rvsingle(
        .clk(clk), .reset(reset), .PC(PC), .Instr(Instr), .MemWrite(MemWrite),
        .ALUResult(DataAdr), .WriteData(WriteData), .ReadData(ReadData)
    );

    // instantiate memories
    imem imem(.addr(PC), .rd(Instr));

    dmem dmem(
        .clk(clk), .we(MemWrite), .addr(DataAdr), .wd(WriteData), 
        .rd(ReadData)
    );

endmodule
