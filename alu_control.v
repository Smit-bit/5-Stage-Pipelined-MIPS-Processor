`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 12:52:29
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

module alu_control (
    input  wire [1:0] ALUOp,
    input  wire [5:0] funct,
    output reg  [3:0] alu_ctrl
);

    always @(*) begin
        case ({ALUOp, funct})
            8'b10_100000: alu_ctrl = 4'b0010; // add
            8'b10_100010: alu_ctrl = 4'b0110; // sub
            8'b10_100100: alu_ctrl = 4'b0000; // and
            8'b10_100101: alu_ctrl = 4'b0001; // or
            8'b10_101010: alu_ctrl = 4'b0111; // slt
            8'b10_100111: alu_ctrl = 4'b1100; // nor

            default: begin
                case (ALUOp)
                    2'b00: alu_ctrl = 4'b0010; // lw/sw/addi: use add
                    2'b01: alu_ctrl = 4'b0110; // beq: use subtract
                    default: alu_ctrl = 4'b0000;
                endcase
            end
        endcase
    end

endmodule
