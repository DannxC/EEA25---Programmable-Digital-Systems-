module AlarmSystem(
    input S0,
    input S1,
    input S2,
    output A
);

  wire and1, and2, and3;

  // AND gates
  and(and1, S0, S1);
  and(and2, S1, S2);
  and(and3, S0, S2);

  // OR gate
  or(A, and1, and2, and3);

endmodule
