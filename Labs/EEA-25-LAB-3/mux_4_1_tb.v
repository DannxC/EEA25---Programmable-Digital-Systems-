`include "mux_4_1_logic.v"
`timescale 1ns/1ps

module mux_4_1_tb;

  // Inputs
  reg [3:0] IN;  // 4-bit input
  reg [1:0] S;   // 2-bit selector
  reg EN;        // Enable signal

  // Outputs
  wire Y;

  mux_4_1_logic uut (EN, IN, S, Y);

  initial begin
    $dumpfile("mux_4_1_tb.vcd");
    $dumpvars(0, mux_4_1_tb);
  end

  // Monitor the variables
  initial $monitor($time, " EN = %b, IN = %b, S = %b, Y = %b", EN, IN, S, Y);

  initial begin
    // Test with EN = 0
    EN = 0; IN = 4'b0000; S = 2'b00; #10;
    
    // Test with EN = 1 and varying IN and S
    EN = 1; IN = 4'b1010; S = 2'b00; #10;
    EN = 1; IN = 4'b0101; S = 2'b01; #10;
    EN = 1; IN = 4'b0011; S = 2'b10; #10;
    EN = 1; IN = 4'b1100; S = 2'b11; #10;
    EN = 1; IN = 4'b1001; S = 2'b00; #10;
    EN = 1; IN = 4'b0110; S = 2'b01; #10;
    EN = 1; IN = 4'b0001; S = 2'b10; #10;
    EN = 1; IN = 4'b1110; S = 2'b11; #10;
  end
endmodule
