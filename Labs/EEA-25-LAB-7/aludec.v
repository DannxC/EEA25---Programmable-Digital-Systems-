module aludec(
    input wire opb5,
    input wire [2:0] funct3,
    input wire funct7b5,
    input wire [1:0] ALUOp,
    output reg [2:0] ALUControl
);
    wire RtypeSub;
    assign RtypeSub = funct7b5 & opb5; // TRUE for R–type subtract

    always @(*) begin
        case(ALUOp)
            2'b00: ALUControl = 3'b000; // addition
            2'b01: ALUControl = 3'b001; // subtraction
            default: 
                case(funct3) // R–type or I–type ALU
                    3'b000: ALUControl = (RtypeSub) ? 3'b001 : 3'b000; // sub, add/addi
                    3'b010: ALUControl = 3'b101; // slt, slti
                    3'b110: ALUControl = 3'b011; // or, ori
                    3'b111: ALUControl = 3'b010; // and, andi
                    default: ALUControl = 3'bxxx; // ???
                endcase
        endcase
    end
endmodule
