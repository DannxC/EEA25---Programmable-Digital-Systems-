module PatrolSystem(
    input S0,
    input S1,
    input S2,
    output P
);

  wire and1, and2, and3;
  wire notS0, notS1, notS2;

  // NOT gates
  not(notS0, S0);
  not(notS1, S1);
  not(notS2, S2);

  // AND gates
  and(and1, notS0, notS1, S2);
  and(and2, notS0, S1, notS2);
  and(and3, S0, notS1, notS2);

  // OR gate
  or(P, and1, and2, and3);

endmodule
