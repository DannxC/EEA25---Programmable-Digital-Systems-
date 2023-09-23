module SimplifiedCircuit(
    input X1,
    input X2,
    input X3,
    input X4,
    output S
);

  wire and1, and2, and3, and4;
  wire notX1, notX2, notX3, notX4;

  // NOT
  not(notX1, X1);
  not(notX2, X2);
  not(notX3, X3);
  not(notX4, X4);

  // AND
  and(and1, notX4, notX1);
  and(and2, notX4, X3, notX2);
  and(and3, notX3, X2, notX1);
  and(and4, X4, notX3, notX2, X1);

  // OR
  or(S, and1, and2, and3, and4);

endmodule
