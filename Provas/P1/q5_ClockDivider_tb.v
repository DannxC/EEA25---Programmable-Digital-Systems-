`include "q5_ClockDivider.v"
`timescale 1ns/1ps

module ClockDivider_tb;

    // Entradas
    reg Clock_in;
    reg Reset;
    reg [1:0] Sel;

    // Saídas
    wire Clock_out;

    // Instanciar o módulo ClockDivider
    ClockDivider uut (
        .Clock_in(Clock_in),
        .Reset(Reset),
        .Sel(Sel),
        .Clock_out(Clock_out)
    );

    initial begin
        $dumpfile("q5_ClockDivider_tb.vcd");
        $dumpvars(0, ClockDivider_tb);
    end

    // Monitorar as variáveis
    initial $monitor($time, 
                    " Clock_in = %b, Reset = %b, Sel = %b, Clock_out = %b", 
                    Clock_in, Reset, Sel, Clock_out);

    // Gerar Clock
    initial forever #5 Clock_in = ~Clock_in;

    // Testes
    initial begin
        Reset = 1'b0;  // Ativar o Reset (nível baixo)
        Sel = 2'b00;
        Clock_in = 1'b0;  // Inicializar o Clock

        #10 Reset = 1'b1;  // Liberar o Reset (nível alto)

        // Testar diferentes seleções e esperar 16 ciclos de clock para cada um
        #20 Sel = 2'b01; #160;
        #20 Sel = 2'b10; #160;
        #20 Sel = 2'b11; #160;

        // Reativar o Reset
        #20 Reset = 1'b0;  // Ativar o Reset novamente (nível baixo)

        // Finalizar a simulação
        #10 $finish;
    end
    
endmodule
