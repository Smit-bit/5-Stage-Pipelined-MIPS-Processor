`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 14:12:29
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

module alu (
    input  wire [31:0] A,       // First operand
    input  wire [31:0] B,       // Second operand
    input  wire [3:0] alu_ctrl, // ALU control code
    output reg  [31:0] result,  // Result of the operation
    output wire zero            // Zero flag (used for branching)
);

    // Main ALU operations
    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = A & B;         // AND
            4'b0001: result = A | B;         // OR
            4'b0010: result = A + B;         // ADD
            4'b0110: result = A - B;         // SUB
            4'b0111: result = (A < B) ? 32'b1 : 32'b0; // SLT
            4'b1100: result = ~(A | B);      // NOR
            default: result = 32'b0;
        endcase
    end

    // Zero flag (used in branch instructions like BEQ)
    assign zero = (result == 32'b0);

endmodule
