/* 
 * Do not edit this file, it was generated by gen_pll.sh
 * 
 *   FPGA kind      : ICE40
 *   Input frequency: 48 MHz
 */

 module femtoPLL #(
    parameter freq = 40
 ) (
    input wire pclk,
    output wire clk
 );
   SB_PLL40_CORE pll (
      .REFERENCECLK(pclk),
      .PLLOUTCORE(clk),
      .RESETB(1'b1),
      .BYPASS(1'b0)
   );
   defparam pll.FEEDBACK_PATH="SIMPLE";
   defparam pll.PLLOUT_SELECT="GENCLK";
   generate
     case(freq)
     16: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0111111;
      defparam pll.DIVQ = 3'b110;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     20: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0100111;
      defparam pll.DIVQ = 3'b101;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     24: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0001111;
      defparam pll.DIVQ = 3'b101;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     25: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0110001;
      defparam pll.DIVQ = 3'b101;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     30: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0010011;
      defparam pll.DIVQ = 3'b101;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     35: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0100010;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     40: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0100111;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     45: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0001110;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     48: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0001111;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     50: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0110001;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     55: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0110110;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     60: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0010011;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     65: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b1000000;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     66: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0010101;
      defparam pll.DIVQ = 3'b100;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     70: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0100010;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     75: begin
      defparam pll.DIVR = 4'b0001;
      defparam pll.DIVF = 7'b0011000;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b010;
     end
     80: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0100111;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     85: begin
      defparam pll.DIVR = 4'b0011;
      defparam pll.DIVF = 7'b0111000;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     90: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0001110;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     95: begin
      defparam pll.DIVR = 4'b0011;
      defparam pll.DIVF = 7'b0111110;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     100: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0110001;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     105: begin
      defparam pll.DIVR = 4'b0001;
      defparam pll.DIVF = 7'b0100010;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b010;
     end
     110: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0110110;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     115: begin
      defparam pll.DIVR = 4'b0011;
      defparam pll.DIVF = 7'b1001100;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     120: begin
      defparam pll.DIVR = 4'b0000;
      defparam pll.DIVF = 7'b0010011;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b100;
     end
     125: begin
      defparam pll.DIVR = 4'b0011;
      defparam pll.DIVF = 7'b1010010;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     130: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b1000000;
      defparam pll.DIVQ = 3'b011;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     135: begin
      defparam pll.DIVR = 4'b0011;
      defparam pll.DIVF = 7'b0101100;
      defparam pll.DIVQ = 3'b010;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     140: begin
      defparam pll.DIVR = 4'b0010;
      defparam pll.DIVF = 7'b0100010;
      defparam pll.DIVQ = 3'b010;
      defparam pll.FILTER_RANGE = 3'b001;
     end
     default: UNKNOWN_FREQUENCY unknown_frequency();
     endcase
  endgenerate   

endmodule  
