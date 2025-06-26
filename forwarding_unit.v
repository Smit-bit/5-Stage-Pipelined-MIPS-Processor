`timescale 1ns / 1ps

module forwarding_unit (
    input  wire        EX_MEM_RegWrite,
    input  wire [4:0]  EX_MEM_Rd,
    input  wire        MEM_WB_RegWrite,
    input  wire [4:0]  MEM_WB_Rd,
    input  wire [4:0]  ID_EX_Rs,
    input  wire [4:0]  ID_EX_Rt,

    output reg  [1:0]  ForwardA,
    output reg  [1:0]  ForwardB
);

    always @(*) begin
        // Default: no forwarding
        ForwardA = 2'b00;
        ForwardB = 2'b00;

        // EX hazard
        if (EX_MEM_RegWrite && (EX_MEM_Rd != 0) && (EX_MEM_Rd == ID_EX_Rs)) begin
            ForwardA = 2'b10;
        end

        if (EX_MEM_RegWrite && (EX_MEM_Rd != 0) && (EX_MEM_Rd == ID_EX_Rt)) begin
            ForwardB = 2'b10;
        end

        // MEM hazard
        if (MEM_WB_RegWrite && (MEM_WB_Rd != 0) && 
            ~(EX_MEM_RegWrite && (EX_MEM_Rd != 0) && (EX_MEM_Rd == ID_EX_Rs)) &&
            (MEM_WB_Rd == ID_EX_Rs)) begin
            ForwardA = 2'b01;
        end

        if (MEM_WB_RegWrite && (MEM_WB_Rd != 0) && 
            ~(EX_MEM_RegWrite && (EX_MEM_Rd != 0) && (EX_MEM_Rd == ID_EX_Rt)) &&
            (MEM_WB_Rd == ID_EX_Rt)) begin
            ForwardB = 2'b01;
        end
    end

endmodule
