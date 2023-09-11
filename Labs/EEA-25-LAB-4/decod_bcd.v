module decod_bcd (
    input [3:0] bcd_in,
    output reg [6:0] seven_segment_out
);
    always @* begin
        case (bcd_in)
            4'b0000: seven_segment_out = 7'b0000001; // Display '0'
            4'b0001: seven_segment_out = 7'b0100111; // Display '1'
            4'b0010: seven_segment_out = 7'b0010010; // Display '2'
            4'b0011: seven_segment_out = 7'b0010000; // Display '3'
            4'b0100: seven_segment_out = 7'b0100100; // Display '4'
            4'b0101: seven_segment_out = 7'b0001000; // Display '5'
            4'b0110: seven_segment_out = 7'b0000000; // Display '6'
            4'b0111: seven_segment_out = 7'b0100111; // Display '7'
            4'b1000: seven_segment_out = 7'b0000000; // Display '8'
            4'b1001: seven_segment_out = 7'b0000100; // Display '9'
            default: seven_segment_out = 7'b1111111; // Blank or error
        endcase
    end
endmodule
