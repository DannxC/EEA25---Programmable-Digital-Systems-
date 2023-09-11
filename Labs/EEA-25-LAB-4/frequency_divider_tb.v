`timescale 10ns/1ps
`include "frequency_divider.v"

module frequency_divider_tb;

    output reg clk, rst;
    input wire [3:0] out_clk;

    frequency_divider uut (
        .clk(clk),
        .rst_btn(rst),
        .out_clk(out_clk)
    );

    initial begin
        clk = 1'b0;
    end

    always #1 clk = ~clk;

    initial begin
        $monitor($time, "clk = %b, rst = %b, out_clk = %b", clk, rst, out_clk);

        rst = 0;
        #1 rst = 1;
        #31 $finish;
    end

    initial begin
        $dumpfile("frequency_divider_tb.vcd");
        $dumpvars(0, frequency_divider_tb);
    end

endmodule
