`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 14:12:21
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

module reg_file (
    input wire clk,
    input wire reg_write,              // Control signal to enable writing
    input wire [4:0] rs, rt, rd,       // Register addresses
    input wire [31:0] write_data,      // Data to write to register rd
    output wire [31:0] read_data1,     // Contents of rs
    output wire [31:0] read_data2      // Contents of rt
);

    // 32 registers, 32 bits each
    reg [31:0] regs[0:31];
    integer i;

    // ----- SIMULATION-ONLY: Initialize registers to zero -----
    initial begin
        
        for (i = 0; i < 32; i = i + 1) begin
            regs[i] = 32'b0;
        end
    end

    // ----- READ LOGIC -----
    assign read_data1 = (rs == 5'd0) ? 32'b0 : regs[rs];
    assign read_data2 = (rt == 5'd0) ? 32'b0 : regs[rt];

    // ----- WRITE LOGIC -----
    always @(posedge clk) begin
        if (reg_write && rd != 5'd0) begin
            regs[rd] <= write_data;
        end
        // Always keep $zero hardwired to 0 (in simulation and hardware)
        regs[0] <= 32'b0;
    end

endmodule
