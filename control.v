`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2025 13:42:45
// Design Name: 
// Module Name: czdg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module control (
    input  wire [5:0] opcode,
    input  wire       nop,  // NEW: force NOP if hazard/stall detected

    output reg        RegDst,
    output reg        ALUSrc,
    output reg        MemToReg,
    output reg        RegWrite,
    output reg        MemRead,
    output reg        MemWrite,
    output reg        Branch,
    output reg [1:0]  ALUOp
);

    always @(*) begin
        if (nop) begin
            // Output all-zero control signals (NOP)
            {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} 
                = 11'b0;
        end else begin
            case (opcode)
                6'b000000: // R-type
                    {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} 
                        = {1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};

                6'b100011: // lw
                    {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} 
                        = {1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00};

                6'b101011: // sw
                    {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} 
                        = {1'bx, 1'b1, 1'bx, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00};

                6'b000100: // beq
                    {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} 
                        = {1'bx, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, 1'b1, 2'b01};

                6'b001000: // addi
                    {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} 
                        = {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00};

                default:
                    {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} 
                        = 11'b0;
            endcase
        end
    end

endmodule
