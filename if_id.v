`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 17:44:49
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

module if_id (
    input  wire        clk,
    input  wire        rst,
    input  wire        enable,       // For stalling
    input  wire        flush,        // For branch taken (set instr to NOP)
    input  wire [31:0] instr_in,
    input  wire [31:0] pc_plus4_in,
    output reg  [31:0] instr_out,
    output reg  [31:0] pc_plus4_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instr_out      <= 32'b0;
            pc_plus4_out   <= 32'b0;
        end else if (flush) begin
            instr_out      <= 32'b0; // Insert NOP (like a bubble)
            pc_plus4_out   <= 32'b0;
        end else if (enable) begin
            instr_out      <= instr_in;
            pc_plus4_out   <= pc_plus4_in;
        end
        // else: hold current values (stall)
    end

endmodule

