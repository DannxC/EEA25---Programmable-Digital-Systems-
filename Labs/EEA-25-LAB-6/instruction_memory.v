module instruction_memory(
    input [31:0] A,
    output reg [31:0] RD
);
    reg [31:0] instructions[255:0];

    always @(*) begin
        RD = instructions[A >> 2]; // Converting byte address to word address
    end
endmodule
