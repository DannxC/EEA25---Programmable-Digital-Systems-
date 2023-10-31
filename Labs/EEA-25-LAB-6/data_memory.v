module data_memory(
    input clock,
    input WE,
    input [31:0] A,
    input [31:0] WD,
    output reg [31:0] RD
);
    reg [31:0] memory[255:0];

    always @(posedge clock) begin
        if (WE) begin
            memory[A >> 2] = WD; // Converting byte address to word address
        end
        RD = memory[A >> 2]; // Converting byte address to word address
    end
endmodule
