`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 15:02:39
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


module instr_mem (
    input  wire [31:0] addr,       // PC address
    output wire [31:0] instr       // Fetched instruction
);

    // Declare ROM with 64 words (each 32 bits = one instruction)
    reg [31:0] memory_array [0:63];

    // Initialize memory from a hex file
//    initial begin
//        $readmemh("program.mem", memory_array);
//    end

    // Use word-aligned address (ignore lower 2 bits)
    assign instr = memory_array[addr[7:2]];

endmodule
