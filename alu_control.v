`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 17:21:07
// Design Name: 
// Module Name: alu_control
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
    input [1:0] alu_op,
    input [5:0] funct,
    output [3:0] alu_control
);

    assign alu_control =
        (alu_op == 2'b00) ? 4'b0010 : // lw, sw: ADD
        (alu_op == 2'b01) ? 4'b0110 : // beq: SUB
        (alu_op == 2'b10) ? (
            (funct == 6'b100000) ? 4'b0010 : // ADD
            (funct == 6'b100010) ? 4'b0110 : // SUB
            (funct == 6'b100100) ? 4'b0000 : // AND
            (funct == 6'b100101) ? 4'b0001 : // OR
            (funct == 6'b101010) ? 4'b0111 : // SLT
            (funct == 6'b100111) ? 4'b1100 : // NOR
            4'b1111 // Invalid
        ) : 4'b1111;
endmodule
