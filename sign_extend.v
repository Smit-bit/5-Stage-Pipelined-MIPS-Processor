`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2025 10:44:33
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

module sign_extend (
    input  wire [15:0] in,
    output wire [31:0] out
);

    assign out = {{16{in[15]}}, in};  // Sign-extend 16-bit to 32-bit
endmodule
