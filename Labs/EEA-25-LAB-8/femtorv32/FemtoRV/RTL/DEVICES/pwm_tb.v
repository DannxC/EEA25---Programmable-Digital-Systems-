`include "pwm.v"

`timescale 1ns / 1ps

module pwm_tb();

    parameter WIDTH = 12;

    reg clk;
    reg wstrb;
    reg sel;
    reg [31:0] wdata;
    wire led;

    pwm #(.WIDTH(WIDTH)) uut (
        .clk(clk),
        .wstrb(wstrb),
        .sel(sel),
        .wdata(wdata),
        .led(led)
    );

    // Dump variables for GTKWave
    initial begin
        $dumpfile("pwm_tb.vcd");
        $dumpvars(0, pwm_tb, uut);
    end

    // Monitor output
    initial begin
        $monitor($time, " clk = %b, wstrb = %b, sel = %b, wdata = %b, led = %b", clk, wstrb, sel, wdata, led);
    end

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test procedure
    initial begin
        // Initialize inputs
        wstrb = 0;
        sel = 0;
        wdata = 0;

        // Wait for a few clock cycles
        #(3 * 10);

        // Test 1: Set a 50% duty cycle
        wstrb = 1; sel = 1; wdata = (1 << WIDTH) / 2; #(3 * 10);
        wstrb = 0; sel = 0; #(10); // Reset signals

        // Test 2: Change to 25% duty cycle
        wstrb = 1; sel = 1; wdata = (1 << WIDTH) / 4; #(3 * 10);
        wstrb = 0; sel = 0; #(10); // Reset signals

        // Test 3: sel low, change in wdata should be ignored
        wstrb = 1; sel = 0; wdata = (1 << WIDTH) - 1; #(3 * 10);
        wstrb = 0; sel = 0; #(10); // Reset signals

        // Test 4: Full duty cycle (100%)
        wstrb = 1; sel = 1; wdata = (1 << WIDTH) - 1; #(3 * 10);
        wstrb = 0; sel = 0; #(10); // Reset signals

        // Test 5: Minimal duty cycle (near 0%)
        wstrb = 1; sel = 1; wdata = 1; #(3 * 10);
        wstrb = 0; sel = 0; #(10); // Reset signals

        // Test 6: Rapid change in duty cycle
        wstrb = 1; sel = 1; wdata = (1 << WIDTH) / 2; #(3 * 5);
        wdata = (1 << WIDTH) / 4; #(3 * 5);
        wdata = (1 << WIDTH) / 8; #(3 * 5);
        wstrb = 0; sel = 0; #(10); // Reset signals

        // Test 7: No write strobe (wstrb low)
        wstrb = 0; sel = 1; wdata = (1 << WIDTH) / 2; #(3 * 10);
        wstrb = 0; sel = 0; #(10); // Reset signals

        // Finish simulation
        $finish;
    end


endmodule
