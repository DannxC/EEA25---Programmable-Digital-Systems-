`include "multi_input_mux.v"
`timescale 1ns / 1ps

module multi_input_mux_tb;
    // Declare internal signals
    reg [3:0] i0, i1, i2, i3;
    reg [1:0] s;
    wire [3:0] y;

    // Instantiate the multi_input_mux module
    multi_input_mux uut (
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .s(s),
        .y(y)
    );

    // Dump variables
    initial begin
        $dumpfile("multi_input_mux_tb.vcd");
        $dumpvars(0, multi_input_mux_tb, uut);  // Dump all variables at this hierarchy
    end

    // Monitor output
    initial begin
        $monitor($time, " s = %b, y = %b", s, y);
    end

    // Test procedure
    initial begin
        // Initialize inputs
        i0 = 4'b0001; i1 = 4'b0010; i2 = 4'b0100; i3 = 4'b1000;
        s = 2'b00; #10;
        s = 2'b01; #10;
        s = 2'b10; #10;
        s = 2'b11; #10;
        $finish;
    end

endmodule
