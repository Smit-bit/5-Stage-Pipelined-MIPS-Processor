`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 18:27:49
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

module data_mem (
    input wire clk,
    input wire mem_read,
    input wire mem_write,
    input wire [31:0] addr,           // Address to read/write
    input wire [31:0] write_data,     // Data to write (on sw)
    output reg [31:0] read_data       // Data to read (on lw)
);

    // Define a simple word-addressable RAM with 64 words
    reg [31:0] mem_array [0:63];
    
//    initial begin
//    $readmemh("data.mem", mem_array);
//    end

    // READ: combinational
    always @(*) begin
        if (mem_read)
            read_data = mem_array[addr[7:2]];  // word-aligned
        else
            read_data = 32'b0;
    end

    // WRITE: synchronous
    always @(posedge clk) begin
        if (mem_write)
            mem_array[addr[7:2]] <= write_data;
    end

endmodule

