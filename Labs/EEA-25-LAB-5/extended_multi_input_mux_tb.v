`include "extended_multi_input_mux.v"
`timescale 1ns / 1ps

module extended_multi_input_mux_tb;
    // Declare internal signals
    reg [3:0] i0, i1, i2, i3, i4, i5, i6, i7;
    reg [2:0] s;
    wire [3:0] y;

    // Instantiate the extended_multi_input_mux module
    extended_multi_input_mux uut (
        .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7),
        .s(s),
        .y(y)
    );

    // Dump variables
    initial begin
        $dumpfile("extended_multi_input_mux_tb.vcd");
        $dumpvars(0, extended_multi_input_mux_tb, uut);  // Dump all variables at this hierarchy
    end

    // Monitor output
    initial begin
        $monitor($time, " s = %b, y = %b", s, y);
    end

    // Test procedure
    initial begin
        // Initialize inputs
        i0 = 4'b0001; i1 = 4'b0010; i2 = 4'b0100; i3 = 4'b1000;
        i4 = 4'b1100; i5 = 4'b1010; i6 = 4'b0110; i7 = 4'b1111;
        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;
        $finish;
    end

endmodule
