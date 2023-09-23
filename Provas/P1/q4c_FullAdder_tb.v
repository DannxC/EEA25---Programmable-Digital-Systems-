`include "q4b_FullAdder.v"
`timescale 1ns/1ps

module FullAdder_tb;

	// Entradas
	reg a;
	reg b;
	reg cin;

	// Saídas
	wire s;
	wire cout;

	// Instanciar o módulo FullAdder
	FullAdder uut (
		.a(a),
		.b(b),
		.cin(cin),
		.s(s),
		.cout(cout)
	);

	initial begin
		$dumpfile("q4c_FullAdder_tb.vcd");
		$dumpvars(0, FullAdder_tb);
	end

	// Monitorar as variáveis
	initial $monitor($time, " a = %b, b = %b, cin = %b, s = %b, cout = %b", a, b, cin, s, cout);

	// Testes
	initial begin
		// Testar todas as combinações possíveis de a, b e cin
        {cin, b, a} = 3'b000; #10;
        {cin, b, a} = 3'b001; #10;
        {cin, b, a} = 3'b010; #10;
        {cin, b, a} = 3'b011; #10;
        {cin, b, a} = 3'b100; #10;
        {cin, b, a} = 3'b101; #10;
        {cin, b, a} = 3'b110; #10;
        {cin, b, a} = 3'b111; #10;
		$finish;
	end
    
endmodule
