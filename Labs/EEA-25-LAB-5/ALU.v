// O HDL representa uma Unidade Lógica Aritmética (ALU) 
// de 4 bits com 4 entradas (i0, i1, i2, i3) e uma saída 
// de 4 bits (y). O seletor de 2 bits (s) determina qual 
// entrada é direcionada para a saída.

// O circuito atual é mais complexo e agrega vários conceitos 
// dos laboratórios anteriores. Enquanto os laboratórios 
// anteriores focaram em blocos mais simples, como comparadores 
// e multiplexadores, este laboratório envolve uma ALU 
// com múltiplas entradas e operações.

module ALU (
    // Inputs
    input [3:0] i0, i1, i2, i3,
    input [1:0] s,
    // Outputs
    output [3:0] y
);

    assign y[3] = (i0[3] & ~s[0] & ~s[1])   | 
                (i1[3] &  s[0] & ~s[1])   | 
                (i2[3] & ~s[0] &  s[1])   | 
                (i3[3] &  s[0] &  s[1]);
    
    assign y[2] = (i0[2] & ~s[0] & ~s[1])   | 
                (i1[2] &  s[0] & ~s[1])   | 
                (i2[2] & ~s[0] &  s[1])   | 
                (i3[2] &  s[0] &  s[1]);

    assign y[1] = (i0[1] & ~s[0] & ~s[1])   | 
                (i1[1] &  s[0] & ~s[1])   | 
                (i2[1] & ~s[0] &  s[1])   | 
                (i3[1] &  s[0] &  s[1]);

    assign y[0] = (i0[0] & ~s[0] & ~s[1])   | 
                (i1[0] &  s[0] & ~s[1])   | 
                (i2[0] & ~s[0] &  s[1])   | 
                (i3[0] &  s[0] &  s[1]);
             
endmodule
