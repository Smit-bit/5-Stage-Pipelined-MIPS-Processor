`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 14:32:29
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


module pc (
    input  wire        clk,
    input  wire        rst,
    input  wire        enable,       // PCWrite: allows stalling the PC
    input  wire [31:0] next_pc,
    output reg  [31:0] pc_out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc_out <= 32'b0;         // Reset: PC starts from 0
        else if (enable)
            pc_out <= next_pc;       // Normal update
        // else: hold current PC (stall)
    end

endmodule
