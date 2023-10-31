module register_file(
    input [4:0] rg_A1,
    input [4:0] rg_A2,
    input [4:0] rg_A3,
    input [31:0] rg_WD3,
    output reg [31:0] rg_RD1,
    output reg [31:0] rg_RD2,
    input rg_WE3,
    input clock,
    input reset
);
    reg [31:0] registers[31:0]; // 32 registers each of 32 bits
    integer i;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            for(i = 0; i < 32; i = i + 1) begin
                registers[i] = i;
            end
        end else if (rg_WE3 && rg_A3 != 5'b00000) begin // Prevent writing to x0
            registers[rg_A3] = rg_WD3;
        end
    end

    always @(*) begin
        rg_RD1 = registers[rg_A1];
        rg_RD2 = registers[rg_A2];
    end
endmodule
