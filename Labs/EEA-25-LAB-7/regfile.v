module regfile(
    input wire clk,
    input wire we3,
    input wire [4:0] ra1, ra2, wa3,  // Alterado para 4:0 para endereçar 32 registradores
    input wire [31:0] wd3,
    output wire [31:0] rd1, rd2
);

    reg [31:0] rf[31:0];
    // three ported register file
    // read two ports combinationally (A1/RD1, A2/RD2)
    // write third port on rising edge of clock (A3/WD3/WE3)
    // register 0 hardwired to 0

    always @(posedge clk) begin
        if (we3) rf[wa3] <= wd3;
    end

    assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
    assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
endmodule
