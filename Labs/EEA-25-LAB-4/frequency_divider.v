module frequency_divider (
    // Inputs
    input clk,
    input rst_btn,

    // Outputs
    output reg [3:0] out_clk
);

    wire rst;
    reg [31:0] count;
    localparam [31:0] max_count = (1) - 1;

    // EXERCISE 3
    // To convert a 12 MHz (12,000,000 Hz) clock signal to a 1 Hz signal, 
    // you would need to count up to 12,000,000. In your Verilog code, 
    // you could initialize the max_count to 11,999,999 (12,000,000 - 1) 
    // because you'll start counting from zero.
    //
    // localparam [31:0] max_count = (12_000_000) - 1;

    // Reset is the inverse of the reset button
    assign rst = ~rst_btn;

    // Clock divider
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out_clk <= 4'b0;
            count <= 32'b0;
        end else if (count == max_count) begin
            count <= 32'b0;
            out_clk <= out_clk + 1'b1;
        end else begin
            count <= count + 1;
        end
    end

endmodule