`include "reg_file.v"
`include "pc_next.v"
`include "instruction_memory.v"
`include "data_memory.v"

module processor(
    input clock,
    input reset
);
    // Signal Declarations
    wire [31:0] PC, PCNext;
    wire [31:0] Instruction;
    wire [4:0] rg_A1, rg_A2, rg_A3;
    wire [31:0] rg_WD3, rg_RD1, rg_RD2;
    wire rg_WE3;
    wire [31:0] data_A, data_WD, data_RD;
    wire data_WE;

    // Instantiate PCNext module
    pc_next pc_next_inst(
        .PC(PC),
        .PCNext(PCNext)
    );

    // Instantiate Instruction Memory module
    instruction_memory inst_mem(
        .A(PC),
        .RD(Instruction)
    );

    // Instantiate Register File module
    reg_file reg_file_inst(
        .rg_A1(rg_A1),
        .rg_A2(rg_A2),
        .rg_A3(rg_A3),
        .rg_WD3(rg_WD3),
        .rg_RD1(rg_RD1),
        .rg_RD2(rg_RD2),
        .rg_WE3(rg_WE3),
        .clock(clock),
        .reset(reset)
    );

    // Instantiate Data Memory module
    data_memory data_mem(
        .clock(clock),
        .WE(data_WE),
        .A(data_A),
        .WD(data_WD),
        .RD(data_RD)
    );



    // Control Logic
    assign rg_A1 = Instruction[25:21];
    assign rg_A2 = Instruction[20:16];
    assign rg_A3 = Instruction[15:11];

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            PC <= 0;  // Reset Program Counter
            rg_WE3 <= 0;  // Disable writes to Register File
            data_WE <= 0; // Disable writes to Data Memory
        end else begin
            // Simple control logic for demonstration
            // You will replace this with your actual control logic
            PC <= PCNext;
            rg_WE3 <= 1;  // Enable writes to Register File for demo
            rg_WD3 <= rg_RD1 + rg_RD2;  // Simple add operation for demo
            data_WE <= 0; // Disable writes to Data Memory for demo
        end
    end

endmodule
