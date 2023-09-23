// Módulo do D-flip-flop
module d_flip_flop (
    output reg Q, Qn,
    input wire Clock, Reset, D
);
    always @(posedge Clock or negedge Reset) begin
        if (!Reset) begin
            Q <= 1'b0;
            Qn <= 1'b0;
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
    wire d2, d4, d8, d16;  // Sinais intermediários para o Ripple Counter
    wire q2, q4, q8, q16;  // Saídas dos flip-flops

    // Instanciando D-flip-flops para o Ripple Counter
    d_flip_flop ff1 (.Q(q2), .Qn(d2), .Clock(Clock_in), .Reset(Reset), .D(d2));
    d_flip_flop ff2 (.Q(q4), .Qn(d4), .Clock(q2), .Reset(Reset), .D(d4));
    d_flip_flop ff3 (.Q(q8), .Qn(d8), .Clock(q4), .Reset(Reset), .D(d8));
    d_flip_flop ff4 (.Q(q16), .Qn(d16), .Clock(q8), .Reset(Reset), .D(d16));

    // Instanciando o Multiplexador
    assign Clock_out = (Sel == 2'b00) ? q2 : 
                       (Sel == 2'b01) ? q4 : 
                       (Sel == 2'b10) ? q8 : q16;
endmodule
