`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 17:20:43
// Design Name: 
// Module Name: main_control
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

module main_control (
    input [5:0] opcode,
    output reg_dst, branch, mem_read, mem_to_reg,
    output [1:0] alu_op,
    output mem_write, alu_src, reg_write
);

    assign reg_dst    = (opcode == 6'b000000);           // R-type
    assign alu_src    = (opcode == 6'b100011) || (opcode == 6'b101011) || (opcode == 6'b001000); // lw, sw, addi
    assign mem_to_reg = (opcode == 6'b100011);           // lw
    assign reg_write  = (opcode == 6'b000000) || (opcode == 6'b100011) || (opcode == 6'b001000); // R-type, lw, addi
    assign mem_read   = (opcode == 6'b100011);           // lw
    assign mem_write  = (opcode == 6'b101011);           // sw
    assign branch     = (opcode == 6'b000100);           // beq
    assign alu_op     = (opcode == 6'b000000) ? 2'b10 :  // R-type
                        (opcode == 6'b000100) ? 2'b01 :  // beq
                        2'b00;                           // lw, sw, addi
endmodule
