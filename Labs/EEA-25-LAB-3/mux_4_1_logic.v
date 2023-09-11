module mux_4_1_logic(
  // Inputs
  input EN,
  input [3:0] IN,
  input [1:0] S,
  // Outputs
  output Y
);
  
  assign Y = EN ? (S == 2'b00 ? IN[0] : 
                   S == 2'b01 ? IN[1] :
                   S == 2'b10 ? IN[2] : IN[3]) : 1'b0;
endmodule
