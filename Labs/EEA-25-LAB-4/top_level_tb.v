`include "top_level.v"

`timescale 1ns / 1ps

module top_level_tb;

    // Declare internal signals
    reg clk;
    reg rst;
    wire [6:0] seven_segment_out;
    wire [3:0] out_clk_internal;  // Internal wire to monitor out_clk[3:0]

    // Instantiate the top_level module
    top_level uut (
        .clk(clk),
        .rst(rst),
        .seven_segment_out(seven_segment_out)
    );

    // Use 'assign' to map the signals you want to monitor
    assign out_clk_internal = uut.frequency_divided_count;

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        // Initialize the reset signal
        rst = 0;

        // Wait for some time
        #10;

        // Assert the reset signal
        rst = 1;

        // Finish the simulation after a certain period
        #100 $finish;
    end

    // Dump variables
    initial begin
        $dumpfile("top_level_tb.vcd");
        $dumpvars(0, top_level_tb, uut);  // Dump all variables at this hierarchy
    end

    // Monitor output
    initial begin
        $monitor($time, " CLK = %b, RST = %b, out_clk[3:0] = %b, seven_segment_out[6:0] = %b",
                clk, rst, out_clk_internal, seven_segment_out);
    end

endmodule
