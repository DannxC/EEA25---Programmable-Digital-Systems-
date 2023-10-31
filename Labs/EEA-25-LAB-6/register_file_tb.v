`include "register_file.v"

module register_file_tb();

    // Declare internal signals
    reg [4:0] rg_A1, rg_A2, rg_A3;
    reg [31:0] rg_WD3;
    wire [31:0] rg_RD1, rg_RD2;
    reg rg_WE3;
    reg clock, reset;
    integer i;

    // Instantiate the register_file module
    register_file uut (
        .rg_A1(rg_A1),
        .rg_A2(rg_A2),
        .rg_A3(rg_A3),
        .rg_WD3(rg_WD3),
        .rg_RD1(rg_RD1),
        .rg_RD2(rg_RD2),
        .rg_WE3(rg_WE3),
        .clock(clock),
        .reset(reset)
    );

    // Dump variables
    initial begin
        $dumpfile("register_file_tb.vcd");
        $dumpvars(0, register_file_tb);
    end

    // Monitor output
    initial begin
        $monitor($time, " rg_A1 = %d, rg_A2 = %d, rg_A3 = %d, rg_WD3 = %d, rg_WE3 = %b, rg_RD1 = %d, rg_RD2 = %d",
                rg_A1, rg_A2, rg_A3, rg_WD3, rg_WE3, rg_RD1, rg_RD2);
    end


    // Initialize reset
    initial begin
        reset = 1;
        #15 reset = 0;
    end

    // Generate clock signal
    initial begin
        clock = 0;
        forever #20 clock = ~clock;
    end

    // Read the initial values from the 32 registers
    initial begin
        for (i = 0; i < 31; i = i + 2) begin
            rg_A1 = i;
            rg_A2 = i + 1;
            #20;
        end
    end

    // Write to the registers
    initial begin
        #340; // Add a delay before writing
        rg_WE3 = 1;
        for (i = 0; i < 32; i++) begin
            rg_A3 = i;
            rg_WD3 = i + 1000; // Some arbitrary values for testing
            #20;
        end
        rg_WE3 = 0;
    end

    // Read the values from the 32 registers after writing
    initial begin
        #1200; // Delay to start after the writing phase
        for (i = 0; i < 31; i = i + 2) begin
            rg_A1 = i;
            rg_A2 = i + 1;
            #20;
        end
    end

    // Finish the simulation
    initial begin
        #1800 $finish; // Extend the finish time to cover read after write
    end

endmodule
