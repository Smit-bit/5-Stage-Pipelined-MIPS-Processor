`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 18:42:29
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


module hazard_unit (
    input  wire        ID_EX_MemRead,
    input  wire [4:0]  ID_EX_Rt,
    input  wire [4:0]  IF_ID_Rs,
    input  wire [4:0]  IF_ID_Rt,

    output reg         PCWrite,
    output reg         IF_ID_Write,
    output reg         ControlNOP
);

    always @(*) begin
        // Default: no stall
        PCWrite      = 1;
        IF_ID_Write  = 1;
        ControlNOP   = 0;

        // Detect lw-use hazard
        if (ID_EX_MemRead &&
            ((ID_EX_Rt == IF_ID_Rs) || (ID_EX_Rt == IF_ID_Rt))) begin
            // Stall the pipeline
            PCWrite      = 0;
            IF_ID_Write  = 0;
            ControlNOP   = 1;
        end
    end

endmodule
