module dmem(
    input wire clk, we,
    input wire [31:0] addr, wd,
    output wire [31:0] rd
);

    reg [31:0] RAM[63:0];
    assign rd = RAM[addr[31:2]]; // word aligned

    always @(posedge clk) begin
        if (we) RAM[addr[31:2]] <= wd;
    end

endmodule
