module FullAdder(
	input a,     // Entrada a
	input b,     // Entrada b
	input cin,   // Carry in

	output s,    // Soma
	output cout  // Carry out
);

	// Fios intermediários
	wire w1, w2, w3;

	// XOR para calcular a XOR entre a e b
	xor u0 (w1, a, b);

	// XOR para calcular a soma final (sum)
	xor u1 (s, w1, cin);

	// AND para calcular a parte do carry out envolvendo cin e XOR de a e b
	and u2 (w2, cin, w1);

	// AND para calcular a parte do carry out envolvendo a e b
	and u3 (w3, a, b);

	// OR para calcular o carry out final
	or u4 (cout, w2, w3);

endmodule
