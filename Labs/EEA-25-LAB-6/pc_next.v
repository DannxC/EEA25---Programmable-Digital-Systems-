module pc_next(
    input [31:0] PC,
    output [31:0] PCNext
);
    assign PCNext = PC + 4;
endmodule
