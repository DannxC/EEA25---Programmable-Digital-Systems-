// Módulo do D-flip-flop
module d_flip_flop (
    output reg Q, Qn,
    input wire Clock, Reset, D
);

    // Inicialização dos estados dos flip-flops
    initial begin
        Q = 1'b0;
        Qn = 1'b1;
    end

    always @(posedge Clock or negedge Reset) begin
        if (!Reset) begin
            Q <= 1'b0;
            Qn <= 1'b1;
        end else begin
            Q <= D;
            Qn <= ~D;
        end
    end
endmodule


// Módulo do Divisor de Clock Programável
module ClockDivider (
    output wire Clock_out,
    input wire Clock_in,
    input wire Reset,
    input wire [1:0] Sel
);
    wire d2, d4, d8, d16;       // Saídas dos flip-flops
    wire d2n, d4n, d8n, d16n;   // Saídas Inversas dos flip-flops

    // Instanciando D-flip-flops para o Ripple Counter
    d_flip_flop ff1 (.Q(d2), .Qn(d2n), .Clock(Clock_in), .Reset(Reset), .D(d2n));
    d_flip_flop ff2 (.Q(d4), .Qn(d4n), .Clock(d2n), .Reset(Reset), .D(d4n));
    d_flip_flop ff3 (.Q(d8), .Qn(d8n), .Clock(d4n), .Reset(Reset), .D(d8n));
    d_flip_flop ff4 (.Q(d16), .Qn(d16n), .Clock(d8n), .Reset(Reset), .D(d16n));


    // Instanciando o Multiplexador
    assign Clock_out = (Sel == 2'b00) ? d2 : 
                       (Sel == 2'b01) ? d4 : 
                       (Sel == 2'b10) ? d8 : d16;
endmodule
