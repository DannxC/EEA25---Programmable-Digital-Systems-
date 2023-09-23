`include "q3c_SimplifiedCircuit.v"
`timescale 1ns/1ps

module SimplifiedCircuit_tb;

  // Inputs
  reg X1, X2, X3, X4;

  // Outputs
  wire S;

  SimplifiedCircuit uut (
      .X1(X1),
      .X2(X2),
      .X3(X3),
      .X4(X4),
      .S(S)
  );

  initial begin
    $dumpfile("q3d_SimplifiedCircuit_tb.vcd");
    $dumpvars(0, SimplifiedCircuit_tb);
  end

  // Monitor the variables
  initial $monitor($time, " X1 = %b, X2 = %b, X3 = %b, X4 = %b, S = %b", X1, X2, X3, X4, S);

  initial begin
      // Testa todas as combinações
      {X4, X3, X2, X1} = 4'b0000; #10;
      {X4, X3, X2, X1} = 4'b0001; #10;
      {X4, X3, X2, X1} = 4'b0010; #10;
      {X4, X3, X2, X1} = 4'b0011; #10;
      {X4, X3, X2, X1} = 4'b0100; #10;
      {X4, X3, X2, X1} = 4'b0101; #10;
      {X4, X3, X2, X1} = 4'b0110; #10;
      {X4, X3, X2, X1} = 4'b0111; #10;
      {X4, X3, X2, X1} = 4'b1000; #10;
      {X4, X3, X2, X1} = 4'b1001; #10;
      {X4, X3, X2, X1} = 4'b1010; #10;
      {X4, X3, X2, X1} = 4'b1011; #10;
      {X4, X3, X2, X1} = 4'b1100; #10;
      {X4, X3, X2, X1} = 4'b1101; #10;
      {X4, X3, X2, X1} = 4'b1110; #10;
      {X4, X3, X2, X1} = 4'b1111; #10;
    $finish;
  end

endmodule
