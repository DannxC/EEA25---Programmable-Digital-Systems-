`include "frequency_divider.v"
`include "decod_bcd.v"

module top_level (
    input clk,
    input rst,
    output [6:0] seven_segment_out
);

    wire [3:0] frequency_divided_count;
  
    // Instance of frequency divider
    frequency_divider freq_div_inst (
        .clk(clk),
        .rst_btn(rst),
        .out_clk(frequency_divided_count)
    );

    // Instance of BCD to 7-segment decoder
    decod_bcd u2 (
        .bcd_in(frequency_divided_count),
        .seven_segment_out(seven_segment_out)
    );

endmodule
